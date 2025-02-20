<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <title>Proceso Salida</title>
</head>

<body>
<div class="d-flex justify-content-between align-items-center">
  <h4><i class="fa-solid fa-right-from-bracket me-2"></i> Proceso de Salida</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item"><a href="#" onclick="cargarPagina('jsp/VerificacionSalidas.jsp')">Habitaciones</a></li>
      <li class="breadcrumb-item active" aria-current="page">Proceso Salida</li>
    </ol>
  </nav>
</div>

<!-- Sección de Información -->
<div class="row mt-4">
  <div class="col-4">
    <div class="card">
      <div class="card-header bg-light"><strong>Datos de la Habitación</strong></div>
      <div class="card-body">
        <p><strong>Nombre:</strong> 101</p>
        <p><strong>Tipo:</strong> SENCILLA</p>
        <p><strong>Costo:</strong> <span class="text-primary">S/.200</span></p>
        <p><strong>Descuento:</strong> <span>Ninguno</span></p>
      </div>
    </div>
  </div>
  <div class="col-4">
    <div class="card">
      <div class="card-header bg-light"><strong>Datos del Cliente</strong></div>
      <div class="card-body">
        <p><strong>Nombre:</strong> Gonashi 🤑</p>
        <p><strong>Documento:</strong> 69696969</p>
        <p><strong>Teléfono:</strong> 987654321</p>
        <p><strong>Correo:</strong> gonashi@gmail.com</p>
      </div>
    </div>
  </div>
  <div class="col-4">
    <div class="card">
      <div class="card-header bg-light"><strong>Datos del Hospedaje</strong></div>
      <div class="card-body">
        <p><strong>Fecha de Entrada:</strong> 18-02-2025 13:05:30</p>
        <p><strong>Fecha de Salida:</strong> 19-02-2025 12:05:30</p>
        <p><strong>Tiempo Estimado:</strong> 1 día 0 horas 0 minutos</p>
        <p><strong>Tiempo Rebasado:</strong> <span class="text-danger">0 días 4 horas 15 minutos</span></p>
      </div>
    </div>
  </div>
</div>

<!-- Sección de Proceso Salida -->
<div class="card mt-4">
  <div class="card-header" style="background: #0e2238;">
  </div>
  <div class="card-body">
    <h5>Costo de Alojamiento:</h5>
    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>Dinero Extra</th>
          <th>Costo Calculado</th>
          <th>Dinero Adelantado</th>
          <th>Mora/Penalidad</th>
          <th>Por Pagar</th>
          <th>Responsable</th>
        </tr>
        </thead>
        <tbody id="tablaProcesoSalida">
        <tr>
          <td>S/.0</td>
          <td>S/.0</td>
          <td>S/.0</td>
          <td><label>
            <input type="number" class="form-control" value="0">
          </label></td>
          <td>S/.0</td>
          <td>Felipe</td>
        </tr>
        </tbody>
      </table>
    </div>

    <hr>

    <h5>Servicio al Cuarto:</h5>
    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>Producto/Servicio</th>
          <th>Precio Unitario</th>
          <th>Cantidad</th>
          <th>Estado</th>
          <th>Sub Total</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody id="tablaServicioCuarto">
        <tr>
          <td>Agua</td>
          <td>S/.2</td>
          <td>2</td>
          <td class="text-danger">Falta Pagar</td>
          <td>S/.4</td>
          <td class="text-center">
            <button class="btn btn-danger"><i class="fas fa-trash"></i></button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>

    <p class="fw-bold">Total a Pagar: S/.30</p>

    <!-- Método de Pago en un Select-->
    <div class="form-group">
      <label for="metodoPago">Método de Pago:</label>
      <select class="form-control" id="metodoPago">
        <option value="efectivo">Efectivo</option>
        <option value="tarjeta">Tarjeta de Créditos</option>
        <option value="transferencia">Transferencia</option>
        <option value="yape">Yape</option>
        <option value="plin">Plin</option>
      </select>
    </div>

    <div class="d-flex justify-content-between mt-2">
      <div class="justify-content-start">
        <button class="btn btn-danger" onclick="cargarPagina('jsp/VerificacionSalidas.jsp')"> Regresar </button>
        <button class="btn btn-primary" onclick="cargarPagina('jsp/VerificacionSalidas.jsp')"> Realizar Limpieza Intermedia </button>
      </div>
      <button class="btn btn-success" onclick="cargarPagina('jsp/VerificacionSalidas.jsp')"> Culminar y Limpiar Habitación </button>
    </div>
  </div>
</div>

</body>