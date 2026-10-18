SET NAMES utf8mb4;

/*
Personnage de Mondstadt : 
Sucrose :
typeEntite: personnage
region: Mondstadt
Affiliation: 'Chevaliers de Favonius'(fr) 'Knights of Favonius'(eng)
Nom: Sucrose 
langue: (en+fr)
constellation: Ampulla


*/
-- Initial values (sucrose)
INSERT into entite(typeEntite) VALUES ('personnage');
INSERT INTO nom VALUES(1 ,'Sucrose', 'fr');
INSERT INTO nom VALUES(1 ,'Sucrose', 'en');
INSERT INTO entite(typeEntite) VALUES('region');
INSERT INTO nom VALUES(2 ,'Mondstadt', 'fr');
INSERT INTO nom VALUES(2 ,'Mondstadt', 'en');
INSERT INTO entite(typeEntite) VALUES('Affiliation');
INSERT INTO nom VALUES(3 ,'Chevaliers de Favonius', 'fr');
INSERT INTO nom VALUES(3 ,'Knights of Favonius', 'en');
-- Region & Affiliation
INSERT INTO region(id) VALUES(2);
INSERT INTO Affiliation(id) VALUES(3);
-- Personnage
INSERT INTO personnage (idPersonnage,idAffiliation,idRegion,constellation) VALUES(1,3,2,'Ampulla');

--Voyageur 

-- VERSION FRANÇAISE

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'fr',1,'passe','avant_aq',
'Sucrose a connu une enfance heureuse à Mondstadt, entourée de parents aimants et de deux meilleures amies.',
'https://genshin-impact.fandom.com/fr/wiki/Sucrose/Histoire');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'fr',2,'passe','avant_aq',
'Une histoire lui fit découvrir un paradis mystérieux de Teyvat, rempli d’immenses fleurs roses, de minuscules fées et de magnifiques licornes. Avec ses deux amies, elle rêvait de découvrir cet endroit pour y vivre heureuses pour toujours.',
'https://genshin-impact.fandom.com/fr/wiki/Sucrose/Histoire');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'fr',3,'passe','avant_aq',
'L’une de ses amies partit pour un long voyage avec ses parents aventuriers et ne revint jamais.',
'https://genshin-impact.fandom.com/fr/wiki/Sucrose/Histoire');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'fr',4,'passe','avant_aq',
'La seconde amie de Sucrose perdit son père après une maladie. Bouleversée par cette tragédie, elle changea profondément et rompit son amitié avec Sucrose, laissant cette dernière seule.',
'https://genshin-impact.fandom.com/fr/wiki/Sucrose/Histoire');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'fr',5,'passe','avant_aq',
'Pour honorer son ancienne amitié, Sucrose découvrit l’alchimie dans un livre. Elle comprit qu’elle pouvait créer son propre paradis et commença à étudier la bio-alchimie avec toute sa curiosité et sa passion.',
'https://genshin-impact.fandom.com/fr/wiki/Sucrose/Histoire');


-- ENGLISH VERSION

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'en',1,'passe','avant_aq',
'Sucrose had a happy childhood in Mondstadt, surrounded by loving parents and two best friends.',
'https://genshin-impact.fandom.com/wiki/Sucrose/Profile');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'en',2,'passe','avant_aq',
'A story introduced her to a mysterious paradise in Teyvat, filled with enormous pink flowers, tiny fairies, and beautiful unicorns. She and her two friends dreamed of finding this place and living happily ever after.',
'https://genshin-impact.fandom.com/wiki/Sucrose/Profile');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'en',3,'passe','avant_aq',
'One of Sucrose’s friends left on a long journey with her adventurer parents and never returned.',
'https://genshin-impact.fandom.com/wiki/Sucrose/Profile');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'en',4,'passe','avant_aq',
'Sucrose’s second friend lost her father after he fell ill. Deeply affected by the tragedy, the girl changed profoundly and ended her friendship with Sucrose, leaving her alone.',
'https://genshin-impact.fandom.com/wiki/Sucrose/Profile');

INSERT INTO histoire(idEntite, langue,ordre,categorie,moment,texte,source)
VALUES(1,'en',5,'passe','avant_aq',
'To honor her former friendship, Sucrose discovered alchemy in a book. She realized she could create her own paradise and began studying bio-alchemy with all her curiosity and passion.',
'https://genshin-impact.fandom.com/wiki/Sucrose/Profile');

/*-- Voyageur 

INSERT into entite(typeEntite) VALUES ('personnage');
INSERT INTO nom VALUES(LAST_INSERT_ID() ,'Voyageur(euse)', 'fr');
INSERT INTO nom VALUES(LAST_INSERT_ID() ,'Traveler', 'en');
-- Personnage
INSERT INTO personnage (idPersonnage,idAffiliation,idRegion,constellation) VALUES(
    (SELECT idEntite from nom where entiteNom='Traveler'),NULL,NULL,'Viator(Viatrix)');
    */