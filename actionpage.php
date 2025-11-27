<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="server/actionpage.css">
    <title>Uutiset</title>
</head>
<body>
    
</body>
</html>
<?php
session_start();
include "server/connect.php";

if (isset($_POST["tunnus"], $_POST["salasana"])) {

    $tunnus = mysqli_real_escape_string($conn, $_POST["tunnus"]);
    $salasana = mysqli_real_escape_string($conn, $_POST["salasana"]);

    if (empty($tunnus) || empty($salasana)) {
        header("Location: login.php");
        exit();
    }

    $sql = "SELECT * FROM users WHERE username ='$tunnus' LIMIT 1";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);

    if ($row && password_verify($salasana, $row['password'])) {

        $_SESSION["tunnus"] = $tunnus;
        $_SESSION['admin'] = (int)$row['admin'];

        
        echo "<li class='active'><a href='div.php'><button>< Etusivu</button></a></li>";
        echo "<h2>Kirjautuminen onnistui!</h2>";

        if ($_SESSION['admin'] === 1) {
            echo "<h1>Luo uusi uutinen</h1>";
            echo "<fieldset>";
            echo "<legend>Uusi uutinen</legend>";
            $katSQL = "SELECT * FROM kategoria"; 
            $katResult = mysqli_query($conn, $katSQL);
            echo "<form action='upload.php' method='post' enctype='multipart/form-data'>
                    <p>Otsikko</p><input type='text' name='otsikko'>
                    <p>Teksti</p><input type='text' name='teksti'>
                    <p>Kategoria</p>
                            <select name='kategoria'>
                    ";
                    if (mysqli_num_rows($katResult) > 0) {
                        while ($kat = mysqli_fetch_assoc($katResult)) {
                            echo "<option value='" . $kat['id'] . "'>" . $kat['nimi'] . "</option>";
                        }
                    }
                
                    echo "
                    </select>
                    <p>Kuva</p><input type='file' name='file'>
                    <input type='submit'>
                    </fieldset>
                  </form>";
        }

        } else {
            echo "<p>Kirjautuminen epäonnistui!</p>";
        }

    } else {
        echo "<p>Täytä lomake ensin.</p>";
}
?>
