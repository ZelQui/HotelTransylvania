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
function cargarPagina(pagina, view = "", limpiarView = false) {
    // Actualizar la URL con el nuevo 'view'
    if (!view) {
        // Si 'view' no se pasa, obtenerlo del enlace clickeado
        const link = document.querySelector(`[onclick="cargarPagina('${pagina}')"]`);
        view = link ? link.getAttribute("data-pagina") : "";
    }

    if (view) {
        // Actualizar la URL con el nuevo 'view'
        history.replaceState({}, document.title, `${window.location.pathname}?view=${view}`);
    }

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
function editarClient(id) {
    document.getElementById("inputEditarCliente").value = id;

    fetch("clientcontrol?action=get&idclient=" + id)
        .then(response => response.json())  // Convertimos la respuesta a JSON
        .then(data => {
            // Llenar los campos del formulario con los datos obtenidos
            document.getElementById("nombreEditar").value = data.name;
            document.getElementById("tipoDocumentoEditar").value = data.typeDocument;
            document.getElementById("documentoEditar").value = data.numberDocument;
            document.getElementById("correoEditar").value = data.email;
            document.getElementById("telefonoEditar").value = data.telephone;
        })
        .catch(error => console.error("Error al obtener datos:", error));
}
function editarRoom(id) {
    document.getElementById("inputEditarHabitacion").value = id;

    fetch("roomcontroller?action=get&idroom=" + id)
        .then(response => response.json())  // Convertimos la respuesta a JSON
        .then(data => {
            // Llenar los campos del formulario con los datos obtenidos
            document.getElementById("nombreEditar").value = data.number;
            document.getElementById("tipoeditar").value = data.typeRoom.id;
            document.getElementById("precioEditar").value = data.price;
            document.getElementById("estatusEditar").value = data.statusRoom;
        })
        .catch(error => console.error("Error al obtener datos:", error));
}
function editarTypeRoom(id) {
    document.getElementById("inputEditarTipoHabitacion").value = id;

    fetch("typeroomcontroller?action=get&idtyperoom=" + id)
        .then(response => response.json())  // Convertimos la respuesta a JSON
        .then(data => {
            // Llenar los campos del formulario con los datos obtenidos
            document.getElementById("nombreEditar").value = data.name;
        })
        .catch(error => console.error("Error al obtener datos:", error));
}
function editarUser(id) {
    document.getElementById("inputEditarUsuario").value = id;

    fetch("user?action=get&idEmployee=" + id)
        .then(response => response.json())  // Convertimos la respuesta a JSON
        .then(data => {
            // Llenar los campos del formulario con los datos obtenidos
            document.getElementById("nombreEditar").value = data.name_employee;
            document.getElementById("correoEditar").value = data.email_user;
            document.getElementById("usuarioEditar").value = data.name_user;
            document.getElementById("estatusEditar").value = data.estado_user;
            // Obtener el select y recorrer sus opciones
            // Mapeo del texto del rol a su valor en el <select>
            let rolMap = {
                "Administrador": "1",
                "Recepcionista": "2"
            };
            document.getElementById("rolEditar").value = rolMap[data.tipo_user] || ""; // Si no encuentra coincidencia, deja vacío
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
function buscarCliente(){
    var nameFilter = $("#numberDocument").val();
    $.ajax({
        url: "filterClientUniq",
        data: { filter: nameFilter },
        success: function (result) {
            // Insertar la tabla filtrada
            $("#datosCliente").html(result);
        }
    });
}
function Search(wordKey, tableSearch, quantitySearch, controller) {
    var nameFilter = $(wordKey).val().trim();

    $.ajax({
        url: controller,
        data: { filter: nameFilter },
        success: function (result) {
            $(tableSearch).find("tbody").html(result);

            // Extraer la cantidad de registros desde el comentario oculto
            var match = result.match(/<!--COUNT:(\d+)-->/);
            var cantidad = match ? parseInt(match[1]) : 0;

            // Actualizar el input con la cantidad de registros
            $(quantitySearch).val(cantidad);
        },
        error: function () {
            console.error("Error al obtener los datos filtrados.");
        }
    });
}

document.addEventListener("DOMContentLoaded", function () {
    // Obtener parámetros de la URL
    const params = new URLSearchParams(window.location.search);
    let view = params.get("view") || "inicio";
    let page = params.get("page") || 1; // Obtener el número de la página

    const paginas = {
        inicio: "jsp/inicio.jsp",
        reserva: "jsp/reserva.jsp",
        recepcion: "jsp/recepcion.jsp",
        venderProducto: "jsp/venderProducto.jsp",
        catalogoProductos: "jsp/catalagoProductos.jsp",
        verificacionSalidas: "jsp/verificacionSalidas.jsp",
        clientes: "jsp/clientes.jsp",
        reporteDiario: "jsp/reporteDiario.jsp",
        reporteMensual: "jsp/reporteMensual.jsp",
        usuarios: "jsp/usuarios.jsp",
        informacionHotelera: "jsp/informacionHotelera.jsp",
        habitaciones: "jsp/habitaciones.jsp",
        habitacionesTipo: "jsp/habitacionesTipo.jsp",
        pisos: "jsp/pisos.jsp",
        habitacionesVenta: "jsp/habitacionesVenta.jsp",
        procesoSalida: "jsp/procesoSalida.jsp",
        ventaDirecta: "jsp/ventaDirecta.jsp",
        procesarHabitacion: "jsp/procesarHabitacion.jsp"

    };

    if (paginas[view]) {
        let url = paginas[view];
        if (page && page !== 1) { // Solo agrega page si no es la página 1
            url += `?page=${page}`;
        }
        cargarPagina(url, view);
    }

    document.querySelectorAll(".pagination .page-link").forEach(link => {
        link.addEventListener("click", function (e) {
            e.preventDefault(); // Evita la recarga de la página

            let url = new URL(this.href, window.location.origin);
            let newPage = url.searchParams.get("page");

            if (newPage) {
                params.set("page", newPage);
                window.location.href = `${window.location.pathname}?${params.toString()}`;
            }
        });
    });

    const expandirMenu = {
        venderProducto: "puntoVenta",
        catalogoProductos: "puntoVenta",
        reporteDiario: "reportes",
        reporteMensual: "reportes",
        informacionHotelera: "configuracion",
        habitaciones: "configuracion",
        habitacionesTipo: "configuracion",
        pisos: "configuracion"
    };

    if (expandirMenu[view]) {
        const menu = document.getElementById(expandirMenu[view]);
        if (menu) {
            menu.classList.add("show");
            const link = document.querySelector(`[data-bs-target='#${expandirMenu[view]}']`);
            if (link) link.setAttribute("aria-expanded", "true");
        }
    }

    // Marcar como "active" la opción correcta en el sidebar
    document.querySelectorAll(".sidebar-link").forEach(item => {
        let paginaSeleccionada = item.getAttribute("data-pagina");

        if (paginaSeleccionada === view) {
            // Remover la clase "active" de todos antes de asignarla a la correcta
            document.querySelectorAll(".sidebar-link").forEach(link => link.classList.remove("active"));
            item.classList.add("active");
        }

        // Evento para cambiar de vista sin recargar la página
        item.addEventListener("click", function (e) {
            e.preventDefault(); // Evita la recarga de la página

            if (paginas[paginaSeleccionada]) {
                cargarPagina(paginas[paginaSeleccionada], paginaSeleccionada);
            }
        });
    });
});