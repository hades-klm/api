-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 11 aug 2020 om 16:04
-- Serverversie: 10.1.33-MariaDB
-- PHP-versie: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klm`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `achievements`
--

CREATE TABLE `achievements` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `goalType` varchar(50) NOT NULL,
  `goal` varchar(50) NOT NULL,
  `rewardCrystals` int(11) NOT NULL COMMENT 'Crystals',
  `rewardXp` int(11) NOT NULL COMMENT 'XP'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `alliancelevels`
--

CREATE TABLE `alliancelevels` (
  `level` int(11) NOT NULL,
  `relicsRequired` int(11) NOT NULL COMMENT 'Relics',
  `maxMembers` int(11) NOT NULL COMMENT 'Members',
  `passiveIncomeModifier` decimal(5,4) NOT NULL COMMENT 'Multiplier',
  `artifactsYieldModifier` decimal(5,4) NOT NULL COMMENT 'Multiplier',
  `maxFlagshipLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artifacts`
--

CREATE TABLE `artifacts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `blueprintsTypes` varchar(50) NOT NULL,
  `colorR` int(11) NOT NULL,
  `colorG` int(11) NOT NULL,
  `colorB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artifactslevels`
--

CREATE TABLE `artifactslevels` (
  `id` int(11) NOT NULL,
  `artifact` int(11) NOT NULL,
  `priceInCrystals` int(11) NOT NULL COMMENT 'Crystals',
  `rsLevelRequired` int(11) NOT NULL,
  `slotsUsed` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `maxAwardLevel` int(11) NOT NULL,
  `salvageCredits` int(11) NOT NULL COMMENT 'Crystals',
  `salvageHydrogen` int(11) NOT NULL COMMENT 'Hydrogen',
  `timeToLoad` int(11) NOT NULL COMMENT 'Seconds',
  `timeToResearch` int(11) NOT NULL COMMENT 'Seconds',
  `xp` int(11) NOT NULL COMMENT 'XP',
  `creditsMin` int(11) NOT NULL COMMENT 'Credits',
  `creditsMax` int(11) NOT NULL COMMENT 'Credits',
  `hydrogenMin` int(11) NOT NULL COMMENT 'Hydrogen',
  `hydrogenMax` int(11) NOT NULL COMMENT 'Hydrogen',
  `blueprintsMin` varchar(50) NOT NULL,
  `blueprintsMax` varchar(50) NOT NULL,
  `influencePoints` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bluestarsectors`
--

CREATE TABLE `bluestarsectors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `astroidsMin` int(11) NOT NULL,
  `astroidsMax` int(11) NOT NULL,
  `cerbGroupRS3` int(11) DEFAULT NULL,
  `cerbGroupRS4` int(11) DEFAULT NULL,
  `cerbGroupRS5` int(11) DEFAULT NULL,
  `cerbGroupRS6` int(11) DEFAULT NULL,
  `cerbGroupRS7` int(11) DEFAULT NULL,
  `cerbGroupRS8` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cerberusgroups`
--

CREATE TABLE `cerberusgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sentinels` varchar(50) DEFAULT NULL,
  `guardians` varchar(50) DEFAULT NULL,
  `interceptors` varchar(50) DEFAULT NULL,
  `colossus` varchar(50) DEFAULT NULL,
  `phoenix` varchar(50) DEFAULT NULL,
  `bomber` varchar(50) DEFAULT NULL,
  `storm` varchar(50) DEFAULT NULL,
  `hydra` varchar(50) DEFAULT NULL,
  `weightPerPlayer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cerberusstations`
--

CREATE TABLE `cerberusstations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `spawnInterval` int(11) NOT NULL COMMENT 'Seconds',
  `shipsToSpawn` int(11) NOT NULL,
  `maxHP` int(11) NOT NULL COMMENT 'Hitpoints',
  `maxShield` int(11) NOT NULL COMMENT 'Hitpoints',
  `dps` int(11) NOT NULL COMMENT 'Hitpoints / Seconds',
  `attackRange` int(11) NOT NULL COMMENT 'AU',
  `shieldRegen` int(11) NOT NULL COMMENT 'Hitpoints / Minute',
  `shieldRegenTimeAfterDamage` int(11) NOT NULL COMMENT 'Seconds',
  `maxShips` int(11) NOT NULL,
  `xp` int(11) NOT NULL COMMENT 'XP'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `colonizeprices`
--

CREATE TABLE `colonizeprices` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `credits` int(11) NOT NULL COMMENT 'Credits'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `globals`
--

CREATE TABLE `globals` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL COMMENT 'table name',
  `action` varchar(50) NOT NULL COMMENT 'add, edit, delete',
  `user` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `awardLevel` int(11) NOT NULL,
  `slotType` varchar(50) NOT NULL COMMENT 'Trade, Mining, Shield, Weapon, Support',
  `activationHydrogenOnBoard` int(11) DEFAULT NULL COMMENT 'Hydrogen',
  `activationPreperation` int(11) DEFAULT NULL COMMENT 'Seconds',
  `activationPreperationBS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `hpThreshold` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `applyAOEDamageOnDestroy` tinyint(1) DEFAULT NULL,
  `maxImpulse` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `shieldRegenerationDelay` int(11) DEFAULT NULL COMMENT 'Seconds',
  `timeToFullyRegenerate` int(11) DEFAULT NULL COMMENT 'Seconds',
  `maxDPSTime` int(11) DEFAULT NULL COMMENT 'Seconds',
  `maxDPSTimeBS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `spawnLifetime` int(11) DEFAULT NULL COMMENT 'Seconds',
  `spawnLifetimeWS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `useOnWSJumpgate` tinyint(1) DEFAULT NULL,
  `targetSwitchTicks` int(11) DEFAULT NULL COMMENT 'Ticks',
  `minPublicRSLevel` int(11) DEFAULT NULL,
  `reqEnemyShipsInSector` tinyint(1) DEFAULT NULL,
  `bsOnly` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `moduleslevels`
--

CREATE TABLE `moduleslevels` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `unlockBlueprints` int(11) DEFAULT NULL,
  `unlockPrice` int(11) DEFAULT NULL COMMENT 'Credits',
  `unlockTime` int(11) DEFAULT NULL COMMENT 'Seconds',
  `activationType` varchar(50) DEFAULT NULL COMMENT 'Activated, Passive',
  `activationPreperationPerItem` int(11) DEFAULT NULL COMMENT 'Seconds',
  `disableActivationDuringPreperation` tinyint(1) DEFAULT NULL,
  `activationPreperationWS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `weaponEffectType` varchar(50) DEFAULT NULL,
  `cooldown` int(11) DEFAULT NULL COMMENT 'Seconds',
  `effectRadius` int(11) DEFAULT NULL COMMENT 'AU',
  `effectRadiusWS` int(11) DEFAULT NULL COMMENT 'AU',
  `effectRadiusBS` int(11) DEFAULT NULL COMMENT 'AU',
  `speedIncrease` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `areaOfEffectDamage` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `areaOfEffectDamageWS` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `areaOfEffectDamageBS` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `effectDuration` int(11) DEFAULT NULL COMMENT 'Seconds',
  `effectDurationWS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `effectDurationBS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `hydrogenUploaded` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `shipmentBonus` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `extraTradeSlots` int(11) DEFAULT NULL,
  `miningSpeed` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `extraHydrogenStorage` int(11) DEFAULT NULL COMMENT 'Hydrogen',
  `shieldStrength` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `unityBoost` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `dps` int(11) DEFAULT NULL COMMENT 'Hitpoints / Second',
  `additionalDPSPerTarget` int(11) DEFAULT NULL COMMENT 'Hitpoints / Second',
  `maxDPS` int(11) DEFAULT NULL COMMENT 'Hitpoints / Second',
  `timeWarpFactor` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `damageReduction` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `redStarLifeExtension` int(11) DEFAULT NULL COMMENT 'Seconds',
  `repairHPPerSecond` int(11) DEFAULT NULL COMMENT 'Hitpoints / Second',
  `salvageHPPercentage` varchar(50) DEFAULT NULL COMMENT '! Splitted Value (/100 Percentage)',
  `mirrorDamage` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `maxTargets` int(11) DEFAULT NULL,
  `shipmentsThreshold` int(11) DEFAULT NULL,
  `teleportShipments` int(11) DEFAULT NULL,
  `payout` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `hydrogenIncrease` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `speedIncreasePerShipment` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `instantHydrogenCollected` int(11) DEFAULT NULL,
  `maxNewAsteroids` int(11) DEFAULT NULL,
  `hydrogenPerNewAsteroid` int(11) DEFAULT NULL COMMENT 'Hydrogen',
  `shipmentCapacity` int(11) DEFAULT NULL,
  `droneShipmentBonus` int(11) DEFAULT NULL COMMENT 'Fraction / Multiplier',
  `activationCost` int(11) DEFAULT NULL COMMENT 'Hydrogen',
  `additionalHydrogenUse` int(11) DEFAULT NULL COMMENT 'Hydrogen / 100 AU',
  `buildCost` int(11) DEFAULT NULL COMMENT 'Credits',
  `whiteStarScore` int(11) DEFAULT NULL,
  `blueStarScore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `objectives`
--

CREATE TABLE `objectives` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `goalType` varchar(50) DEFAULT NULL,
  `appearsOnlyOnce` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `objectiveslevels`
--

CREATE TABLE `objectiveslevels` (
  `id` int(11) NOT NULL,
  `objective` int(11) NOT NULL,
  `timeLimitDays` int(11) DEFAULT NULL COMMENT 'Days',
  `timeLimitHours` int(11) DEFAULT NULL COMMENT 'Hours',
  `timeLimitMinutes` int(11) DEFAULT NULL COMMENT 'Minutes',
  `minRSLevel` int(11) DEFAULT NULL,
  `maxRSLevel` int(11) DEFAULT NULL,
  `minPlayerLevel` int(11) DEFAULT NULL,
  `maxPlayerLevel` int(11) DEFAULT NULL,
  `minInfluence` int(11) DEFAULT NULL,
  `maxInfluence` int(11) DEFAULT NULL,
  `goalTarget` int(11) DEFAULT NULL,
  `xpReward` int(11) DEFAULT NULL,
  `creditsRewardPerDay` int(11) DEFAULT NULL COMMENT 'Credits / Day',
  `hydrogenRewardPerDay` int(11) DEFAULT NULL COMMENT 'Hydrogen / Day',
  `crystalReward` int(11) DEFAULT NULL COMMENT 'Crystals'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `planetlevels`
--

CREATE TABLE `planetlevels` (
  `level` int(11) NOT NULL,
  `upgradeCost` int(11) NOT NULL COMMENT 'Credits',
  `creditStorage` int(11) NOT NULL COMMENT 'Credits',
  `hydrogenStorage` int(11) NOT NULL COMMENT 'Hydrogen',
  `xpReward` int(11) NOT NULL COMMENT 'XP',
  `creditsPerHour` int(11) NOT NULL COMMENT 'Credits / Hour',
  `hydrogenPerHour` int(11) NOT NULL COMMENT 'Hydrogen / Hour',
  `shipmentsCreditValue` int(11) NOT NULL COMMENT 'Credits / Day',
  `upgradeTime` int(11) NOT NULL COMMENT 'Seconds',
  `crystalsWeight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `planets`
--

CREATE TABLE `planets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `maxLevel` int(11) NOT NULL,
  `creditIncomeModifier` int(11) NOT NULL,
  `hydrogenIncomeModifier` int(11) NOT NULL,
  `creditStorageModifier` int(11) NOT NULL,
  `hydrogenStorageModifier` int(11) NOT NULL,
  `creditShipmentModifier` int(11) NOT NULL,
  `hydrogenShipmentModifier` int(11) NOT NULL,
  `maxShipments` int(11) NOT NULL,
  `shipmentsPerHour` int(11) NOT NULL,
  `ticksPerRelic` int(11) DEFAULT NULL,
  `hydrogenPerRelic` int(11) DEFAULT NULL COMMENT 'Hydrogen'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectiles`
--

CREATE TABLE `projectiles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `speed` int(11) NOT NULL COMMENT 'AU / Minute',
  `proximityTriggerSec` int(11) DEFAULT NULL COMMENT 'Seconds',
  `damageRange` int(11) DEFAULT NULL COMMENT 'AU',
  `damageRangeWhenNeutralized` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `additionalWaypoint` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectileslevels`
--

CREATE TABLE `projectileslevels` (
  `id` int(11) NOT NULL,
  `projectile` int(11) NOT NULL,
  `hitpoints` int(11) NOT NULL COMMENT 'Hitpoints',
  `damage` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `damageWhenNeutralized` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `disableTime` int(11) DEFAULT NULL COMMENT 'Seconds'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `redstarsectors`
--

CREATE TABLE `redstarsectors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `asteroidsMin` int(11) DEFAULT NULL,
  `asteroidsMax` int(11) DEFAULT NULL,
  `hydrogenPerDay` int(11) DEFAULT NULL COMMENT 'Hydrogen / Day',
  `asteroidBeltAxis1Size` int(11) DEFAULT NULL COMMENT 'AU',
  `asteroidBeltAxis2Size` int(11) DEFAULT NULL COMMENT 'AU',
  `cerbGroup` varchar(50) DEFAULT NULL,
  `minArtifacts` int(11) DEFAULT NULL,
  `maxArtifacts` int(11) DEFAULT NULL,
  `ghostsSpawnWeight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ships`
--

CREATE TABLE `ships` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `requiredPlanetLevel` int(11) DEFAULT NULL,
  `intialModules` varchar(50) DEFAULT NULL,
  `initialModuleLevels` varchar(50) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL COMMENT 'AU / minute',
  `shipAIHandler` int(11) DEFAULT NULL,
  `docketObjectDestroyTime` int(11) DEFAULT NULL COMMENT 'Seconds',
  `aiUpdateIntervalSeconds` int(11) DEFAULT NULL COMMENT 'Seconds',
  `agressiveAI` tinyint(1) DEFAULT NULL,
  `influencePoints` int(11) DEFAULT NULL,
  `whiteStarScore` int(11) DEFAULT NULL,
  `blueStarScore` int(11) DEFAULT NULL,
  `bsPenaltyPerSecOnSector` int(11) DEFAULT NULL,
  `onDestroySpawn` int(11) DEFAULT NULL,
  `onDestroySpawnCount` int(11) DEFAULT NULL,
  `onDestroySpawnMinRadius` int(11) DEFAULT NULL COMMENT 'AU',
  `onDestroySpawnMaxRadius` int(11) DEFAULT NULL COMMENT 'AU',
  `maxPerStarSystem` int(11) DEFAULT NULL,
  `empResist` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shipslevels`
--

CREATE TABLE `shipslevels` (
  `id` int(11) NOT NULL,
  `ship` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `moduleSlots` varchar(50) DEFAULT NULL,
  `buildCost` int(11) DEFAULT NULL COMMENT 'Credits',
  `upgradeCost` int(11) DEFAULT NULL COMMENT 'Credits',
  `upgradeTime` int(11) DEFAULT NULL COMMENT 'Seconds',
  `hitpoints` int(11) DEFAULT NULL COMMENT 'Hitpoints',
  `healRate` int(11) DEFAULT NULL COMMENT 'Hitpoints / Minute',
  `sectorsToMine` int(11) DEFAULT NULL,
  `flagshipModules` varchar(50) DEFAULT NULL,
  `flagshipModuleLevels` varchar(50) DEFAULT NULL,
  `jobCapacity` int(11) DEFAULT NULL,
  `hydrogenCapacity` int(11) DEFAULT NULL COMMENT 'Hydrogen',
  `miningDuration` int(11) DEFAULT NULL COMMENT 'Seconds',
  `miningDurationWS` int(11) DEFAULT NULL COMMENT 'Seconds',
  `hydrogenUse` int(11) DEFAULT NULL COMMENT 'Hydrogen / 100 AU',
  `jumpCost` int(11) DEFAULT NULL COMMENT 'Hydrogen',
  `bsPenaltyPerSec` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `solarsystems`
--

CREATE TABLE `solarsystems` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lifetime` int(11) NOT NULL COMMENT 'Seconds',
  `minPlayers` int(11) DEFAULT NULL,
  `star` varchar(50) NOT NULL,
  `playerNumberBrackets` varchar(50) DEFAULT NULL,
  `hqPlanetsPerBracket` varchar(50) DEFAULT NULL,
  `lqPlanetsPerBracket` varchar(50) DEFAULT NULL,
  `collapseAreaSize` varchar(50) DEFAULT NULL,
  `collapseReductionPerCycle` varchar(50) DEFAULT NULL,
  `cycleTicks` varchar(50) DEFAULT NULL,
  `stageStartSec` varchar(50) DEFAULT NULL,
  `starSectorDPS` int(11) DEFAULT NULL,
  `score1Thresholds` varchar(50) DEFAULT NULL,
  `score2Thresholds` varchar(50) DEFAULT NULL,
  `score3Thresholds` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `solarsystemslevels`
--

CREATE TABLE `solarsystemslevels` (
  `id` int(11) NOT NULL,
  `solarSystem` int(11) NOT NULL,
  `hexGridSizeX` int(11) NOT NULL,
  `hexGridSizeY` int(11) NOT NULL,
  `hexCellEdgeSize` int(11) NOT NULL,
  `numPlayersWithAccess` int(11) DEFAULT NULL,
  `maxBattleshipsPerPlayer` int(11) DEFAULT NULL,
  `hydrogenSearchCost` int(11) DEFAULT NULL,
  `creditsAsteroidsAmount` int(11) DEFAULT NULL,
  `destroyersToSpawn` int(11) DEFAULT NULL,
  `numMaxPlanets` int(11) DEFAULT NULL,
  `numLowerPlanetsMin` int(11) DEFAULT NULL,
  `numLowerPlanetsMax` int(11) DEFAULT NULL,
  `medRiskMiningMin` int(11) DEFAULT NULL,
  `medRiskMiningMax` int(11) DEFAULT NULL,
  `highRiskMiningMin` int(11) DEFAULT NULL,
  `highRiskMiningMax` int(11) DEFAULT NULL,
  `minInfluence` int(11) DEFAULT NULL,
  `regularInfluenceRangeMin` int(11) DEFAULT NULL,
  `regularInfluenceRangeMax` int(11) DEFAULT NULL,
  `maxInfluence` int(11) DEFAULT NULL,
  `influencePointsThresholdMIn` int(11) DEFAULT NULL,
  `influencePointsThresholdMax` int(11) DEFAULT NULL,
  `maxInfluenceLoss` int(11) DEFAULT NULL,
  `maxInfluenceGain` int(11) DEFAULT NULL,
  `minBombersmaxPlanetBomberCoverage` int(11) DEFAULT NULL,
  `maxGateBomberCoverage` int(11) DEFAULT NULL,
  `ghostSpawnSecs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `spacebuildings`
--

CREATE TABLE `spacebuildings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `cancelBuildRefundPercentage` int(11) DEFAULT NULL,
  `moveHydrogenCostPerSector` int(11) DEFAULT NULL,
  `requiredPlanetLevel` int(11) DEFAULT NULL,
  `buildCost` int(11) DEFAULT NULL,
  `timeSpeedUpMaxSeconds` int(11) DEFAULT NULL,
  `timeSpeedupRegenPerDay` int(11) DEFAULT NULL,
  `requiresEmptySector` tinyint(1) DEFAULT NULL,
  `maxPerSolarSystem` int(11) DEFAULT NULL,
  `maxPerSector` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `spacebuildingslevels`
--

CREATE TABLE `spacebuildingslevels` (
  `id` int(11) NOT NULL,
  `spaceBuilding` int(11) NOT NULL,
  `timeSpeedPercentage` int(11) DEFAULT NULL,
  `sectorUnlockCost` int(11) DEFAULT NULL,
  `sectorUnlockTime` int(11) DEFAULT NULL,
  `constructionTimeHours` int(11) DEFAULT NULL,
  `constructionTimeMinutes` int(11) DEFAULT NULL,
  `constructionTimeSeconds` int(11) DEFAULT NULL,
  `totalShipmentCreditsCreationPerDay` int(11) DEFAULT NULL,
  `shipyardCapacity` int(11) DEFAULT NULL,
  `teleportShipmentsPerHour` int(11) DEFAULT NULL,
  `shipmnetRelayDurationHour` int(11) DEFAULT NULL,
  `shipmentRelayActivationFragments` int(11) DEFAULT NULL,
  `fragmentCapacity` int(11) DEFAULT NULL,
  `shipmentRelayMaxSectors` int(11) DEFAULT NULL,
  `shipmentRelayActivationHydrogen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `discordId` int(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `creditCap` int(11) DEFAULT NULL,
  `influence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `whitestarsectors`
--

CREATE TABLE `whitestarsectors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `asteroidsMin` int(11) NOT NULL,
  `asteroidsMax` int(11) NOT NULL,
  `hydrogen` int(11) NOT NULL,
  `asteroidBeltAxis1Size` int(11) NOT NULL,
  `asteroidBeltAxis2Size` int(11) NOT NULL,
  `cerbGroup` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `xplevels`
--

CREATE TABLE `xplevels` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `xp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `yellowstarsectors`
--

CREATE TABLE `yellowstarsectors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `minScannerLevel` int(11) NOT NULL,
  `planetTypes` int(11) DEFAULT NULL,
  `minPlanetDistanceFromCenter` int(11) DEFAULT NULL,
  `maxPlanetDistanceFromCenter` int(11) DEFAULT NULL,
  `numMoons` int(11) DEFAULT NULL,
  `asteroidsMin` int(11) NOT NULL,
  `asteroidsMax` int(11) NOT NULL,
  `hydrogenPerDay` int(11) NOT NULL,
  `asteroidBeltAxis1Size` int(11) NOT NULL,
  `asteroidBeltAxis2Size` int(11) NOT NULL,
  `cerbGroup` varchar(50) NOT NULL,
  `numBases` int(11) DEFAULT NULL,
  `baseType` varchar(50) DEFAULT NULL,
  `bsAnomaly` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `alliancelevels`
--
ALTER TABLE `alliancelevels`
  ADD PRIMARY KEY (`level`) USING BTREE;

--
-- Indexen voor tabel `artifacts`
--
ALTER TABLE `artifacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `artifactslevels`
--
ALTER TABLE `artifactslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artifact` (`artifact`);

--
-- Indexen voor tabel `bluestarsectors`
--
ALTER TABLE `bluestarsectors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `cerbGroupRS3` (`cerbGroupRS3`),
  ADD KEY `cerbGroupRS4` (`cerbGroupRS4`),
  ADD KEY `cerbGroupRS5` (`cerbGroupRS5`),
  ADD KEY `cerbGroupRS6` (`cerbGroupRS6`),
  ADD KEY `cerbGroupRS7` (`cerbGroupRS7`),
  ADD KEY `cerbGroupRS8` (`cerbGroupRS8`);

--
-- Indexen voor tabel `cerberusgroups`
--
ALTER TABLE `cerberusgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `cerberusstations`
--
ALTER TABLE `cerberusstations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `shipsToSpawn` (`shipsToSpawn`);

--
-- Indexen voor tabel `colonizeprices`
--
ALTER TABLE `colonizeprices`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `globals`
--
ALTER TABLE `globals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indexen voor tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `moduleslevels`
--
ALTER TABLE `moduleslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`);

--
-- Indexen voor tabel `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `objectiveslevels`
--
ALTER TABLE `objectiveslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `objective` (`objective`);

--
-- Indexen voor tabel `planetlevels`
--
ALTER TABLE `planetlevels`
  ADD PRIMARY KEY (`level`);

--
-- Indexen voor tabel `planets`
--
ALTER TABLE `planets`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `projectiles`
--
ALTER TABLE `projectiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `projectileslevels`
--
ALTER TABLE `projectileslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectile` (`projectile`);

--
-- Indexen voor tabel `redstarsectors`
--
ALTER TABLE `redstarsectors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `cerbGroup` (`cerbGroup`);

--
-- Indexen voor tabel `ships`
--
ALTER TABLE `ships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `onDestroySpawn` (`onDestroySpawn`);

--
-- Indexen voor tabel `shipslevels`
--
ALTER TABLE `shipslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ship` (`ship`);

--
-- Indexen voor tabel `solarsystems`
--
ALTER TABLE `solarsystems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `solarsystemslevels`
--
ALTER TABLE `solarsystemslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solarSystem` (`solarSystem`);

--
-- Indexen voor tabel `spacebuildings`
--
ALTER TABLE `spacebuildings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `spacebuildingslevels`
--
ALTER TABLE `spacebuildingslevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spaceBuilding` (`spaceBuilding`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `whitestarsectors`
--
ALTER TABLE `whitestarsectors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `cerbGroup` (`cerbGroup`);

--
-- Indexen voor tabel `xplevels`
--
ALTER TABLE `xplevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level` (`level`),
  ADD UNIQUE KEY `xp` (`xp`);

--
-- Indexen voor tabel `yellowstarsectors`
--
ALTER TABLE `yellowstarsectors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `cerbGroup` (`cerbGroup`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `alliancelevels`
--
ALTER TABLE `alliancelevels`
  MODIFY `level` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `artifacts`
--
ALTER TABLE `artifacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `artifactslevels`
--
ALTER TABLE `artifactslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `bluestarsectors`
--
ALTER TABLE `bluestarsectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `cerberusgroups`
--
ALTER TABLE `cerberusgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `cerberusstations`
--
ALTER TABLE `cerberusstations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `colonizeprices`
--
ALTER TABLE `colonizeprices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `globals`
--
ALTER TABLE `globals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `moduleslevels`
--
ALTER TABLE `moduleslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `objectives`
--
ALTER TABLE `objectives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `objectiveslevels`
--
ALTER TABLE `objectiveslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `planetlevels`
--
ALTER TABLE `planetlevels`
  MODIFY `level` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `planets`
--
ALTER TABLE `planets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `projectiles`
--
ALTER TABLE `projectiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `projectileslevels`
--
ALTER TABLE `projectileslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `redstarsectors`
--
ALTER TABLE `redstarsectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `ships`
--
ALTER TABLE `ships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `shipslevels`
--
ALTER TABLE `shipslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `solarsystems`
--
ALTER TABLE `solarsystems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `solarsystemslevels`
--
ALTER TABLE `solarsystemslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `spacebuildings`
--
ALTER TABLE `spacebuildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `spacebuildingslevels`
--
ALTER TABLE `spacebuildingslevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `whitestarsectors`
--
ALTER TABLE `whitestarsectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `xplevels`
--
ALTER TABLE `xplevels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `yellowstarsectors`
--
ALTER TABLE `yellowstarsectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `artifactslevels`
--
ALTER TABLE `artifactslevels`
  ADD CONSTRAINT `artifactslevels_ibfk_1` FOREIGN KEY (`artifact`) REFERENCES `artifacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `bluestarsectors`
--
ALTER TABLE `bluestarsectors`
  ADD CONSTRAINT `bluestarsectors_ibfk_1` FOREIGN KEY (`cerbGroupRS3`) REFERENCES `cerberusgroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bluestarsectors_ibfk_2` FOREIGN KEY (`cerbGroupRS4`) REFERENCES `cerberusgroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bluestarsectors_ibfk_3` FOREIGN KEY (`cerbGroupRS5`) REFERENCES `cerberusgroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bluestarsectors_ibfk_4` FOREIGN KEY (`cerbGroupRS6`) REFERENCES `cerberusgroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bluestarsectors_ibfk_5` FOREIGN KEY (`cerbGroupRS7`) REFERENCES `cerberusgroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bluestarsectors_ibfk_6` FOREIGN KEY (`cerbGroupRS8`) REFERENCES `cerberusgroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `cerberusstations`
--
ALTER TABLE `cerberusstations`
  ADD CONSTRAINT `cerberusstations_ibfk_1` FOREIGN KEY (`shipsToSpawn`) REFERENCES `ships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `moduleslevels`
--
ALTER TABLE `moduleslevels`
  ADD CONSTRAINT `moduleslevels_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `objectiveslevels`
--
ALTER TABLE `objectiveslevels`
  ADD CONSTRAINT `objectiveslevels_ibfk_1` FOREIGN KEY (`objective`) REFERENCES `objectives` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `projectileslevels`
--
ALTER TABLE `projectileslevels`
  ADD CONSTRAINT `projectileslevels_ibfk_1` FOREIGN KEY (`projectile`) REFERENCES `projectiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `redstarsectors`
--
ALTER TABLE `redstarsectors`
  ADD CONSTRAINT `redstarsectors_ibfk_1` FOREIGN KEY (`cerbGroup`) REFERENCES `cerberusgroups` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `ships`
--
ALTER TABLE `ships`
  ADD CONSTRAINT `ships_ibfk_1` FOREIGN KEY (`onDestroySpawn`) REFERENCES `ships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `shipslevels`
--
ALTER TABLE `shipslevels`
  ADD CONSTRAINT `shipslevels_ibfk_1` FOREIGN KEY (`ship`) REFERENCES `ships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `solarsystemslevels`
--
ALTER TABLE `solarsystemslevels`
  ADD CONSTRAINT `solarsystemslevels_ibfk_1` FOREIGN KEY (`solarSystem`) REFERENCES `solarsystems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `spacebuildingslevels`
--
ALTER TABLE `spacebuildingslevels`
  ADD CONSTRAINT `spacebuildingslevels_ibfk_1` FOREIGN KEY (`spaceBuilding`) REFERENCES `spacebuildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `whitestarsectors`
--
ALTER TABLE `whitestarsectors`
  ADD CONSTRAINT `whitestarsectors_ibfk_4` FOREIGN KEY (`cerbGroup`) REFERENCES `cerberusgroups` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `yellowstarsectors`
--
ALTER TABLE `yellowstarsectors`
  ADD CONSTRAINT `yellowstarsectors_ibfk_4` FOREIGN KEY (`cerbGroup`) REFERENCES `cerberusgroups` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
