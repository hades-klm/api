<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class PageController extends AbstractController
{
    /**
     * @Route("/", name="page")
     */
    public function index()
    {
        return $this->render('page/homepage.html.twig', [
            'controller_name' => 'PageController',
        ]);
    }
}
