<?php
require('../../_lib/diccionario.php');

$diccionario = array(
	'lang'=> 'es',
	'titulo'=>'proyectos'
);

processar_template('../view/proyectos.html',$diccionario);
?>
