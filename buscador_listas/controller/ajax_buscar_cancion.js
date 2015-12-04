/* METALLIST
 * v.1
 * Ajax - Javascript para actualizar el listado de canciones cuando se busca
 * 
 * TODO FIX: Al recargar el codigo que contiene javascript este no se ejecuta
 * En este caso el que asigna un evento para el Drag & Drop. Hay que pasar
 * el objeto a sincrono (tercer parametro del .open), colocar el JS inline y 
 * asignarle un ID. DespuÃ©s volver a ejecutarlo con un eval( document...id.innerHTML).  
 */

// Función para recoger los datos de PHP según el navegador, se usa siempre.
function objetoAjax() {
    var xmlhttp = false;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            xmlhttp = false;
        }
    }

    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}

//Funcion para recoger los datos del formulario de busqueda y enviarlos por post  
function buscar_canciones() {

    //div donde se mostrara los resultados
    divResultado = document.getElementById('resultado');
    //recogemos los valores de los inputs
    buscar = document.buscador.buscar.value;

    //instanciamos el objetoAjax
    ajax = objetoAjax();

    //uso del metodo POST, al archivo que realiza la consulta y a/sincronia.
    ajax.open("POST", '../model/consulta_buscar_cancion.php', false);
    //cuando el objeto XMLHttpRequest cambia de estado, la funcion se inicia
    ajax.onreadystatechange = function () {
        //la funcion responseText tiene todos los datos pedidos al servidor
        if (ajax.readyState == 4) {
            //mostrar resultados en esta capa
            divResultado.innerHTML = ajax.responseText;
            //llamar a funcion para limpiar los inputs
            LimpiarCampos();
            eval(document.getElementById("runscript").innerHTML);
            run();
        }
    };
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //enviando los valores por POST
    ajax.send("buscar=" + buscar);
    
}

//funcion para limpiar los campos
function LimpiarCampos() {
    document.buscador.buscar.value = "";
    document.buscador.buscar.focus();
}
