// document.getElementById("loginForm").addEventListener("submit", function(event) {
//   event.preventDefault(); 
//   console.log("holalaa")
//   const usuario = document.getElementById("Usuario").value;
//   const Contra = document.getElementById("Contra").value;

//   fetch("http://34.236.3.58:3000/api/administrador/login", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json",
//     },
//     body: JSON.stringify({
//       nombreAdmin: usuario,
//       pswd: Contra
//     }),
//   })
//     .then((response) => response.json())
//     .then((data) => {
//       console.log(data)
//       if (data === 1) {
//         window.location.href = "estadisticas.html";
//       } else if (data.access == 0){
//         alert("Usuario o contraseña inválidos");
//       } else {
//         alert("Hubo un error, intentalo nuevamente ")
//       }
//     })
//     .catch((error) => {
//       console.error("Error al iniciar sesión: " + error);
//     }); 
// });


function loginUser(){
  console.log("Todo pinta bien...");
  //Se crea payload (archivo JSON) que contiene nombreAdmin y pswd
  const payload = JSON.stringify({
    nombreAdmin: Usuario.value,
    pswd: Contra.value
  });
  //Se crea el objeto XMLHttpRequest llamado xhr, una forma de realizar solicitudes http asincronicas desde pag web
  const xhr = new XMLHttpRequest();
  //Funcion que se ejecutara cuando la solicitud HTTP se complete
  xhr.onload = () => {

    //Se intenta analizar la respuesta JSON y se almacena en result
    const result = JSON.parse(xhr.responseText);
    //imprime el result
    console.log(result);

    //verifica la propiedad valid en el objeto result = 1
    const check = result['access'];
    // si es uno manda a pagina de estadisticas
    if (check == 1){
      window.location.href = "dashboard.html";
    }else {
      alert('Contraseña o usuario invállido.');
    }
    //alert('Inicio de sesión exitoso');

  };
  console.log("final");
  //Se abre una solicitud post hacia la API
  xhr.open('POST', 'http://34.236.3.58:3000/api/administrador/login');
  //Se establece el Content-Type
  xhr.setRequestHeader('Content-Type', 'application/json');
  //Se aplica la solicitu con los datos del payload
  xhr.send(payload);
      
}