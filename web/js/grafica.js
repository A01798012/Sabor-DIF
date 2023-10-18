
//funcion con guia de color
function graficaComidaVendidasDonadas() {
    
    // Obtener el elemento canvas
    const canvas = document.getElementById("graficaComidasDonadasVendidas");
    
    // Obtener el contexto 2D del canvas
    const context = canvas.getContext("2d");
    
    // Borrar el contenido del canvas
    if (window.myChart1) {
        window.myChart1.destroy();
    }
    context.clearRect(0, 0, canvas.width, canvas.height);
    
    // Continuar con la lógica de la solicitud AJAX y creación del gráfico
    const payload = JSON.stringify({
        idComedor: Number(comedor.value),
        fecha: fecha.value
    });
    
    console.log(payload);
    
    const xhr = new XMLHttpRequest();
    
    console.log("pasamos payload");
    
    xhr.onload = () => {
        const data = [];
        const result = JSON.parse(xhr.responseText);
        console.log(result);
        for (let i of result) {
            data.push(i['TotalComidasVendidas']);
            aportacionDIA = i['TotalComidasVendidas'];
            data.push(i['TotalComidasDonadas']);
        }

        totalComidas = Number(data[0]+ data[1])
        const totalComidaselement = document.getElementById("comidashoy");
        totalComidaselement.textContent = totalComidas;


        meta = totalComidas;
        const metaelement = document.getElementById("meta");
        if (meta >= 100) {
            metaelement.textContent = `Meta lograda (${totalComidas} vendidas)`;
        } else {
            const comidasFaltantes = 100 - meta;
            metaelement.textContent = `Faltan ${comidasFaltantes} comidas por vender`;
        }

        console.log(aportacionDIA);
        aportacionDIA = aportacionDIA * 13;
        console.log(aportacionDIA);
        const aportacionMeselement = document.getElementById("aportacionDIA");
        aportacionMeselement.textContent = '$' + aportacionDIA;
        let sum = 0;
        data.forEach(item => {
            sum += item;
        });
        
        console.log(data);
        
        // Continuar con la lógica para crear el nuevo gráfico
        const comidasVendidas = Number(data[0]);
        const comidasDonadas = Number(data[1]);

        let colorComidasVendidas;

        if (comidasVendidas <= 40) {
            colorComidasVendidas = 'rgba(255, 0, 0, 0.9)'; // Rojo si es menor o igual a 40
        } else if (comidasVendidas <= 90) {
            colorComidasVendidas = 'rgba(255, 165, 0, 0.9)'; // Naranja si es mayor a 40 y menor o igual a 90
        } else {
            colorComidasVendidas = 'rgba(0, 128, 0, 0.9)'; // Verde si es mayor a 90
        }

        const newChart = new Chart(canvas, {
            type: 'doughnut',
            data: {
                labels: ['Comidas vendidas: ' + comidasVendidas, 'Comidas donadas: ' + comidasDonadas],
                datasets: [{
                    label: 'Comedor ' + comedor.value,
                    data: data,
                    backgroundColor: [colorComidasVendidas, 'rgba(173, 216, 230, 0.7)'] // Azul cielo para Comidas donadas
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: 'Total: ' + (comidasVendidas + comidasDonadas),
                        font: { size: 30 }
                    },
                    legend: {
                        labels: {
                            font: { size: 20 } // Aumenta el tamaño de fuente de las etiquetas del gráfico
                        }
                    }
                }
            }
        });

        
        
        
        window.myChart1 = newChart;
    };
    
    xhr.open('POST', 'http://34.236.3.58:3000/api/graficas/comidasDiarias');
    xhr.setRequestHeader('Content-Type', 'application/json');
    console.log("Mandamos este payload: " + payload);
    xhr.send(payload);
    console.log("Se mandó");
}

function graficaComidasMensuales() {
    console.log("Todo pinta bien...");
    
    // Obtener el elemento canvas
    const canvas3 = document.getElementById("graficaComidasMensuales");
    
    // Obtener el contexto 2D del canvas
    const context = canvas3.getContext("2d");
    
    // Borrar el contenido del canvas
    if (window.myChart3) {
        window.myChart3.destroy();
    }
    context.clearRect(0, 0, canvas3.width, canvas3.height);
    
    // Continuar con la lógica de la solicitud AJAX y creación del gráfico
    const payload = JSON.stringify({
        idComedor: Number(comedor.value),
        fecha: fecha.value
    });
    
    console.log(payload);
    
    const xhr = new XMLHttpRequest();
    
    console.log("pasamos payload");
    
    xhr.onload = () => {
        const data = [];
        const result = JSON.parse(xhr.responseText);
        console.log(result);
        
        for (let i of result) {
            data.push(i['TotalComidasVendidas']);
            aportacionMES = i['TotalComidasVendidas'];
            data.push(i['TotalComidasDonadas']);
        }

        aportacionMES = aportacionMES*13;
        const aportacionMeselement = document.getElementById("aportacionMES");
        aportacionMeselement.textContent = '$' + aportacionMES;
        // Continuar con la lógica para crear el nuevo gráfico
        const newChart = new Chart(canvas3, {
            type: 'doughnut',
            data: {
                labels: ['Comidas vendidas: ' + Number(data[0]), 'Comidas donadas: '+ Number(data[1])],
                datasets: [{
                    label: 'Comedor ' + comedor.value,
                    data: data, backgroundColor:[
                        'rgba(255, 99, 132, 0.6)',  // Color de la primera barra
                        'rgba(54, 162, 235, 0.4)'
                    ]
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true, 
                        text: 'Total: '+ Number(data[0]+ data[1]), font: { size: 30 }
                        },
                        legend: {
                            labels: {
                                font: { size: 20 } // Aumenta el tamaño de fuente de las etiquetas del gráfico
                            }
                        }
                    }
                }
        });

        window.myChart3 = newChart;
        
        console.log("Salimos de la gráfica");
    };
    
    xhr.open('POST', 'http://34.236.3.58:3000/api/graficas/comidas/mensuales');
    xhr.setRequestHeader('Content-Type', 'application/json');
    console.log("Mandamos este payload: " + payload);
    xhr.send(payload);
    console.log("Se mandó");
}

function graficaComidasParaLlevar() {
    console.log("Todo pinta bien...");
    
    // Obtener el elemento canvas
    const canvas2 = document.getElementById("graficaComidasParaLlevar");
    
    // Obtener el contexto 2D del canvas
    const context = canvas2.getContext("2d");
    
    // Borrar el contenido del canvas
    if (window.myChart2) {
        window.myChart2.destroy();
    }
    context.clearRect(0, 0, canvas2.width, canvas2.height);
    
    // Continuar con la lógica de la solicitud AJAX y creación del gráfico
    const payload = JSON.stringify({
        idComedor: Number(comedor.value),
        fecha: fecha.value
    });
    
    console.log(payload);
    
    const xhr = new XMLHttpRequest();
    
    console.log("pasamos payload");
    
    xhr.onload = () => {
        const data = [];
        const result = JSON.parse(xhr.responseText);
        
        for (let i of result) {
            data.push(i['ComidasParaLlevar']);
            data.push(i['ComidasEnComedor']);
        }
        const comidasParaLlevar = Number(data[0]);
        const comidasEnComedor = Number(data[1]);

        
        console.log(data);
        
        // Continuar con la lógica para crear el nuevo gráfico
        const newChart = new Chart(canvas2, {
            type: 'pie',
            data: {
                labels: ['Comidas para llevar: ' + comidasParaLlevar, 'Comidas en comedor: ' + comidasEnComedor],
                datasets: [{
                    label: 'Comedor ' + comedor.value,
                    data: data,  backgroundColor: [
                        'rgba(75, 192, 192, 0.4)',   // Color de la cuarta barra
                        'rgba(153, 102, 255, 0.4)' // Color de la segunda sección
                        // Agrega más colores según la cantidad de secciones
                    ],
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        // text: 'Comidas vendidas y donadas Comedor 1'
                    },
                    legend: {
                        labels: {
                            font: { size: 20 } // Aumenta el tamaño de fuente de las etiquetas del gráfico
                        }
                    }
                }
            }
        });
        window.myChart2 = newChart;
    };
    
    xhr.open('POST', 'http://34.236.3.58:3000/api/graficas/comidasDiarias/llevar');
    xhr.setRequestHeader('Content-Type', 'application/json');
    console.log("Mandamos este payload: " + payload);
    xhr.send(payload);
    console.log("Se mandó");
    const aportacionMeselement = document.getElementById("aportacionMES");
    aportacionMeselement.textContent = 'Aportación MES: ' + aportacionMES;
}

function graficaComidasParaLlevarMensuales() {
    console.log("Todo pinta bien...");
    
    // Obtener el elemento canvas
    const canvas4 = document.getElementById("graficaComidasParaLlevarMensuales");
    
    // Obtener el contexto 2D del canvas
    const context = canvas4.getContext("2d");
    
    // Borrar el contenido del canvas
    if (window.myChart4) {
        window.myChart4.destroy();
    }
    context.clearRect(0, 0, canvas4.width, canvas4.height);
    
    // Continuar con la lógica de la solicitud AJAX y creación del gráfico
    const payload = JSON.stringify({
        idComedor: Number(comedor.value),
        fecha: fecha.value
    });
    
    console.log(payload);
    
    const xhr = new XMLHttpRequest();
    
    xhr.onload = () => {
        const data = [];
        const result = JSON.parse(xhr.responseText);
        console.log(result);
        
        for (let i of result) {
            data.push(i['ComidasParaLlevar']);
            data.push(i['ComidasEnComedor']);
        }
        
        console.log(data);
        const comidasParaLlevar = Number(data[0]);
        const comidasEnComedor = Number(data[1]);
        
        // Continuar con la lógica para crear el nuevo gráfico
        const newChart = new Chart(canvas4, {
            type: 'pie',
            data: {
                labels: ['Comidas para llevar: ' + comidasParaLlevar, 'Comidas en comedor: ' + comidasEnComedor],
                datasets: [{
                    label: 'Comedor ' + comedor.value,
                    data: data,  backgroundColor: [
                        'rgba(75, 192, 192, 0.4)',   // Color de la cuarta barra
                        'rgba(153, 102, 255, 0.4)' // Color de la segunda sección
                        // Agrega más colores según la cantidad de secciones
                    ],
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        // text: 'Comidas vendidas y donadas Comedor 1'
                    },
                    legend: {
                        labels: {
                            font: { size: 20 } // Aumenta el tamaño de fuente de las etiquetas del gráfico
                        }
                    }
                }
            }
        });
        window.myChart4 = newChart;
    };
    
    xhr.open('POST', 'http://34.236.3.58:3000/api/graficas/comidasMensuales/llevar');
    xhr.setRequestHeader('Content-Type', 'application/json');
    console.log("Mandamos este payload: " + payload);
    xhr.send(payload);
    console.log("Se mandó");
}

function graficaEncuesta() {
    console.log("Todo pinta bien...");
    
    // Obtener el elemento canvas
    const canvas5 = document.getElementById("graficaEncuesta");
    
    // Obtener el contexto 2D del canvas
    const context = canvas5.getContext("2d");
    
    // Borrar el contenido del canvas
    if (window.myChart5) {
        window.myChart5.destroy();
    }
    context.clearRect(0, 0, canvas5.width, canvas5.height);
    
    // Continuar con la lógica de la solicitud AJAX y creación del gráfico
    const payload = JSON.stringify({
        idComedor: Number(comedor.value)
    });
    
    console.log(payload);
    
    const xhr = new XMLHttpRequest();
    
    console.log("pasamos payload");
    
    xhr.onload = () => {
        const data = [];
        const labels = [];
        const num = [];
        const result = JSON.parse(xhr.responseText);
        console.log(result);
        
        for (let i of result) {
            num.push(i['NumeroEncuestas']);
            data.push(Number(i['Higiene'])/i['NumeroEncuestas']);
            data.push(Number(i['Tiempo'])/i['NumeroEncuestas']);
            data.push(Number(i['Sabor']/i['NumeroEncuestas']));
            data.push(Number(i['Atencion'])/i['NumeroEncuestas']);
            data.push(Number(i['Lugar'])/i['NumeroEncuestas']);
        }
        
        console.log(data);
        
        // Continuar con la lógica para crear el nuevo gráfico
        const newChart = new Chart(canvas5, {
            type: 'bar',
            data: {
                labels: ['Higiene', 'Tiempo', 'Sabor', 'Atención', 'Lugar' ],
                datasets: [{
                    label: 'Comedor ' + comedor.value + ', ' + num[0] + ' respuestas',
                    data: data,
                    backgroundColor: data.map(value => {
                        if (value <= 4) {
                            return 'rgba(255, 0, 0, 0.9)'; // Rojo si es menor o igual a 3
                        } else if (value <= 7) {
                            return 'rgba(255, 165, 0, 0.6)'; // Naranja si es mayor a 4 y menor o igual a 7
                        } else {
                            return 'rgba(0, 128, 0, 0.6)'; // Verde si es mayor a 7
                        }
                    }),
                    borderColor: [
                        'rgba(255, 99, 132, 1)',    // Borde de la primera barra
                        'rgba(54, 162, 235, 1)',    // Borde de la segunda barra
                        'rgba(255, 206, 86, 1)',    // Borde de la tercera barra
                        'rgba(75, 192, 192, 1)',    // Borde de la cuarta barra
                        'rgba(153, 102, 255, 1)'    // Borde de la quinta barra
                    ],
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        // text: 'Comidas vendidas y donadas Comedor 1'
                    },
                    legend: {
                        labels: {
                            font: { size: 20 } // Aumenta el tamaño de fuente de las etiquetas del gráfico
                        }
                    }
                },
                scales: {
                    y: {
                        suggestedMin: 0, // Establece el valor mínimo del eje Y
                        suggestedMax: 10, // Establece el valor máximo del eje Y
                    }
                }
            }
        });
        
        window.myChart5 = newChart;
        
        console.log("Salimos de la gráfica");
    };
    
    xhr.open('POST', 'http://34.236.3.58:3000/api/graficas/encuesta');
    xhr.setRequestHeader('Content-Type', 'application/json');
    console.log("Mandamos este payload: " + payload);
    xhr.send(payload);
}

function graficaCondiciones() {
    const xhr = new XMLHttpRequest();
    xhr.onload = () => {
        const data = [];
        const labels = [];
        const result = JSON.parse(xhr.responseText);
        console.log(result);
        for (let i of result) {
            data.push(i['TotalComensales']);
            console.log(data)
            labels.push(i['nombreCondicion']);
            console.log(labels)
        }
  
        //Cambiar usuariosXpais
        const ctx = document.getElementById("graficaCondiciones");
        new Chart(ctx, {
            type: 'polarArea',
            data: {
                labels: labels,
                datasets: [{
                    label: "Condiciones o grupos vulnerables dentro de los comensales",
                    data: data
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                    }
                }
            }
        });
    };
    xhr.open('POST','http://34.236.3.58:3000/api/graficas/condiciones' );
    xhr.send(null);
};

function todas(){
    graficaComidaVendidasDonadas();
    graficaComidasMensuales();
    graficaComidasParaLlevar();
    graficaComidasParaLlevarMensuales();
    graficaEncuesta();
}

graficaCondiciones();
