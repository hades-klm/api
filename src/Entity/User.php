<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=50, unique=true)
     */
    private $nickname;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string", nullable=true)
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=36, unique=true, nullable=true)
     */
    private $discordId;

    /**
     * @ORM\ManyToOne(targetEntity=Corporation::class, inversedBy="users")
     * @ORM\JoinColumn(nullable=true)
     */
    private $corporation;

    /**
     * @ORM\OneToMany(targetEntity=UserShip::class, mappedBy="user", orphanRemoval=true)
     */
    private $ships;

    /**
     * @ORM\OneToMany(targetEntity=UserPlanet::class, mappedBy="user", orphanRemoval=true)
     */
    private $planets;

    public function __construct()
    {
        $this->ships = new ArrayCollection();
        $this->planets = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getDiscordId(): string
    {
        return (string) $this->discordId;
    }

    public function setDiscordId(string $discordId): self
    {
        $this->discordId = $discordId;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    /**
     * @param mixed $nickname
     * @return User
     */
    public function setNickname($nickname)
    {
        $this->nickname = $nickname;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getNickname()
    {
        return $this->nickname;
    }

    public function getCorporation(): ?Corporation
    {
        return $this->corporation;
    }

    public function setCorporation(?Corporation $corporation): self
    {
        $this->corporation = $corporation;

        return $this;
    }

    /**
     * @return Collection|UserShip[]
     */
    public function getShips(): Collection
    {
        return $this->ships;
    }

    public function addShip(UserShip $ship): self
    {
        if (!$this->ships->contains($ship)) {
            $this->ships[] = $ship;
            $ship->setUser($this);
        }

        return $this;
    }

    public function removeShip(UserShip $ship): self
    {
        if ($this->ships->contains($ship)) {
            $this->ships->removeElement($ship);
            // set the owning side to null (unless already changed)
            if ($ship->getUser() === $this) {
                $ship->setUser(null);
            }
        }

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
            $planet->setUser($this);
        }

        return $this;
    }

    public function removePlanet(UserPlanet $planet): self
    {
        if ($this->planets->contains($planet)) {
            $this->planets->removeElement($planet);
            // set the owning side to null (unless already changed)
            if ($planet->getUser() === $this) {
                $planet->setUser(null);
            }
        }

        return $this;
    }

    public function __toString() {
        return $this->getNickname();
    }
}
