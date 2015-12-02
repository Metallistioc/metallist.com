<?php
/* METALLIST
 * v.1
 * función para rellenar plantillas html con un diccionario clave->valor
 * Además el texto se introduce con htmlentities para canviar carácteres especiales
 * por entidades HTML.
 */
function processar_template($template, $diccionario) {
    $template_raw = file_get_contents($template);

    foreach ($diccionario as $clave => $valor) {
        $template_raw = str_replace('{' . $clave . '}', htmlentities($valor), $template_raw);
    }
    print $template_raw;
}

// a fusionar con la anterior y añadir un booleano para procesar htmlentities
function processar_template_noentities($template, $diccionario) {
    $template_raw = file_get_contents($template);

    foreach ($diccionario as $clave => $valor) {
        $template_raw = str_replace('{' . $clave . '}', $valor, $template_raw);
    }
    print $template_raw;
}


// Igual que anterior pero devolvemos el texto en vez de salida a pantalla
function texto_template($template, $diccionario){
    $template_raw = file_get_contents($template);

    foreach ($diccionario as $clave => $valor) {
        $template_raw = str_replace('{' . $clave . '}', htmlentities($valor), $template_raw);
    }
    return $template_raw;
}

/* TODO. FIX: Sergio. juntar processar_template()/_noentities() en una función que 
 * acepte parametros parametros para print/return texto y TRUE/FALSE processar entidades.
 */