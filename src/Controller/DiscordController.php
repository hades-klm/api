<?php

namespace App\Controller;

use KnpU\OAuth2ClientBundle\Client\ClientRegistry;
use League\OAuth2\Client\Provider\Exception\IdentityProviderException;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class DiscordController extends AbstractController
{
    /**
     * Link to this controller to start the "connect" process
     *
     * @Route("/connect/discord", name="connect_discord_start")
     */
    public function connectAction(ClientRegistry $clientRegistry)
    {
        // on Symfony 3.3 or lower, $clientRegistry = $this->get('knpu.oauth2.registry');

        // will redirect to Discord!
        return $clientRegistry
            ->getClient('discord') // key used in config/packages/knpu_oauth2_client.yaml
            ->redirect([
                'identify',
                'email',
                'guilds' // the scopes you want to access
            ]);
    }

    /**
     * After going to Discord, you're redirected back here
     * because this is the "redirect_route" you configured
     * in config/packages/knpu_oauth2_client.yaml
     *
     * @Route("/connect/discord/check", name="connect_discord_check")
     */
    public function connectCheckAction(Request $request, ClientRegistry $clientRegistry)
    {
        // ** if you want to *authenticate* the user, then
        // leave this method blank and create a Guard authenticator

        /** @var \KnpU\OAuth2ClientBundle\Client\Provider\DiscordClient $client */
        $client = $clientRegistry->getClient('discord');

        try {
            $token = $client->getAccessToken();
            var_dump($token);
            
            // the exact class depends on which provider you're using
            /** @var \Wohali\OAuth2\Client\Provider\DiscordResourceOwner|\League\OAuth2\Client\Provider\ResourceOwnerInterface $user */
            $user = $client->fetchUserFromToken($token);
            // do something with all this new power!
            var_dump($user);

            $opts = array(
                'http'=>array(
                  'method' => "GET",
                  'header' => "Authorization: Bearer " . $token->getToken()
                )
            );
            
            $context = stream_context_create($opts);
            
            // GET the results by using the HTTP headers set above
            $guilds = file_get_contents('https://discord.com/api/v6/users/@me/guilds', false, $context);
            var_dump(json_decode($guilds));
            die;
        } catch (IdentityProviderException $e) {
            // something went wrong!
            // probably you should return the reason to the user
            var_dump($e->getMessage());
            die;
        }
    }
}