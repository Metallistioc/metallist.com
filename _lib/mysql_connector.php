<?php
$servername = "localhost";
$username = "root"; // generar otro usuario solo para consultas
$password = "";
$database = "metallist";

//conecto con la base de datos
$conn =  new mysqli($servername,$username,$password,$database);

// Check connection
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}