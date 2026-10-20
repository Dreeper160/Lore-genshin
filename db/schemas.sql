SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS genshinlore CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE genshinlore;
DROP TABLE IF EXISTS histoire;
DROP TABLE IF EXISTS personnage;
DROP TABLE IF EXISTS affiliation;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS nom;
DROP TABLE IF EXISTS entite;
-- Comment order : french and english

CREATE TABLE entite(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    typeEntite ENUM('personnage','region','affiliation') NOT NULL,
    PRIMARY KEY (id)
)Comment 'Parent table of the entity hierarchy. Every character, region and affiliation has one row here, and its child table reuses the same id. Known limit: nothing forces an entity to have a name in nom';
CREATE TABLE nom(
    idEntite int UNSIGNED,
    entiteNom varchar(255) NOT NULL,
    langue ENUM('fr','en') DEFAULT 'fr' NOT NULL,
    PRIMARY KEY (idEntite,langue),
    CONSTRAINT fk_nom_entite FOREIGN KEY (idEntite) REFERENCES entite(id) ON DELETE CASCADE
);
CREATE TABLE region(
    id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_region_entite FOREIGN KEY (id) REFERENCES entite(id) ON DELETE CASCADE
);

CREATE TABLE affiliation(
    id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_affiliation_entite FOREIGN KEY (id) REFERENCES entite(id) ON DELETE CASCADE
);

CREATE TABLE personnage(
    idPersonnage INT UNSIGNED NOT NULL,
    idAffiliation INT UNSIGNED ,
    idRegion INT UNSIGNED,
    constellation VARCHAR(255),
    PRIMARY KEY (idPersonnage),
    CONSTRAINT fk_personnage_entite FOREIGN KEY (idPersonnage) REFERENCES entite(id) ON DELETE CASCADE,
    CONSTRAINT fk_personnage_region FOREIGN KEY (idRegion) REFERENCES region(id),
    CONSTRAINT fk_personnage_affiliation FOREIGN KEY (idAffiliation) REFERENCES affiliation(id)
);


CREATE TABLE histoire(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    idEntite INT UNSIGNED NOT NULL, 
    ordre INT UNSIGNED NOT NULL,
    categorie ENUM('passe', 'role', 'oeil_divin') NOT NULL,
    moment enum('avant_aq', 'apres_aq') ,-- Aussi AQ: Archon Quest/ Quete archon
    texte TEXT NOT NULL,
    
    langue ENUM('fr','en') DEFAULT 'fr' NOT NULL,
    source VARCHAR(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_histoire_entite FOREIGN KEY (idEntite) REFERENCES entite(id) ON DELETE CASCADE,
    CONSTRAINT unq_idEntite_langue_ordre UNIQUE (idEntite, langue, ordre)
)COMMENT '
Lore entries for any entity (character, region or affiliation): one row per piece of text and per language.
Rule: the same ordre means the same piece in every language, so entry 2 in French is the translation of entry 2 in English for the same entity.
ordre identifies a piece within an entity and a language, and sets the reading order. The UNIQUE constraint forbids two pieces with the same ordre for the same entity and language.
TODO: nothing in the database checks that rows sharing an ordre are really translations of each other, so this relies on whoever enters the data. source is also free text, with no URL and no translation status yet.
    ';