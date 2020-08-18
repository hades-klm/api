<?php

namespace App\Enum;

abstract class ShipType
{
    const BATTLESHIP = 'battleship';
    const TRANSPORT = 'transport';
    const MINER = 'miner';

    /** @var array user friendly named type */
    protected static $typeName = [
        self::BATTLESHIP => 'Battleship',
        self::TRANSPORT => 'Transport',
        self::MINER => 'Miner',
    ];

    /**
     * @param  string $typeShortName
     * @return string
     */
    public static function getTypeName($typeShortName)
    {
        if (!isset(static::$typeName[$typeShortName])) {
            return "Unknown type ($typeShortName)";
        }

        return static::$typeName[$typeShortName];
    }

    /**
     * @return array<string>
     */
    public static function getAvailableTypes()
    {
        return [
            self::BATTLESHIP,
            self::TRANSPORT,
            self::MINER,
        ];
    }
}