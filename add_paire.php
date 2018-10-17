<?php
    if(isset($_POST['paire']) AND !empty($_POST['paire']))
    {
            include("bdd.php");
            $add_paire = $bdd->prepare('INSERT INTO paire(NOM) VALUES (?)');
            $add_paire->execute(array($_POST['paire']));
            echo "<h2 class=\"text-center\" style='color:green'>" . $_POST['paire'] . " ajouté ! </h2>";
    }
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <?php
    include("style.php");
    ?>
</head>
<body>

<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form action="/forex/add_paire.php" method="post" class="form-add-paire">
            <div class="form-group">
                <label for="email">Nouvelle paire:</label>
                <input type="text" class="form-control" id="paire" name="paire">
            </div>
            <button type="submit" class="btn btn-default">Ajouter</button>
        </form>
    </div>
</div>

</body>
</html>
