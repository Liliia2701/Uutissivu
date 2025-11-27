<?php
session_start();
include "server/connect.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['otsikko'])) {

$otsikko =  mysqli_real_escape_string($conn, $_POST['otsikko']);
$teksti  = mysqli_real_escape_string($conn, $_POST['teksti']);

$permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
$random = substr(str_shuffle($permitted_chars), 0, 10);

// Tiedoston tiedot
$file       = $_FILES['file']['name'];
$fileTmp    = $_FILES['file']['tmp_name'];
$fileSize   = $_FILES['file']['size'];
$fileError  = $_FILES['file']['error'];

$fileExt = explode('.', $file);
$fileActualExt = strtolower(end($fileExt));

$allowed = array('jpg','png','jpeg','avif');

    if (in_array($fileActualExt, $allowed)) {
        if ($fileError === 0) {
            if ($fileSize < 5000000) {
                $fileNameNew = $random.".".$fileActualExt;
                $fileDestination = 'images/'.$fileNameNew;
                move_uploaded_file($fileTmp, $fileDestination);
                echo "kuvan siirto onnistui";
                echo $sql = "INSERT INTO uutinen (otsikko, teksti, kuva, kategoria, toimittaja) 
                        VALUES ('$otsikko','$teksti','$fileNameNew',3,1)";

                if (mysqli_query($conn, $sql)) {
                    echo "Uutinen lisätty onnistuneesti!<br>";
                    header("refresh:2;url=div.php");
                } else {
                    echo "Virhe: " . mysqli_error($conn);
                }

                } else {
                    echo "Tiedosto on liian suuri!";
                }

                } else {
                    echo "Tiedoston latauksessa tapahtui virhe!";
                }

                } else {
                    echo "Tiedostomuoto ei ole sallittu!";
                }

                } else {
                    exit("Lomakkeen kautta vain!");
                }


?>