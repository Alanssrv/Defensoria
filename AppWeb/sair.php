<?php 
    session_start();
    unset($_SESSION["usuario"]);
    header("location:login.php");
    
?>