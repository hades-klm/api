<?php

namespace App\Controller;

use App\Service\ShipService;
use App\Service\UserService;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class LuckyController
{
    /**
     * @Route("/lucky/number/{max}", name="app_lucky_number")
     * @param $max
     * @param ShipService $shipService
     * @return Response
     */
    public function number($max, ShipService $shipService)
    {

        $ships = $shipService->getAllShips();
        $tableHtml = $shipService->makeShipTable($ships);

        return new Response(
            '<html><body>' . $tableHtml . '</body></html>'
        );
    }


    /**
     * @Route("/foei", name="app_foei")
     */
    public function foei(UserService $userService)
    {
        $recentUserTable = $userService->makeRecentUserTable();

        return new Response(
            '<html><body>' . $recentUserTable . '</body></html>'
        );
    }
}