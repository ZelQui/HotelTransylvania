// Función para expandir o contraer el sidebar
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('expand');

    // Guardar el estado en localStorage
    localStorage.setItem('sidebarExpanded', sidebar.classList.contains('expand'));
}

// Asignar la función al botón de toggle
document.querySelector('.toggle-btn').addEventListener('click', toggleSidebar);

// Restaurar el estado del sidebar al cargar la página
document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('sidebar');
    const isExpanded = localStorage.getItem('sidebarExpanded') === 'true';

    if (isExpanded) {
        sidebar.classList.add('expand');
    } else {
        sidebar.classList.remove('expand');
    }
});

// Función para cargar el contenido sin actualizar el sidebar
function cargarPagina(pagina) {
    fetch(pagina)  // Agrega la extensión .jsp a la página solicitada
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al cargar la página: ' + pagina);
            }
            return response.text();
        })
        .then(html => {
            document.getElementById('contenido').innerHTML = html;

            // Esperar a que el DOM del nuevo contenido esté disponible
            setTimeout(() => {
                if (pagina === "jsp/inicio.jsp") {
                    iniciarGrafica(); // Ejecutar solo si es la página de inicio
                }
            }, 100);
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById('contenido').innerHTML = '<div class="alert alert-danger">No se pudo cargar el contenido.</div>';
        });
}

function iniciarGrafica() {
    const canvas = document.getElementById("graficaIngresos");
    if (!canvas) {
        console.error("No se encontró el elemento canvas con id 'graficaIngresos'");
        return;
    }

    const ctx = canvas.getContext("2d");

    // Datos de ingresos por año
    const datosIngresos = {
        "2023": [4500, 3200, 5000, 4800, 5200, 6000, 6300, 6100, 5800, 6200, 6400, 7000],
        "2024": [6500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        "2025": [7000, 7300, 7500, 7800, 8000, 8200, 8500, 8700, 8900, 9100, 9400, 9600]
    };

    // Obtener el valor del select
    const filtroAnio = document.getElementById("filtroAnio");

    // Crear la gráfica
    let chart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            datasets: [{
                label: "Ingresos",
                data: datosIngresos[filtroAnio.value], // Cargar los datos según el año seleccionado
                backgroundColor: "rgba(54, 162, 235, 0.5)",
                borderColor: "rgba(54, 162, 235, 1)",
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // Evento para cambiar los datos cuando se seleccione otro año
    filtroAnio.addEventListener("change", function() {
        const nuevoAnio = filtroAnio.value;
        chart.data.datasets[0].data = datosIngresos[nuevoAnio]; // Actualizar datos
        chart.update(); // Refrescar la gráfica
    });
}
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".btnEditarProducto").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let name = this.getAttribute("data-name");
            let price = this.getAttribute("data-price");
            console.log(id)

            document.getElementById("inputEditarIdProducto").value = id;
            document.getElementById("nombreEditar").value = name;
            document.getElementById("precioVentaEditar").value = price;
        });
    });
});
function abrirModalEditar(id) {
    document.getElementById("inputEditarIdProducto").value = id;
    fetch("productcontrol?action=get&idproduct=" + id)
        .then(response => response.json())  // Convertimos la respuesta a JSON
        .then(data => {
            // Llenar los campos del formulario con los datos obtenidos
            document.getElementById("nombreEditar").value = data.name;
            document.getElementById("precioVentaEditar").value = data.price;
        })
        .catch(error => console.error("Error al obtener datos:", error));
}
function buscar() {
    var nameFilter = $("#nameSearch").val();
    $.ajax({
        url: "filterProducServlet",
        data: { filter: nameFilter },
        success: function (result) {
            // Insertar la tabla filtrada
            $("#tablaCatalagoProductos").html(result);

            // Extraer la cantidad de productos desde el comentario oculto
            var match = result.match(/<!--COUNT:(\d+)-->/);
            var cantidad = match ? match[1] : 0;

            // Actualizar el input con la cantidad de registros
            $("#sizeProducts").val(cantidad);
        }
    });
}


