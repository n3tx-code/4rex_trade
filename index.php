<?php
    include("bdd.php");
    $data = [];

    $req_all_paire = $bdd->query('SELECT * FROM paire');

    while($paire = $req_all_paire->fetch()['NOM']) {
        // nom
        $data[$paire]['nom'] = $paire;

        // profit
        $req_profit = $bdd->prepare('SELECT SUM(resultat) AS total FROM trade WHERE Paire = ? ');
        $req_profit->execute(array($paire));
        $profit = round($req_profit->fetch()['total'], 2);
        $data[$paire]['profit_total'] = $profit;

        // profit par trade
        $req_profit = $bdd->prepare('SELECT AVG(resultat) AS moyenne FROM trade WHERE Paire = ? ');
        $req_profit->execute(array($paire));
        $moyenne = round($req_profit->fetch()['moyenne'], 2);
        $data[$paire]['moyenne'] = $moyenne;

        // type profitable
        $req_type = $bdd->prepare('SELECT Trade_type FROM trade WHERE Paire = ?');
        $req_type->execute(array($paire));
        $type = 0; # si negatif alors sell sinon buy
        while($t = $req_type->fetch())
        {
            if($t['Trade_type'] == "Buy")
            {
                $type = $type + 1;
            }
            elseif($t['Trade_type'] == "Sell")
            {
                $type = $type - 1;
            }
        }
        $data[$paire]['type'] = $type;

        // profit Sell
        $profit_sell = 0;
        $req_profit_sell = $bdd->prepare('SELECT resultat FROM trade WHERE Paire = ? AND Trade_type = "Sell" ');
        $req_profit_sell->execute(array($paire));
        while($sell = $req_profit_sell->fetch()['resultat'])
        {
            $profit_sell += $sell;
        }
        $data[$paire]['profit_sell'] = $profit_sell;

        // profit Buy
        $profit_buy = 0;
        $req_profit_buy = $bdd->prepare('SELECT resultat FROM trade WHERE Paire = ? AND Trade_type = "Buy" ');
        $req_profit_buy->execute(array($paire));
        while($buy = $req_profit_buy->fetch()['resultat'])
        {
            $profit_buy += $buy;
        }
        $data[$paire]['profit_buy'] = $profit_buy;
    }

    // max profit
    $req_sum_profit = $bdd->query('SELECT SUM(resultat) as total FROM trade');
    $sum_profit = $req_sum_profit->fetch()['total'];




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
    <div class="row">
        <div class="col-md-3 info-global">
            <?php
                $req_p_t = $bdd->query('SELECT SUM(resultat) as somme, COUNT(ID) as nbr FROM trade');
                $p_t =  $req_p_t->fetch();
                $total = round(($p_t['somme'] / $p_t['nbr']), 2);
                $color_p_t = "red";
                if($total > 0)
                {
                    $color_p_t = "green";
                }

            ?>
            <h5>Profit / Trade : <span style="color: <?= $color_p_t ?>"><?= $total ?></span></h5>

            <h5>Type le plus utilisé (profitable) :</h5>

            <?php
                $req_profit_sell = $bdd->query('SELECT SUM(resultat) as somme FROM trade WHERE Trade_type = "Sell"');
                $profit_sell = $req_profit_sell->fetch()['somme'];
                $color_profit_sell = "red";
                if ($profit_sell > 0)
                {
                    $color_profit_sell = "green";
                }
            ?>
            <h5>Profit Sell : <span style="color: <?= $color_profit_sell ?>"><?= round($profit_sell, 2) ?></span></h5>

            <?php
            $req_profit_buy = $bdd->query('SELECT SUM(resultat) as somme FROM trade WHERE Trade_type = "Buy"');
            $profit_buy = $req_profit_buy->fetch()['somme'];
            $color_profit_buy = "red";
            if ($profit_buy > 0)
            {
                $color_profit_buy = "green";
            }
            ?>
            <h5>Profit Buy : <span style="color: <?= $color_profit_buy ?>"><?= round($profit_buy, 2) ?></span></h5>
        </div>
        <div class="col-md-9">
            <table class="table">
            <thead>
            <tr>
                <th onclick="sortTable(0)">Paire</th>
                <th onclick="sortTable_num(1)">Profit</th>
                <th onclick="sortTable_num(2)">Profit / Trade</th>
                <th onclick="sortTable(3)">Type le plus utilisé (profitable)</th>
                <th onclick="sortTable_num(4)">Profit Sell</th>
                <th onclick="sortTable_num(5)">Profit Buy</th>
            </tr>
            </thead>
            <tbody id="myTable">
            <?php
                foreach($data as $paire_data)
                {

                    // color of row depend of total profit
                    $color_row = "";
                    if($paire_data['profit_total'] > 0)
                    {
                        $opacity = $paire_data['profit_total'] / $sum_profit;
                        $color_row = "rgba(0, 255, 0, ". $opacity .")";
                    }
                    elseif($paire_data['profit_total'] < 0)
                    {
                        $opacity = abs($paire_data['profit_total']) / $sum_profit;
                        $color_row = "rgba(255, 0, 0, ". $opacity .")";
                    }
            ?>

                <tr style="background-color: <?= $color_row ?> ">
                    <td><strong><em><?= $paire_data['nom'] ?></em></strong></td>
                    <?php

                    ?>
                    <td><?= $paire_data['profit_total'] ?></td>
                    <td><?= $paire_data['moyenne'] ?></td>
                    <?php
                        $type_profit = "None";
                        if ($paire_data['type'] > 0)
                        {
                            $type_profit = "Buy <i class=\"far fa-arrow-alt-circle-up\"></i>";
                            if($paire_data['profit_sell'] < $paire_data['profit_buy'])
                            {
                                $type_profit = $type_profit . " <i class=\"fas fa-check\"></i>";
                            }
                            else
                            {
                                $type_profit = $type_profit . " <i class=\"fas fa-times\"></i>";
                            }
                        }
                        elseif ($paire_data['type'] < 0)
                        {
                            $type_profit = "Sell <i class=\"far fa-arrow-alt-circle-down\"></i>";
                            if($paire_data['profit_sell'] > $paire_data['profit_buy'])
                            {
                                $type_profit = $type_profit . " <i class=\"fas fa-check\"></i>";
                            }
                            else
                            {
                                $type_profit = $type_profit . " <i class=\"fas fa-times\"></i>";
                            }
                        }


                    ?>
                    <td><?= $type_profit ?></td>
                    <td><?= $paire_data['profit_sell'] ?></td>
                    <td><?= $paire_data['profit_buy'] ?></td>
                </tr>
                <?php
                    }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- todo : stat pour sell et pour buy -->
<script src="js/sort_table.js">
</script>
</body>
</html>
