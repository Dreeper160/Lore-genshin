
TABLES : 
# Structure de la Base de Données : Genshin Lore
Ce document répertorie les 6 tables du schéma et leurs colonnes pour faciliter les requêtes d'insertion (`INSERT INTO`).
## 1. Table `entite` (Table Parente)
Créer l'entité ici en premier pour générer son `id`.

| Colonne | Type | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT UNSIGNED` | **PK**, `AUTO_INCREMENT`, `NOT NULL` | Identifiant généré automatiquement. |
| `typeEntite` | `ENUM` | `NOT NULL` | Choix : `'personnage'`, `'region'`, `'affiliation'`. |
## 2. Table `nom` (Traductions)
À remplir après avoir créé l'entité pour lui attribuer un nom.

| Colonne | Type | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| `idEntite` | `INT UNSIGNED` | **PK**, **FK** (`entite.id`) | ID de l'entité parente. |
| `entiteNom` | `VARCHAR(255)` | `NOT NULL` | Le nom traduit. |
| `langue` | `ENUM` | **PK**, `NOT NULL`, `DEFAULT 'fr'` | Choix : `'fr'`, `'en'`. |
## 3. Table `region` (Enfant)
| Colonne | Type | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT UNSIGNED` | **PK**, **FK** (`entite.id`) | Le même ID que dans la table `entite`. |
## 4. Table `affiliation` (Enfant)
| Colonne | Type | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT UNSIGNED` | **PK**, **FK** (`entite.id`) | Le même ID que dans la table `entite`. |
## 5. Table `personnage` (Enfant)
| Colonne | Type | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| `idPersonnage` | `INT UNSIGNED` | **PK**, **FK** (`entite.id`) | Le même ID que dans la table `entite`. |
| `idAffiliation` | `INT UNSIGNED` | **FK** (`affiliation.id`), `NULL` | Optionnel (peut être laissé vide). |
| `idRegion` | `INT UNSIGNED` | **FK** (`region.id`) | La région d'appartenance. |
| `constellation` | `VARCHAR(255)` | | Nom de la constellation. |
## 6. Table `histoire` (Lore)
| Colonne | Type | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT UNSIGNED` | **PK**, `AUTO_INCREMENT`, `NOT NULL` | Identifiant du paragraphe. |
| `idEntite` | `INT UNSIGNED` | **FK** (`entite.id`), `NOT NULL` | L'entité concernée par ce texte. |
| `langue` | `ENUM` | `NOT NULL`, `DEFAULT 'fr'` | Choix : `'fr'`, `'en'`. |
| `ordre` | `INT UNSIGNED` | `NOT NULL` | Numéro de lecture (ex: `1`, `2`...). |
| `categorie` | `ENUM` | `NOT NULL` | `'passe'`, `'role'`, `'oeil_divin'`. |
| `moment` | `ENUM` | `NULL` | Optionnel : `'avant_aq'`, `'apres_aq'`. |
| `texte` | `TEXT` | `NOT NULL` | Le contenu du lore. |
| `source` | `VARCHAR(255)` | `NULL` | Optionnel : Livre, quête, lien web. |

> **Note :** La combinaison `(idEntite, langue, ordre)` doit toujours être **UNIQUE**.

---

## 💡 Exemple d'insertion : Créer une région (Mondstadt)
Personnage de Mondstadt : 
Sucrose :
typeEntite: personnage
region: Mondstadt
Affiliation: 'Chevaliers de Favonius'(fr) 'Knights of Favonius'(eng)
Nom: Sucrose 
langue: (en+fr)
constellation: Ampulla


