/* METALLIST
 * v.1
 * Ajax - Javascript para actualizar el listado de canciones cuando se busca
 * 
 * TODO FIX: Al recargar el codigo que contiene javascript este no se ejecuta
 * En este caso el que asigna un evento para el Drag & Drop. Hay que pasar
 * el objeto a sincrono (tercer parametro del .open), colocar el JS inline y 
 * asignarle un ID. DespuÃ©s volver a ejecutarlo con un eval( document...id.innerHTML).  
 */

// Función objeto ajax en buscar canción

//Funcion para recoger los datos del formulario de busqueda y enviarlos por post  
function guardarlista(id_canciones) {

    //div donde se mostrara los resultados
    divResultado = document.getElementById('result_save_list');
    // recogemos los valores de los inputs
    // En este caso los id de las canciones seleccionadas.
    //canciones = lista_canciones;
    
    nombre = document.guardar_lista.nombre_lista.value;
    descripcion = document.guardar_lista.descripcion_lista.value;

    //instanciamos el objetoAjax
    ajax = objetoAjax();

    //uso del metodo POST, al archivo que realiza la consulta y a/sincronia.
    ajax.open("POST", '../model/insertar_lista_cancion.php', true);
    //cuando el objeto XMLHttpRequest cambia de estado, la funcion se inicia
    ajax.onreadystatechange = function () {
        //la funcion responseText tiene todos los datos pedidos al servidor
        if (ajax.readyState == 4) {
            //mostrar resultados en esta capa
            divResultado.innerHTML = ajax.responseText;
            //llamar a funcion para limpiar los inputs
            limpiarCamposGuardarLista();
            //eval(document.getElementById("runscript").innerHTML);
            //run();
        }
    };
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //enviando los valores por POST
    ajax.send("id=" + nombre + "|" + descripcion + "|" + id_canciones );
}

//funcion para limpiar los campos
function limpiarCamposGuardarLista() {
    document.guardar_lista.nombre_lista.value = "";
    document.guardar_lista.descripcion_lista.value = "";
}

/* Antes de iniciar ajax validamos los datos */
function check_lista_canciones() {
    var MIN_CANCIONES_LISTA = 4;
    var elem = document.getElementById("metallist_list");
    var child = elem.children;
    if ( child.length === 0 ){
        window.alert("No hay canciones seleccionadas");
    } else if ( child.length < MIN_CANCIONES_LISTA ){
        window.alert("Seleccione un mínimo de " + MIN_CANCIONES_LISTA + " canciones");
    } else {
        var text = "";
        for (var i = 0; i < child.length; i++) {
            text += child[i].id;
            if ( i !== child.length - 1 ){
                text += "|";
            }
        }
        window.alert("Canciones id: " + text);
        guardarlista(text);
    }
}