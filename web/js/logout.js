const logout = document.querySelector("#logout");

logout.addEventListener('click', () => {
    const confirmLogout = confirm("¿Estás seguro de que deseas salir?");
        if (confirmLogout) {
            window.location.href = "inicio.html";
        } else {
            window.location.href = "dashboard.html";
        }
})
