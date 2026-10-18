SET NAMES utf8mb4;

-- Requete 1

SELECT texte from histoire,entite,nom
where (histoire.idEntite =entite.id) and (nom.idEntite = entite.id) and (nom.entiteNom='Sucrose') and nom.langue ='fr' and histoire.langue='fr'
order by ordre;

-- REQUETE 2

select np.entiteNom as Nom , 
(
    SELECT nr.entiteNom
    FROM nom nr
    where nr.idEntite = p.idRegion
    AND nr.langue = 'fr'
) as Region ,
    (
        SELECT na.entiteNom
        FROM nom na
        WHERE na.idEntite = p.idAffiliation
        AND na.langue = 'fr'
    ) AS Affiliation,
    p.constellation
from personnage p, nom np
WHERE p.idPersonnage = np.idEntite
AND np.entiteNom= 'Sucrose'
AND np.langue = 'fr';

-- Requete 3

SELECT texte from histoire hfr,nom
where (hfr.idEntite =nom.idEntite) and (nom.entiteNom='Sucrose') and nom.langue ='fr' and hfr.langue='fr'
AND NOT EXISTS (
    SELECT hfr.texte from histoire hang
        where (hang.idEntite=hfr.idEntite) and hang.langue='en' and hfr.ordre = hang.ordre
        )
    order by hfr.ordre

/*
Tous les personnages d’une région donnée, avec leurs noms en anglais.
Le nombre de morceaux de lore par entité.
Les personnages sans affiliation.
Les entités qui n’ont aucun morceau de lore (NOT EXISTS encore).
Les morceaux d’une catégorie donnée (par exemple passe) pour un moment donné.
Les entités dont il manque le nom dans une langue.
*/
-- tout les perso d'une region

SELECT entiteNom as Nom from nom,region,personnage
where nom.entiteNom = 