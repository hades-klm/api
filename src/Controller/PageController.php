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

    /**
     * @Route("/admin", name="admin_test")
     */
    public function adminTest()
    {
        return $this->render('page/admintest.html.twig', []);
    }
}
