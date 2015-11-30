<?php
require('../../_lib/diccionario.php');

$diccionario = array(
	'lang'=> 'es',
	'titulo'=>'contacta'
);

processar_template('../view/contacta.html',$diccionario);
?>

