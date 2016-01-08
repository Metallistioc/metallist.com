<?php

/* METALLIST
 * v.1
 * Realiza inserción/reemplazo de la lista en la BD.
 */

//Configuracion de la conexion a base de datos
//include('../../_lib/mysql_connector.php');

// Convertimos el post en un array separando por comas ,
$array_post;
if ( isset( $_POST['id'] )){
    $post = "{$_POST['id']}";
    $array_post = explode( "|" , $post );
    $array_post = array_values($array_post);
}

/* SALIDA A CONSOLA WEB */
print("**** LISTA CREADA/ACTUALIZADA ***<br/>");
echo("Usuario: " . "admin@metallist.com" . "<br/>");
echo("Nombre: " . $array_post[0] . "<br/>");
echo("Descripción: " . $array_post[1] . "<br/>");
print("Contiene las canciones (ID): ");
$songs = count($array_post);
for ( $i = 2 ; $i < $songs ; $i++ ){
    print ($array_post[$i] . "&nbsp");
}


