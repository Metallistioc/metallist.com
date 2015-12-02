<?php
require('../../_lib/diccionario.php');
require('../controler/obtener_canciones.php');
require('../../_lib/cleaner.php');

$lista = "";

foreach ($array_canciones as $cancion){
    $address_base = '../../media/audio/' . $cancion["artista"] . '/' . $cancion["album"] . '/' ;
    $imagen_disco = $address_base . $cancion["artista"] . '-' . $cancion["album"] . '_petit.jpg';
    $alt_imagen_disco = $cancion["artista"] . ' - ' . $cancion["album"];
    $posicion_titulo_cancion = $cancion["titulo"];
    $grupo_album_any = $cancion["artista"] . ' - ' . $cancion["album"] 
            . '(' . $cancion["comment"] . ') ' .   ' - ' . $cancion["year"];
    
    $diccionario = array(
	'imagen_disco'=> archivo_sistema($imagen_disco),
	'alt_imagen_disco'=> $alt_imagen_disco,
        'posicion_titulo_cancion'=> $posicion_titulo_cancion,
        'grupo_album_any'=> $grupo_album_any
    );
    $lista .= texto_template('../view/fila_demo.html',$diccionario);
    
}

?>