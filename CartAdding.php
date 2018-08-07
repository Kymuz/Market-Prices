<?php
  session_start();
?>
<?php

require_once('mysqli_connect.php');

$query ="INSERT INTO `orders`(`user_ID`, `Status`) VALUES (".$_SESSION["userID"].", 'Active')";

$res=@mysqli_query($dbc,$query);



$query = "INSERT INTO `order_products`(`order_ID`,`P_ID`, `Sup_ID`) VALUES (".$_SESSION["userID"].", 'Active');"
echo '<script>alert("Item successfully added");history.go(-1);</script>';
foreach($_POST as $stuff){
    echo $stuff;
}
?>
