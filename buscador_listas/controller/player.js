var audioPlayer;
var bttPlay;
var bttPause;
var listaCanciones;
var cancionActual = null;

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
    cancionActual.getElementsByClassName("lista_cancion_grupo_album_any")[0].style.backgroudSize 
            = "0px 12px";
    playNext();
}

// ejecuta el siguiente fichero
function playNext(){
    if ( cancionActual.nextElementSibling !== null ){
        cancionActual = cancionActual.nextElementSibling;
        playStop();
    } else {
        cancionActual = null;
    }
}

function reversePlay( disablePlay ){
    if ( disablePlay ){
        bttPlay.disabled = true;
        bttPause.disabled = false;
    } else {
        bttPlay.disabled = false;
        bttPause.disabled = true;
    }
}

function updateProgress() {
   //var progress = document.getElementById("progress");
   var progress = cancionActual.getElementsByClassName("lista_cancion_grupo_album_any")[0];
   

   var anchoCaja = progress.offsetWidth;
   if (audioPlayer.currentTime > 0) {
      value = Math.floor(( anchoCaja / audioPlayer.duration ) * audioPlayer.currentTime);
   }
   progress.style.background = "../../media/img/progress.png";
   progress.style.backgroundSize = value + "px" + " 12px";
}
