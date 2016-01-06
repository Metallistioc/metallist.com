<?php
/* METALLIST
 * v.1
 * Realiza la consulta a la BD. Se activa por ajax al buscar.
 */

//Configuracion de la conexion a base de datos
include('../../_lib/mysql_connector.php');
$array_canciones = array();

//variables POST
$busqueda = ""; // por defecto, solo para pruebas, después " "
if ( isset( $_POST['buscar'] )){
    $busqueda = "%{$_POST['buscar']}%";
}
// CONSULTA, se busca en los campos canción, artista y album.
// Se podrían añadir más campos como año, o en la búsqueda especificar los campos
// y construirla la consulta dinámicamente en función de los seleccionados.
 $sql = "SELECT id_cancion, titulo, album, artista, year, comment "
            . "FROM cancion WHERE artista LIKE ? OR titulo LIKE ? "
            . "OR album LIKE ? LIMIT 20";

/* Prepare statement */
// Usamos preparadas para evitar injección SQL
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    trigger_error('Error SQL : ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
}

/* Parameters. Tipos: s = string, i = integer, d = double,  b = blob */
// rellenamos los ? de la sql preparada. Reemplazamos por las variables.
// el primer parámetro es el tipo ( 'sss' = tres strings).
$stmt->bind_param('sss', $busqueda, $busqueda, $busqueda);

/* Execute statement */
$stmt->execute();

/* Generamos un result*/
$result = $stmt->get_result();

/* Lo procesaremos en view_logic  */
// tambien podríamos return el array si fuera una función y dejar 
// a un view-logic que lo procesara.
while ($fila = $result->fetch_assoc()) {
    array_push($array_canciones, $fila);
    //print($fila['titulo'] . '</br>');  // chivato
}
// print_r($array_canciones); // chivato

/* Close statement */
// cerramos la procedimiento preparado
// tambien podriamos cerrar aquí la conexión.
$stmt->close();
$conn->close();

// estamos ejecutando de manera procedimental
// llamaos al siguiente paso, que generará la lista 
include('../view_logic/genera_lista.php');
?>