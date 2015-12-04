<?php
/* METALLIST
 * v.1
 * Generamos una lista desde el array procesado en consulta_buscar_canción
 * Iteramos el array generando filas (procesando el html de filas), que vamos
 * concatenando a una variable que luego injectaremos en el código.
 */

include_once('../../_lib/cleaner.php');

// TODO: FIX: Añado aqui­ otra vez la función de _lib/diccionario porque da problemas con el include
// Averiguar porque. Parece ser que problemas de URI.
function texto_template2($template, $diccionario){
    $template_raw = file_get_contents($template);

    foreach ($diccionario as $clave => $valor) {
        $template_raw = str_replace('{' . $clave . '}', htmlentities($valor), $template_raw);
    }
    return $template_raw;
}

$lista = "";
foreach ($array_canciones as $cancion) {
    $address_base = '../../media/audio/' . $cancion["artista"] . '/' . $cancion["album"] . '/';
    $imagen_disco = $address_base . $cancion["artista"] . '-' . $cancion["album"] . '_petit.jpg';
    $alt_imagen_disco = $cancion["artista"] . ' - ' . $cancion["album"];
    $posicion_titulo_cancion = $cancion["titulo"];
    $grupo_album_any = $cancion["artista"] . ' - ' . $cancion["album"]
            . '(' . $cancion["comment"] . ') ' . ' - ' . $cancion["year"];

    $diccionario = array(
        'imagen_disco' => archivo_sistema($imagen_disco),
        'alt_imagen_disco' => $alt_imagen_disco,
        'posicion_titulo_cancion' => $posicion_titulo_cancion,
        'grupo_album_any' => $grupo_album_any
    );

    $lista .= texto_template2('../view/fila.html', $diccionario);
}

// injectamos directamente, arreglar si da tiempo
print '<h3>Resultado</h3>';
print '<ol data-draggable="target">';
print $lista;
print '</ol>';

?>