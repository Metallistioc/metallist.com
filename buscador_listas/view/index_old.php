<?php
include('../../_lib/diccionario.php');
include('../../_lib/cleaner.php');

$diccionario = array(
	'lang'=> 'es',
	'titulo'=>'Buscador de canciones',
);

// Cabecera HTML de la página
processar_template_noentities('buscar_cancion_top.html',$diccionario);

include('../model/consulta_buscar_cancion.php');

// Pie HTML de la página
processar_template_noentities('buscar_cancion_footer.html',$diccionario);
?>
<script type="text/javascript" > eval(document.getElementById("runscript").innerHTML ); </script>
<script type="text/javascript" > run(); </script>
 </body>
</html>