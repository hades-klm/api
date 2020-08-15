<?php

namespace App\Service;

use App\Repository\UserRepository;

class UserService
{

    private $userRepository;

    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * @return string
     */
    public function makeRecentUserTable(){

        $recentUsers = $this->userRepository->findBy([
            'recentActivity' => true
        ]);

        $html = '';

        foreach($recentUsers as $user){
            $html .= '<tr>';
            $html .= '<td>'.$user->getNickname().'</td>';
            $html .= '<td>'.$user->getEmail().'</td>';
            $html .= '</tr>';
        }

        return '<table>'.$html.'</table>';
    }
}