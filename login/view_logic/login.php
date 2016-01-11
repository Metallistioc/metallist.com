<?php
    // Modificamos valores php.ini para terminar al cerrar
    ini_set("session.use_only_cookies","1");
    ini_set("session.use_trans_sid","0");

    //vemos si el usuario y contraseña es válido
    if ( $_POST["usuario"]=="" 
            && $_POST["password"]==" ...llamada a comprobar"){
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