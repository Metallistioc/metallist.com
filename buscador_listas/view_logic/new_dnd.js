/* 
 * Drag & Drop solo HTML5
 */


dragstart
drag
dragenter
dragleave
dragover
drop
dragend

// Manejador del evento draggable="true";
// Cuando comieza a arrastrar
function handleDragStart(e) {
  this.style.opacity = '0.4';  // this / e.target is the source node.
}

var canciones = document.querySelectorAll('.lista_cancion');
[].forEach.call(cols, function(col) {
  col.addEventListener('dragstart', handleDragStart, false);
});

