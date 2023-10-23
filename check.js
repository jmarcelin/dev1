function check_input(event){

    event.preventDefault();
    var nom = document.getElementById("nom").value;
    var prenom = document.getElementById("prenom").value;
    
    if( nom == "" && prenom == ""){
        alert("Veuillez saisir le nom ou le prenom");
        return;
    }else{
        var formData = new FormData();
        formData.append("nom", nom);
        formData.append("prenom", prenom);

        fetch("cherche.php", {
            method: "POST",
            body: formData
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error("Réponse non valide");
            }
            return response.text();
        })
        .then(function(data) {
            
            document.getElementById("resultat").innerHTML = data;
        })
        .catch(function(error) {
            console.error("Erreur : " + error);
        });
    }
}