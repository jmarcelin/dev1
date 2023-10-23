============= Première requette (dans parcours_rapport_eval)

SELECT id_parcours_rapport_eval, id_rapport_eval
FROM 'parcours_rapport_eval' 
WHERE 'id_parcours_apprenant' = 

============= Deuxième requette (si oui)

SELECT COUNT(*)
FROM 'rapport_eval'
WHERE 'id_rapport_eval' = 

============= Troisième requette (si oui)

DELETE FROM 'rapport_eval'
WHERE 'id_rapport_eval' = 

============= Quatrième requette (Reverification)

SELECT COUNT(*)
FROM 'rapport_eval'
WHERE 'id_rapport_eval' = 

============= Cinqième requette (si non)

DELETE FROM 'parcours_rapport_eval'
WHERE 'id_parcours_rapport_eval' = 

>>>>>>>>>>>>>> Première requette (si non)

INSERT INTO rapport_eval ( score_initiale, score_cible )
VALUES (  ,  )

>>>>>>>>>>>>>> Deuxième requette

INSERT INTO parcours_rapport_eval ( id_parcours_apprenant, id_rapport_eval )
VALUES (  ,  )

>>>>>>>>>>>>>> Troisième requette (recuperation de l'id_grille_score par le score_initiale)

SELECT competence.id_competence, parcours_apprenant.id_lms_formation, 
FROM competence
INNER JOIN grille_score ON competence.id_grille_score = grille_score.id_grille_score
INNER JOIN parcours_apprenant ON grille_score.id_lms_formation = parcours_apprenant.id_lms_formation
WHERE grille_score.id_lms_formation = 
AND parcours_apprenant.id_parcours_apprenant = variable_parcours
AND grille_score.score_min >= variable_score_initale
AND grille_score.score_max <= variable_score_initale

>>>>>>>>>>>>>> Quatrième requette (les insertions)

INSERT INTO rapport_eval_competence ( id_rapport_eval, id_competence )
VALUES (  ,  )

>>>>>>>>>>>>>> Cinqième requette (recuparation de l'id_grille_score par le score_cible)

SELECT competence.id_competence
FROM competence
INNER JOIN grille_score ON competence.id_grille_score = grille_score.id_grille_score
INNER JOIN parcours_apprenant ON grille_score.id_lms_formation = parcours_apprenant.id_lms_formation
WHERE grille_score.id_lms_formation = 
AND parcours_apprenant.id_parcours_apprenant =
AND grille_score.score_min >=
AND grille_score.score_max <=

>>>>>>>>>>>>>> Sixième requette (les insertions)

INSERT INTO rapport_eval_competence ( id_rapport_eval, id_competence )
VALUES (  ,  )