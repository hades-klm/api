<?php

namespace App\Security;

use App\Entity\User;
use App\Repository\UserRepository;
use KnpU\OAuth2ClientBundle\Client\ClientRegistry;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Guard\AbstractGuardAuthenticator;

class DiscordGuardAuthenticator extends AbstractGuardAuthenticator {

    private $client;
    private $em;
    private $ur;
    private $logger;

    public function __construct(ClientRegistry $clientRegistry, EntityManagerInterface $em, UserRepository $ur, LoggerInterface $logger)
    {
        $this->client = $clientRegistry->getClient('discord');
        $this->em = $em;
        $this->ur = $ur;
        $this->logger = $logger;
    }

    public function supports(Request $request)
    {
        return 'connect_discord_check' === $request->attributes->get('_route');
    }

    public function getCredentials(Request $request)
    {
        $token = $this->client->getAccessToken();

        return $token;
    }

    public function getUser($token, UserProviderInterface $userProvider)
    {
        $user = null;
        $discordUser = $this->client->fetchUserFromToken($token)->toArray();

        if( isset($discordUser) ) {
            $user = $this->ur->findOneBy(
                array('discordId' => $discordUser['id'])
            );
    
            if( !isset( $user ) ) {
                $isAllowed = false;
                $guilds = $this->getUserDiscordServerIds('https://discord.com/api/v6/users/@me/guilds', $token);
                $guilds = json_decode($guilds);
                foreach($guilds as $guild) {
                    if($guild->id === '390283009129054230') {
                        $isAllowed = true;
                        break;
                    }
                }

                if($isAllowed) {
                    $user = new User();
                    $user->setEmail($discordUser['email']);
                    $user->setRoles(['ROLE_USER']);
                    $user->setNickname($discordUser['username']);
                    $user->setDiscordId($discordUser['id']);
                    
                    $this->em->persist($user);
                    $this->em->flush();
                }
            }
        }

        return $user;
    }

    private function getUserDiscordServerIds($url, $token)
    {
        $opts = array(
            'http'=>array(
              'method' => "GET",
              'header' => "Authorization: Bearer " . $token->getToken()
            )
        );
        
        $context = stream_context_create($opts);
        $guilds = file_get_contents($url, false, $context);
        return $guilds;
    }

    public function checkCredentials($credentials, UserInterface $user)
    {
        return true;
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, $providerKey)
    {
        // on success, let the request continue
        return null;
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception)
    {
        $data = [
            // you may want to customize or obfuscate the message first
            //'message' => strtr($exception->getMessageKey(), $exception->getMessageData())
            'message' => strtr('Forbidden (403), you are not authorized to login with your Discord ID.', [])

            // or to translate this message
            // $this->translator->trans($exception->getMessageKey(), $exception->getMessageData())
        ];

        return new JsonResponse($data, Response::HTTP_FORBIDDEN);
    }

    public function start(Request $request, AuthenticationException $authException = null)
    {
        $data = [
            // you might translate this message
            'message' => 'Authentication Required'
        ];

        return new JsonResponse($data, Response::HTTP_UNAUTHORIZED);
    }

    public function supportsRememberMe()
    {
        return false;
    }
}