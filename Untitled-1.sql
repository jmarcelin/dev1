
CREATE TABLE lms_soc_apprenant ( 
    id_lms_soc_apprenant int NOT NULL AUTO_INCREMENT, 
    nom varchar(255), 
    prenom varchar(255), 
    societe varchar(255),
    PRIMARY KEY (id_lms_soc_apprenant)
);
CREATE TABLE status ( 
    id_status int NOT NULL AUTO_INCREMENT, 
    label varchar(255),
    PRIMARY KEY (id_status)
);
CREATE TABLE lms_formation ( 
    id_lms_formation int NOT NULL AUTO_INCREMENT, 
    label varchar(255),
    PRIMARY KEY (id_lms_formation)
);
CREATE TABLE parcours_apprenant ( 
    id_parcours_apprenant int NOT NULL AUTO_INCREMENT, 
    id_lms_soc_apprenant int NOT NULL, 
    id_lms_formation int NOT NULL, 
    id_status int NOT NULL,
    PRIMARY KEY (id_parcours_apprenant),
    FOREIGN KEY (id_lms_soc_apprenant) REFERENCES lms_soc_apprenant(id_lms_soc_apprenant),
    FOREIGN KEY (id_lms_formation) REFERENCES lms_formation(id_lms_formation),
    FOREIGN KEY (id_status) REFERENCES status(id_status)
);

CREATE TABLE type_objectif (
    id_type_objectif INT NOT NULL AUTO_INCREMENT,
    label varche(255),
    id_parcours_apprenant int NOT NULL,
    PRIMARY KEY (id_type_objectif),
    FOREIGN KEY (id_parcours_apprenant) REFERENCES parcours_apprenant(id_parcours_apprenant),
);
CREATE TABLE type_object_value(
    id_type_object_value int NOT NULL AUTO_INCREMENT,
    description varchar(255),
    id_type_objectif int NOT NULL,
    PRIMARY KEY (id_type_object_value)
);
CREATE TABLE grille_score (
    id_grille_score int NOT NULL AUTO_INCREMENT,
    label varchar(255),
    description varchar(255),
    score_min int,
    score_max int,
    id_lms_formation int NOT NULL,
    PRIMARY KEY (id_grille_score),
    FOREIGN KEY (id_lms_formation) REFERENCES lms_formation(id_lms_formation)
);
CREATE TABLE module_preconisation (
    id_module_preconisation int NOT NULL AUTO_INCREMENT,
    descr varchar(255),
    PRIMARY KEY (id_module_preconisation)
)
CREATE TABLE preconisation_parcours (
    id_preconisation_parcours int NOT NULL AUTO_INCREMENT,
    module varchar(255),
    nb_heure int,
    duree_seq_formation int,
    id_parcours_apprenant int NOT NULL,
    id_module_preconisation int,
    PRIMARY KEY (id_preconisation_parcours)
    FOREIGN KEY (id_parcours_apprenant) REFERENCES parcours_apprenant(id_parcours_apprenant)
    FOREIGN KEY (id_module_preconisation) REFERENCES module_preconisation(id_module_preconisation)
);
CREATE TABLE rapport_eval (
    id_rapport_eval int NOT NULL AUTO_INCREMENT,
    score_initiale int,
    score_finale int,
    PRIMARY KEY (id_rapport_eval)
);
CREATE TABLE parcours_rapport_eval (
    id_parcours_rapport_eval int NOT NULL AUTO_INCREMENT,
    id_parcours_apprenant int NOT NULL,
    id_rapport_eval int NOT NULL,
    PRIMARY KEY (id_parcours_rapport_eval),
    FOREIGN KEY (id_parcours_apprenant) REFERENCES parcours_apprenant(id_parcours_apprenant),
    FOREIGN KEY (id_rapport_eval) REFERENCES rapport_eval(id_rapport_eval),
);
CREATE TABLE acquisition_niveau (
    id_acquisition_niveau int NOT NULL AUTO_INCREMENT,
    label varchar(255),
    PRIMARY KEY (id_acquisition_niveau)
);
CREATE TABLE theme_competence (
    id_theme_competence int NOT NULL AUTO_INCREMENT,
    label varchar(255),
    PRIMARY KEY (id_theme_competence)
);
CREATE TABLE competence (
    id_competence int NOT NULL AUTO_INCREMENT,
    label varchar(255),
    id_theme_competence int NOT NULL,
    id_grille_score int NOT NULL,
    PRIMARY KEY (id_competence),
    FOREIGN KEY (id_theme_competence) REFERENCES theme_competence(id_theme_competence),
    FOREIGN KEY (id_grille_score) REFERENCES grille_score(id_grille_score)
);
CREATE TABLE rapport_eval_competence (
    id_rapport_eval_competence int NOT NULL AUTO_INCREMENT,
    id_rapport_eval int NOT NULL,
    id_competence int NOT NULL,
    id_acquisition_niveau int,
    PRIMARY KEY (id_rapport_eval_competence),
    FOREIGN KEY (id_rapport_eval) REFERENCES rapport_eval(id_rapport_eval),
    FOREIGN KEY (id_competence) REFERENCES competence(id_competence),
    FOREIGN KEY (id_acquisition_niveau) REFERENCES acquisition_niveau(id_acquisition_niveau)
);

