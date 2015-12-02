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

 /* 
  * función para convertir nombres a nombres de ficheros del FS
  * str_replace(): reemplazamos 1 param x 2 en 3
  * strtolower(): minúsculas.
 */
function archivo_sistema($data) {
    $data2 = str_replace(" ", "_", $data);
    $data3 =  strtolower($data2);
    return $data3;
}

/* TODO: Sergio. Crear una función para limitar el número de carácteres del 
 * para titulo y artista/album/#/year para que no se desborde de la celda de lista.
 * Si es necesario, que corte y añada ...
 */