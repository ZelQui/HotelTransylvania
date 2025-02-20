<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<div class="wrapper">
  <!-- Sidebar -->
  <aside id="sidebar">
    <div class="d-flex">
      <!-- Botón para contraer/expandir el sidebar -->
      <button class="toggle-btn" type="button">
        <i class="fa-solid fa-bars"></i>
      </button>
      <div class="sidebar-logo">
        <a href="#" style="cursor: pointer; text-decoration: none;" onclick="location.reload();">
          <i class="fa-solid fa-hotel text-white"></i>
          <span>Hotel Transylvania</span>
        </a>
      </div>
    </div>

    <hr>

    <div class="sidebar-header">
      <a href="#" class="sidebar-link">
        <i class="fa-solid fa-user me-2"></i>
        <span>Usuario</span>
      </a>
    </div>

    <hr>

    <ul class="sidebar-nav">
      <li class="sidebar-item">
        <a id="btnInicio" href="#" class="sidebar-link" onclick="cargarPagina('jsp/inicio.jsp')">
          <i class="fa-solid fa-house me-2"></i>
          <span>Inicio</span>
        </a>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/reserva.jsp')">
          <i class="fa-solid fa-calendar-days me-2"></i>
          <span>Reserva</span>
        </a>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/recepcion.jsp')">
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
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/habitacionesVenta.jsp')">
            <i class="fa-solid fa-basket-shopping me-2"></i>
            Vender Productos
            </a>
          </li>
          <li class="sidebar-item">
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/catalagoProductos.jsp')">
            <i class="fa-solid fa-basket-shopping me-2"></i>
            Catálogo de Productos
            </a>
          </li>
        </ul>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/verificacionSalidas.jsp')">
          <i class="fa-solid fa-right-from-bracket me-2"></i>
          <span>Verificación de Salidas</span>
        </a>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/clientes.jsp')">
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
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/reporteDiario.jsp')">
            <i class="fa-solid fa-sheet-plastic me-2"></i>
            Reporte Diario
            </a>
          </li>
          <li class="sidebar-item">
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/reporteMensual.jsp')">
            <i class="fa-solid fa-sheet-plastic me-2"></i>
            Reporte Mensual
            </a>
          </li>
        </ul>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/usuarios.jsp')">
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
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/informacionHotelera.jsp')">
            <i class="fa-solid fa-gears me-2"></i>
            Información Hotelera
            </a>
          </li>
          <li class="sidebar-item">
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/habitaciones.jsp')">
            <i class="fa-solid fa-gears me-2"></i>
            Habitaciones
            </a>
          </li>
          <li class="sidebar-item">
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/habitacionesCategorias.jsp')">
            <i class="fa-solid fa-gears me-2"></i>
            Categorías
            </a>
          </li>
          <li class="sidebar-item">
            <a href="#" class="sidebar-link" onclick="cargarPagina('jsp/pisos.jsp')">
            <i class="fa-solid fa-gears me-2"></i>
            Niveles / Pisos
            </a>
          </li>
        </ul>
      </li>
    </ul>
    <div class="sidebar-footer">
      <a href="index.jsp" class="sidebar-link">
        <i class="fa-solid fa-door-open me-2"></i>
        <span>Cerrar Sesión</span>
      </a>
    </div>
  </aside>

  <!-- Contenido principal -->
  <main class="main p-4">
    <div class="container-fluid" id="contenido">
      <div class="row">
        <div class="col-lg-8 col-md-12">
          <h1>Bienvenido</h1>
          <p>Selecciona una opción del menú.</p>
        </div>
        <div class="col-lg-4 col-md-12">
          <!-- Otro contenido -->
        </div>
      </div>
    </div>
  </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>