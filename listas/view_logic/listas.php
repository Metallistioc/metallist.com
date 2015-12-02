<?php
require('./genera_lista.php');

$diccionario = array(
	'lang'=> 'es',
	'titulo'=>'lista',
        'canciones'=> "$lista"
);


processar_template_noentities('../view/listas_demo.html',$diccionario);
?>
