<?php
require('../../_lib/mysql_connector.php');
/* Select queries */
/* Para pruebas máximo de 20, después controlar y añadir un factor para ordenar*/
$sql='SELECT id_cancion, titulo, album, artista, year, comment '
        . 'FROM metallist.cancion '
        . "WHERE artista LIKE ? "
        . 'LIMIT 20';
$condicion_where = "Metallica";
//SELECT * FROM metallist.cancion where artista LIKE 'metallica' LIMIT 5;
 
/* Prepare statement */
$stmt = $conn->prepare($sql);
if($stmt === false) {
  trigger_error('Error SQL : ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
}
 
/* Parameters. Tipos: s = string, i = integer, d = double,  b = blob */
$stmt->bind_param('s',$condicion_where);
 
/* Execute statement */
$stmt->execute();

/* Iterate over results*/
//$stmt->bind_result($id_cancion, $titulo, $album, $artista, $year, $comment);
//$stmt ->fetch();
$result = $stmt->get_result();

$array_canciones = array();

/* Lo procesaremos en view_logic  */
while ($fila = $result->fetch_assoc()) {
        array_push($array_canciones, $fila);
        //print($fila['titulo'] . '</br>');
    }
// print_r($array_canciones);

/* Close statement */
$stmt->close();