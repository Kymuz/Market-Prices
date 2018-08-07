
<!DOCTYPE html>
<html>
<body>
    <?php
    $password = $_POST["pass"];
    $user = $_POST["email"];
    $conn = new mysqli("localhost", "root", "", "onlinestore");
    if($conn->connect_error){
        die("Failed to connect to database");
    }
    $q = "SELECT * FROM user WHERE Email ='".$user."' AND Password = '".$password."';";
    $qry = $conn->query($q);
    if($qry->num_rows >0){
         session_start();
            $_SESSION["email"] = $res["Email"];
            echo "<script type='text/javascript'>
            window.location.href = 'index.php';
            alert('Logged in as ".$_SESSION["email"]."');
            </script>";
    }
    else{
        echo "<script type='text/javascript'>
            alert('Invalid Login');
            window.location.href = 'Login.html';
            </script>";
    }
    $conn->close();
?>
    </body>
</html>

