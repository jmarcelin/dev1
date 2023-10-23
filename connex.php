<?php   
    $serveur = "localhost"; 
    $utilisateur = "root"; 
    $mot_de_passe = ""; 
    $base_de_donnees = "bo_dev1";

    // Établir la connexion à la base de données
    $connexion = mysqli_connect($serveur, $utilisateur, $mot_de_passe, $base_de_donnees);

    // Vérifier la connexion
    if (!$connexion) {
        die("La connexion à la base de données a échoué : " . mysqli_connect_error());
    } else {
        //echo "Connexion réussie à la base de données.";
        // Vous pouvez exécuter des requêtes SQL ici
    }
?>