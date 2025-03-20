<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="development.team.hoteltransylvania.Model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="development.team.hoteltransylvania.Model.InformationHotel" %>
<%@ page import="development.team.hoteltransylvania.Business.GestionInformationHotel" %>
<%
    InformationHotel hotelInfo = GestionInformationHotel.getInformationHotel();

    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp"); //Mensaje: Inicia sesión primero
        return;
    }
    User usuario = (User) sessionObj.getAttribute("usuario");
    boolean mostrarModal = BCrypt.checkpw("123456", usuario.getPassword());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Transylvania</title>
    <link rel="stylesheet" href="css/global.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <!-- Estilo de inicio.jsp -->
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/grafica.css">
    <!-- Estilo de reserva.jsp -->
    <link rel="stylesheet" href="css/reserva.css">
    <!-- Estilo de recepcion.jsp y habitacionVenta.jsp y verificacionSalidas.jsp -->
    <link rel="stylesheet" href="css/habitaciones.css">
    <!-- Estilo de ventaDirecta.jsp y venderProductos.jsp -->
    <link rel="stylesheet" href="css/venderProductos.css">
</head>

<body>
<!-- Modal para cambiar contraseña -->
<div class="modal fade" id="modalCambiarPassword" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Cambiar Contraseña</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <p>Tu contraseña actual es la predeterminada. Por seguridad, cámbiala ahora.</p>
                <form id="formCambiarPassword" action="user" method="post">
                    <input type="hidden" name="accion" value="updatePassword">
                    <div class="mb-3">
                        <label for="nuevaPassword">Nueva Contraseña</label>
                        <input type="password" class="form-control" name="newPassword" id="nuevaPassword" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmarPassword">Confirmar Contraseña</label>
                        <input type="password" class="form-control" id="confirmarPassword" required>
                    </div>
                    <div id="errorMensaje" class="alert alert-danger mt-3" role="alert" style="display: none;">
                        Las contraseñas no coinciden.
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar Contraseña</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="wrapper">
    <!-- Sidebar -->
    <aside id="sidebar">
        <div class="d-flex">
            <!-- Botón para contraer/expandir el sidebar -->
            <button class="toggle-btn" type="button">
                <i class="fa-solid fa-bars"></i>
            </button>
            <div class="sidebar-logo text-white">
                <i class="fa-solid fa-hotel "></i>
                <span><%=hotelInfo.getName()%></span>
            </div>
        </div>
        <hr>

        <div class="sidebar-header">
            <a href="#" class="sidebar-link">
                <i class="fa-solid fa-user me-2"></i>
                <span><%=usuario.getEmployee().getName()%></span>
            </a>
        </div>

        <hr>
        <!-- Menú de opciones -->
        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a id="btnInicio" href="#" class="sidebar-link" data-pagina="inicio"
                   onclick="cargarPagina('jsp/inicio.jsp')">
                    <i class="fa-solid fa-house me-2"></i>
                    <span>Inicio</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link" data-pagina="reserva" onclick="cargarPagina('jsp/reserva.jsp')">
                    <i class="fa-solid fa-calendar-days me-2"></i>
                    <span>Reserva</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link" data-pagina="recepcion" onclick="cargarPagina('jsp/recepcion.jsp')">
                    <i class="fa-solid fa-right-to-bracket me-2"></i>
                    <span>Recepción</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                   data-bs-target="#puntoVenta" aria-expanded="false" aria-controls="auth">
                    <i class="fa-solid fa-basket-shopping me-2"></i>
                    <span>Punto de Venta</span>
                </a>
                <ul id="puntoVenta" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="habitacionesVenta"
                           onclick="cargarPagina('jsp/habitacionesVenta.jsp')">
                            <i class="fa-solid fa-basket-shopping me-2"></i>
                            Vender Productos
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="catalagoProductos"
                           onclick="cargarPagina('jsp/catalagoProductos.jsp', 'catalogoProductos')">
                            <i class="fa-solid fa-basket-shopping me-2"></i>
                            Catálogo de Productos
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="habitacionesServicio"
                           onclick="cargarPagina('jsp/habitacionesServicio.jsp')">
                            <i class="fa-solid fa-basket-shopping me-2"></i>
                            Vender Servicios
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="catalagoServicios"
                           onclick="cargarPagina('jsp/catalagoServicios.jsp', 'catalogoServicios')">
                            <i class="fa-solid fa-basket-shopping me-2"></i>
                            Catálogo de Servicios
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link" data-pagina="verificacionSalidas"
                   onclick="cargarPagina('jsp/verificacionSalidas.jsp')">
                    <i class="fa-solid fa-right-from-bracket me-2"></i>
                    <span>Verificación de Salidas</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link" data-pagina="clientes" onclick="cargarPagina('jsp/clientes.jsp')">
                    <i class="fa-solid fa-users me-2"></i>
                    <span>Clientes</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                   data-bs-target="#reportes" aria-expanded="false" aria-controls="auth">
                    <i class="fa-solid fa-sheet-plastic me-2"></i>
                    <span>Reportes</span>
                </a>
                <ul id="reportes" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="reporteDiario"
                           onclick="cargarPagina('jsp/reporteDiario.jsp')">
                            <i class="fa-solid fa-sheet-plastic me-2"></i>
                            Reporte Diario
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="reporteMensual"
                           onclick="cargarPagina('jsp/reporteMensual.jsp')">
                            <i class="fa-solid fa-sheet-plastic me-2"></i>
                            Reporte Mensual
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link" data-pagina="usuarios" onclick="cargarPagina('jsp/usuarios.jsp')">
                    <i class="fa-solid fa-users-gear me-2"></i>
                    <span>Usuarios</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                   data-bs-target="#configuracion" aria-expanded="false" aria-controls="auth">
                    <i class="fa-solid fa-gears me-2"></i>
                    <span>Configuración</span>
                </a>
                <ul id="configuracion" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="informacionHotelera"
                           onclick="cargarPagina('jsp/informacionHotelera.jsp')">
                            <i class="fa-solid fa-gears me-2"></i>
                            Información Hotelera
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="habitaciones"
                           onclick="cargarPagina('jsp/habitaciones.jsp')">
                            <i class="fa-solid fa-gears me-2"></i>
                            Habitaciones
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="habitacionesTipo"
                           onclick="cargarPagina('jsp/habitacionesTipo.jsp')">
                            <i class="fa-solid fa-gears me-2"></i>
                            Tipos de Habitación
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-pagina="pisos" onclick="cargarPagina('jsp/pisos.jsp')">
                            <i class="fa-solid fa-gears me-2"></i>
                            Pisos / Niveles
                        </a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="sidebar-footer">
            <a href="#" class="sidebar-link" onclick="logout();">
                <i class="fa-solid fa-door-open me-2"></i>
                <span>Cerrar Sesión</span>
            </a>
        </div>

        <!-- Script para cerrar sesión -->
        <script>
            function logout() {
                fetch('logout', {method: 'POST'})
                    .then(response => {
                        if (response.redirected) {
                            window.location.href = response.url;
                        }
                    })
                    .catch(error => console.error('Error al cerrar sesión:', error));
            }
        </script>
    </aside>

    <!-- Contenido principal dinámicamente cargado -->
    <main class="main p-4">
        <div class="container-fluid" id="contenido">
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Script para validar que ambas contraseñas coincidan antes de enviar el formulario -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Mostrar modal de cambio de contraseña si es necesario
        <% if (mostrarModal) { %>
        const modalPassword = new bootstrap.Modal(document.getElementById("modalCambiarPassword"));
        modalPassword.show();
        <% } %>

        // Validar que ambas contraseñas coincidan antes de enviar el formulario
        document.getElementById("formCambiarPassword").addEventListener("submit", function (event) {
            const nuevaPassword = document.getElementById("nuevaPassword").value;
            const confirmarPassword = document.getElementById("confirmarPassword").value;
            const errorMensaje = document.getElementById("errorMensaje");

            if (nuevaPassword !== confirmarPassword) {
                event.preventDefault();
                errorMensaje.style.display = "block";
            } else {
                errorMensaje.style.display = "none";
                // Mostrar alerta de contraseña actualizada
                event.preventDefault(); // Evitar el envío del formulario para mostrar la alerta
                Swal.fire({
                    title: 'Contraseña Actualizada',
                    text: 'Tu contraseña ha sido actualizada exitosamente.',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    allowOutsideClick: false // Evitar cerrar la alerta hasta que se presione el botón OK
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById("formCambiarPassword").submit(); // Enviar el formulario después de la alerta
                    }
                });
            }
        });
    });

    // Evitar problemas con múltiples modales abiertos
    document.addEventListener("hidden.bs.modal", function () {
        document.body.classList.remove("modal-open");
        document.querySelectorAll(".modal-backdrop").forEach(el => el.remove());
    });
</script>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const sidebarLinks = document.querySelectorAll(".sidebar-link");

        sidebarLinks.forEach(link => {
            link.addEventListener("click", function () {
                // Remover clase 'active' de todos los enlaces
                sidebarLinks.forEach(item => item.classList.remove("active"));

                // Agregar la clase 'active' al elemento seleccionado
                this.classList.add("active");

                // Cerrar todos los dropdowns
                document.querySelectorAll(".sidebar-dropdown").forEach(dropdown => {
                    dropdown.classList.remove("show");
                });

                // Si el enlace pertenece a un dropdown, abrir el menú y resaltar la opción
                let parentDropdown = this.closest(".sidebar-dropdown");
                if (parentDropdown) {
                    parentDropdown.classList.add("show");
                    let parentItem = parentDropdown.closest(".sidebar-item");
                    if (parentItem) {
                        parentItem.querySelector(".has-dropdown").classList.add("active");
                    }
                }
            });
        });

        // Verificar la URL para marcar como activo el enlace correspondiente al cargar la página
        let currentPage = window.location.pathname.split("/").pop();
        sidebarLinks.forEach(link => {
            if (link.getAttribute("onclick")?.includes(currentPage)) {
                link.classList.add("active");

                // Si está dentro de un dropdown, abrirlo
                let parentDropdown = link.closest(".sidebar-dropdown");
                if (parentDropdown) {
                    parentDropdown.classList.add("show");
                    let parentItem = parentDropdown.closest(".sidebar-item");
                    if (parentItem) {
                        parentItem.querySelector(".has-dropdown").classList.add("active");
                    }
                }
            }
        });
    });
</script>
</body>
</html>