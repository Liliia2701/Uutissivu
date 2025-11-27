<?php
session_start();
include "server/connect.php";

if (isset($_SESSION["tunnus"])) {
    header("location:div.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="fi">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="login.css" />
<title>Kirjaudu</title>
</head>
<body>
<ul>
    <a href="div.php" class="btn">< Etusivu</a>
</ul>
<fieldset>
<legend>Kirjaudu</legend>
<form method="post" action="actionpage.php">
    <label>Käyttäjätunnus</label>
    <input type="text" name="tunnus" required>

    <label>Salasana</label>
    <input type="password" name="salasana" required>

    <input type="submit" value="Kirjaudu">
</form>

</fieldset>

</body>
</html>
