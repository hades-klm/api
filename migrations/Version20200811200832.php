<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200811200832 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE battle_ship (id INT AUTO_INCREMENT NOT NULL, level INT NOT NULL, speed INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE corporation (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) NOT NULL, discord_link VARCHAR(100) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user ADD corporation_id INT NOT NULL');
        $this->addSql('ALTER TABLE user ADD CONSTRAINT FK_8D93D649B2685369 FOREIGN KEY (corporation_id) REFERENCES corporation (id)');
        $this->addSql('CREATE INDEX IDX_8D93D649B2685369 ON user (corporation_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user DROP FOREIGN KEY FK_8D93D649B2685369');
        $this->addSql('DROP TABLE battle_ship');
        $this->addSql('DROP TABLE corporation');
        $this->addSql('DROP INDEX IDX_8D93D649B2685369 ON user');
        $this->addSql('ALTER TABLE user DROP corporation_id');
    }
}
