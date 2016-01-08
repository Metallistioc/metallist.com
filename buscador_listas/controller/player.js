/* Metallist v.1 
 * Controlador JS del objeto HTML5 audio
 */

var audioPlayer;
var bttPlay;
var bttPause;
var listaCanciones;
var cancionActual = null;

 // Este tipo de funciones anónimas se auto-ejecutan al cargar el archivo
(function () {
    audioPlayer = document.getElementById("audio_control");
    bttPlay = document.getElementById("bttPlay");
    bttPause = document.getElementById("bttPause");
    listaCanciones = document.getElementById("metallist_list");
    
    // Invocamos a progress bar
    audioPlayer.addEventListener("timeupdate", updateProgress, false);
})(); 

function playStop() {
    if (audioPlayer.paused) {
        audioPlayer.src = getArchivoSonido();
        audioPlayer.play();
        cancionActual.setAttribute('play', 'true');
        reversePlay(true);
    } else {
        audioPlayer.pause();
        cancionActual.removeAttribute('play');
        reversePlay(false);
    }
}

/* Obtenemos el archivo de sonido */
function getArchivoSonido(){
    // Comprobamos que tenga contenido
    if ( listaCanciones.firstElementChild !== null ) {
        // Si no hay ninguna seleccionada, la primera
        if ( cancionActual === null ){
            cancionActual = listaCanciones.firstElementChild;
        }
        return ( cancionActual.getAttribute("files") + "mp3" );
    } else {
        alert("¡Seleccione una canción!");
        return "../../media/audio/01-Mad_Mav-Bloody_Fingers.mp3";
    }
}

/* Finaliza la ejecución del fichero*/
function playEnded(){
    reversePlay(false);
    //alert("Fin de archivo con ID: " + cancionActual.getAttribute("id"));
    cancionActual.removeAttribute('play');
    cancionActual.getElementsByClassName("lista_cancion_grupo_album_any")[0].style.backgroundSize 
            = "0px" + " 12px";
}

// ejecuta el siguiente fichero
function playNext(){
    if ( cancionActual.nextElementSibling !== null ){
        cancionActual = cancionActual.nextElementSibling;
        playStop();
    } else {
        cancionActual = null;
        // Se prodría insertar un booleano para controlar bucle reproducción
        // llamando al primer elemento:
        // else if (bucle)
        //    cancionActual = listaCanciones.firstElementChild;
    }
}

function playForw(){
    audioPlayer.pause();
    playEnded();
    playNext();
}

// Commutador de botones
function reversePlay( disablePlay ){
    if ( disablePlay ){
        bttPlay.disabled = true;
        bttPause.disabled = false;
    } else {
        bttPlay.disabled = false;
        bttPause.disabled = true;
    }
}

// Actualizamos el % del background para mostrar barra de progreso.
function updateProgress() {
   var progress = cancionActual.getElementsByClassName("lista_cancion_grupo_album_any")[0];
   var anchoCaja = progress.offsetWidth;
   
   if (audioPlayer.currentTime > 0) {
      value = Math.floor(( anchoCaja / audioPlayer.duration ) * audioPlayer.currentTime);
   }
   progress.style.background = "../../media/img/progress.png";
   progress.style.backgroundSize = value + "px" + " 12px";
}

/* Clear */
function removeFromList(){
    audioPlayer.pause();
    while ( listaCanciones.firstChild )
        listaCanciones.removeChild(listaCanciones.firstChild);
    reversePlay(false);
    playEnded();
    playNext();
}