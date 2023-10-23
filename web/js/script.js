// Agrega un evento de clic al elemento con el id "icon-menu" (probablemente un ícono de menú) que ejecutará la función "mostrar_menu" cuando se haga clic en él.
document.getElementById("icon-menu").addEventListener("click", mostrar_menu);

// Definición de la función "mostrar_menu" que se ejecutará cuando se haga clic en el elemento con id "icon-menu".
function mostrar_menu() {
    // Alterna (agrega o quita) la clase 'move-container-all' en el elemento con id "move-content".
    // Esta clase probablemente está diseñada para mover el contenido principal de la página, como parte de la animación de despliegue del menú.
    document.getElementById("move-content").classList.toggle('move-container-all');

    // Alterna (agrega o quita) la clase 'show-lateral' en el elemento con id "show-menu".
    // Esta clase probablemente está diseñada para mostrar u ocultar el menú lateral cuando se hace clic en el ícono del menú.
    document.getElementById("show-menu").classList.toggle('show-lateral');
}
