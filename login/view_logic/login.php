<?php
echo 'hola'

    // abrir session o cookie
    
    // Chequear user & pass
    // comprobar si es adm ( se puede solicitar antes y que la BD devuelva
    // si es adm para evitar hacer dos consultas)

    // establecer variable usuario o cookie.
    
    // devolver html logeado o 
    // html mensaje error y link a recuperar.    

    /* ejemplo archivo 1
     * <?php
            require('../lib/processar_diccionari.php');

        $diccionario = array(
            'idioma'=> 'es',
            'titulo-home'=>'Logeese al sistema' ...
        );

        # Controla texto error en login
        procesar_error_login();
        processar_template('./login.html',$diccionario);


        function procesar_error_login(){
            global $diccionario;
            if ( $_GET['errorusuario'] == "si" ){
                $diccionario['error-login'] = '¡Error en el nombre de usuario y/o la contraseña!';
            }
        }
        ?>
    */

    /* ejemplo Archivo 2 ( tb se controla el tiempo max logeado)
    <?php
    // Modificamos valores php.ini para terminar al cerrar
    ini_set("session.use_only_cookies","1");
    ini_set("session.use_trans_sid","0");

    //vemos si el usuario y contraseña es válido
    if ( $_POST["usuario"]=="" 
            && $_POST["password"]=="" ...bla, bla llamada a comprobar){
        session_name("loginUsuario");
        session_start();
        session_set_cookie_params(0, "/", $HTTP_SERVER_VARS["HTTP_HOST"], 0); #duracción
        $_SESSION["autentificado"] = "SI";
        $_SESSION["ultimoAcceso"]= date("Y-n-j H:i:s"); #control tiempo
        header ("Location: ../"); # con Location redirige
        if ( administrador) {
            $_SESSION["administrador"] = "TRUE";
        }
    }else {
        //si no existe le mando otra vez a la portada
        header("Location: log_es.php?errorusuario=si");
    }
     */
    ?>


?>