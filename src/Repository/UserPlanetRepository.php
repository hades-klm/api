<?php

namespace App\Repository;

use App\Entity\UserPlanet;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method UserPlanet|null find($id, $lockMode = null, $lockVersion = null)
 * @method UserPlanet|null findOneBy(array $criteria, array $orderBy = null)
 * @method UserPlanet[]    findAll()
 * @method UserPlanet[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserPlanetRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UserPlanet::class);
    }

    // /**
    //  * @return UserPlanet[] Returns an array of UserPlanet objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?UserPlanet
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
