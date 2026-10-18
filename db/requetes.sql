SET NAMES utf8mb4;

-- Requete 1

SELECT texte from histoire,entite,nom
where (histoire.idEntite =entite.id) and (nom.idEntite = entite.id) and (nom.entiteNom='Sucrose') and nom.langue ='fr' and histoire.langue='fr'
order by ordre;