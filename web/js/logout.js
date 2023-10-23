// Selecciona el elemento HTML con el id "logout" y almacénalo en la variable "logout".
const logout = document.querySelector("#logout");

// Agrega un evento de clic al elemento "logout" que se ejecuta cuando el usuario hace clic en él.
logout.addEventListener('click', () => {
    // Muestra un cuadro de confirmación al usuario con un mensaje.
    const confirmLogout = confirm("¿Estás seguro de que deseas salir?");

    // Si el usuario hace clic en "Aceptar" en el cuadro de confirmación.
    if (confirmLogout) {
        // Redirige al usuario a la página "inicio.html".
        window.location.href = "inicio.html";
    } else {
        // Si el usuario hace clic en "Cancelar" en el cuadro de confirmación,
        // redirige al usuario a la página "dashboard.html".
        window.location.href = "dashboard.html";
    }
})
