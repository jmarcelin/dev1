<?php
   require ('connex.php');

    if(isset($_POST)){
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];

        $requette = "SELECT pa.id_parcours_apprenant, f.label
                    FROM parcours_apprenant pa
                    INNER JOIN lms_formation f ON pa.id_lms_formation = f.id_lms_formation
                    INNER JOIN lms_soc_apprenant lsa ON pa.id_lms_soc_apprenant = lsa.id_lms_soc_apprenant
                    WHERE lsa.nom = \"$nom\" OR lsa.prenom = \"$prenom\"; 
        ";
        $resultat = $connexion->query($requette);


        if ($resultat->num_rows > 0) { 
            $response = "<table>";
            $response .= " <tr>";
            $response .= " <td>Parcours Apprenant</td> ";
            $response .= " <td>Formation</td>";
            $response .= " </tr> ";
            while ($row = $resultat->fetch_assoc()) { 
                $response .= " <tr> ";
                $response .= " <td>" . $row["id_parcours_apprenant"] . "</td>";
                $response .= " <td>". $row["label"] ."</td>";
                $response .= " </tr>";
            } 
            $response .= " </table>";
            echo $response;exit;
        } else {
            //header("Location: recherche.html"); exit; 
            echo "<span> 0 résultats trouvés. </span>";exit;
        }

        // Libérer le résultat
        $resultat->close();

    }


?>
