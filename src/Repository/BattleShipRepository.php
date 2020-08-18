<?php

namespace App\Repository;

use App\Entity\BattleShip;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method BattleShip|null find($id, $lockMode = null, $lockVersion = null)
 * @method BattleShip|null findOneBy(array $criteria, array $orderBy = null)
 * @method BattleShip[]    findAll()
 * @method BattleShip[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BattleShipRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BattleShip::class);
    }

    // /**
    //  * @return BattleShip[] Returns an array of BattleShip objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('b.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?BattleShip
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
