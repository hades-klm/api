<?php

namespace App\Entity;

use App\Repository\PlanetRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PlanetRepository::class)
 */
class Planet
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
     * @ORM\OneToMany(targetEntity=UserPlanet::class, mappedBy="planet", orphanRemoval=true)
     */
    private $planets;

    public function __construct()
    {
        $this->planets = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return Collection|UserPlanet[]
     */
    public function getPlanets(): Collection
    {
        return $this->planets;
    }

    public function addPlanet(UserPlanet $planet): self
    {
        if (!$this->planets->contains($planet)) {
            $this->planets[] = $planet;
            $planet->setPlanet($this);
        }

        return $this;
    }

    public function removePlanet(UserPlanet $planet): self
    {
        if ($this->planets->contains($planet)) {
            $this->planets->removeElement($planet);
            // set the owning side to null (unless already changed)
            if ($planet->getPlanet() === $this) {
                $planet->setPlanet(null);
            }
        }

        return $this;
    }
}
