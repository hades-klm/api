<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200815181304 extends AbstractMigration
{
    public function getDescription() : string
    {
        return 'Added basic scope for planets, ships and their relation to users';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE planet (id INT AUTO_INCREMENT NOT NULL, type VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ship (id INT AUTO_INCREMENT NOT NULL, type VARCHAR(50) NOT NULL, max_shield_modules INT DEFAULT 0 NOT NULL, max_support_modules INT DEFAULT 0 NOT NULL, max_weapon_modules INT DEFAULT 0 NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_planet (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, planet_id INT NOT NULL, level INT DEFAULT 0 NOT NULL, INDEX IDX_D417198A76ED395 (user_id), INDEX IDX_D417198A25E9820 (planet_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_ship (id INT AUTO_INCREMENT NOT NULL, ship_id INT NOT NULL, user_id INT NOT NULL, level INT DEFAULT 0 NOT NULL, INDEX IDX_80B1A7EDC256317D (ship_id), INDEX IDX_80B1A7EDA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_planet ADD CONSTRAINT FK_D417198A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE user_planet ADD CONSTRAINT FK_D417198A25E9820 FOREIGN KEY (planet_id) REFERENCES planet (id)');
        $this->addSql('ALTER TABLE user_ship ADD CONSTRAINT FK_80B1A7EDC256317D FOREIGN KEY (ship_id) REFERENCES ship (id)');
        $this->addSql('ALTER TABLE user_ship ADD CONSTRAINT FK_80B1A7EDA76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('DROP TABLE battle_ship');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_planet DROP FOREIGN KEY FK_D417198A25E9820');
        $this->addSql('ALTER TABLE user_ship DROP FOREIGN KEY FK_80B1A7EDC256317D');
        $this->addSql('CREATE TABLE battle_ship (id INT AUTO_INCREMENT NOT NULL, level INT NOT NULL, speed INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('DROP TABLE planet');
        $this->addSql('DROP TABLE ship');
        $this->addSql('DROP TABLE user_planet');
        $this->addSql('DROP TABLE user_ship');
    }
}
