<?php

function processar_template($template, $diccionario) {
    $template_raw = file_get_contents($template);

    foreach ($diccionario as $clave => $valor) {
        $template_raw = str_replace('{' . $clave . '}', htmlentities($valor), $template_raw);
    }
    print $template_raw;
}