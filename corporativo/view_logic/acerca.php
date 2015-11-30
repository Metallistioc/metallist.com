<?php
require('../../_lib/diccionario.php');

$diccionario = array(
	'lang'=> 'es',
	'titulo'=>'acerca'
);

processar_template('../view/acerca.html',$diccionario);
?>

