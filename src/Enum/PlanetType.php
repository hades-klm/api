<?php

namespace App\Enum;

abstract class PlanetType
{
    const DESSERT = 'dessert';
    const WATER = 'water';
    const TERRAN = 'terran';
    const GAS = 'gas';

    /** @var array user friendly named type */
    protected static $typeName = [
        self::DESSERT => 'Dessert',
        self::WATER => 'Water',
        self::TERRAN => 'Terran',
        self::GAS => 'Gas',
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
            self::DESSERT,
            self::WATER,
            self::TERRAN,
            self::GAS,
        ];
    }
}