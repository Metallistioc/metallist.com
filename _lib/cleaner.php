<?php
/* METALLIST
 * v.1
 * función para limpiar código y evitar un X-side scripting. 
 * Para filtrar los campos de los formularios que recojan datos.
 * trim (): Elimina chars antes y después (por defecto espacios)
 * stripslashes(): Elimina carácter de escape (\)
 * htmlspecialchars(): Convierte carácteres especiales a entidades HTML
 *                     por ejemplo '>' a $gt o '<' a &lt.
 */
function clean($data) {
    $data1 = trim($data);
    $data2 = stripslashes($data1);
    $data3 = htmlspecialchars($data2);
    return $data3;
}
