// Selecciona el elemento HTML que representa el menú lateral (sideMenu) y almacénalo en la variable "sideMenu".
const sideMenu = document.querySelector("aside");

// Selecciona el elemento HTML con el id "menu-btn" (botón para abrir el menú) y almacénalo en la variable "menuBtn".
const menuBtn = document.querySelector("#menu-btn");

// Selecciona el elemento HTML con el id "close-btn" (botón para cerrar el menú) y almacénalo en la variable "closeBtn".
const closeBtn = document.querySelector("#close-btn");

// Agrega un evento de clic al elemento "menuBtn" que se ejecuta cuando el usuario hace clic en él.
menuBtn.addEventListener('click', () => {
    // Cuando se hace clic en "menuBtn," cambia el estilo de "sideMenu" para que se muestre (display: 'block').
    sideMenu.style.display = 'block';
})

// Agrega un evento de clic al elemento "closeBtn" que se ejecuta cuando el usuario hace clic en él.
closeBtn.addEventListener('click', () => {
    // Cuando se hace clic en "closeBtn," cambia el estilo de "sideMenu" para que se oculte (display: 'none').
    sideMenu.style.display = 'none';
})
