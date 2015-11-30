<?php
require('../../_lib/diccionario.php');

$diccionario = array(
	'lang'=> 'es',
	'titulo'=>'login'
);

processar_template('../view/login.html',$diccionario);
?>
