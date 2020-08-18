<?php

namespace App\Entity;

use App\Enum\ShipType;
use App\Repository\ShipRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ShipRepository::class)
 */
class Ship
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $type;

    /**
     * @ORM\Column(type="integer", options={"default" : 0})
     */
    private $maxShieldModules = 0;

    /**
     * @ORM\Column(type="integer", options={"default" : 0})
     */
    private $maxSupportModules = 0;

    /**
     * @ORM\Column(type="integer", options={"default" : 0})
     */
    private $maxWeaponModules = 0;


    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return null|string
     */
    public function getType(): string
    {
        return $this->type;
    }

    /**
     * @param string $type
     * @return Ship
     */
    public function setType(string $type): self
    {
        if (!in_array($type, ShipType::getAvailableTypes())) {
            throw new \InvalidArgumentException("Invalid ShipType");
        }

        $this->type = $type;

        return $this;
    }

    /**
     * @return int
     */
    public function getMaxShieldModules(): int
    {
        return $this->maxShieldModules;
    }

    /**
     * @param int $maxShieldModules
     * @return Ship
     */
    public function setMaxShieldModules(int $maxShieldModules): self
    {
        $this->maxShieldModules = $maxShieldModules;

        return $this;
    }

    /**
     * @return int
     */
    public function getMaxSupportModules(): int
    {
        return $this->maxSupportModules;
    }

    /**
     * @param int $maxSupportModules
     * @return Ship
     */
    public function setMaxSupportModules(int $maxSupportModules): self
    {
        $this->maxSupportModules = $maxSupportModules;

        return $this;
    }

    /**
     * @return int
     */
    public function getMaxWeaponModules(): int
    {
        return $this->maxWeaponModules;
    }

    /**
     * @param int $maxWeaponModules
     * @return Ship
     */
    public function setMaxWeaponModules(int $maxWeaponModules): self
    {
        $this->maxWeaponModules = $maxWeaponModules;

        return $this;
    }
}
