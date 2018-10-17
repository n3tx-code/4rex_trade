<?php
include("bdd.php");
if(
    isset($_POST['paire']) AND !empty($_POST['paire'])
    AND isset($_POST['type_trade']) AND !empty($_POST['type_trade'])
    AND isset($_POST['resultat']) AND !empty($_POST['resultat']))
{
    $add_trade = $bdd->prepare('INSERT INTO trade(Paire, Trade_type, resultat) VALUES (?, ?, ?)');
    $add_trade->execute(array($_POST['paire'], $_POST['type_trade'], $_POST['resultat']));
    echo "<h2 class=\"text-center\" style='color:green'>Trade rajouté !</h2>";
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
        <form action="/forex/trade.php" method="post" class="form-add-paire">
            <div class="form-group">
                <label for="paire">Select list:</label>
                <select class="form-control" id="paire" name="paire">
                    <?php
                        $req_all_paire = $bdd->query('SELECT * FROM PAIRE');
                        while($paire = $req_all_paire->fetch())
                        {
                            ?>
                                <option value="<?= $paire['NOM'] ?>"><?= $paire['NOM'] ?></option>
                            <?php
                        }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <div class="radio">
                    <label><input type="radio" name="type_trade" value="Sell">Sell</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="type_trade" value="Buy">Buy</label>
                </div>
            </div>
            <div class="form-group">
                <label for="resultat">Résultat:</label>
                <input type="text" class="form-control" id="resultat" name="resultat" required>
            </div>
            <button type="submit" class="btn btn-default">Ajouter</button>
        </form>
    </div>
</div>

</body>
</html>
