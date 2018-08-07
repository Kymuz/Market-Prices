<?php
session_start();
?>
<?php
unset ($_SESSION["email"]);
header("location:index.php");
?>
