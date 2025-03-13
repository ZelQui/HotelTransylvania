<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Procesar Habitación</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
  <h4><i class="fa-solid fa-bed me-2"></i> Procesar Habitación</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item"><a href="#" onclick="cargarPagina('jsp/recepcion.jsp')">Recepción</a></li>
      <li class="breadcrumb-item active" aria-current="page">Procesar Habitación</li>
    </ol>
  </nav>
</div>

<!-- Sección de datos -->
<div class="row mt-4">
  <div class="col-lg-12 col-md-12 col-sm-12">
    <div class="card">
      <div class="card-header bg-light"><strong>Datos de la Habitación</strong></div>
      <div class="card-body">
        <div class="row">
          <div class="col-md-6"><p><strong>Nombre:</strong> 696</p></div>
          <div class="col-md-6"><p><strong>Tarifa:</strong> 24hr</p></div>
          <div class="col-md-6"><p><strong>Tipo:</strong> PRESIDENCIAL</p></div>
          <div class="col-md-6"><p><strong>Detalles:</strong> Habitación de lujo</p></div>
          <div class="col-md-6"><p><strong>Costo:</strong> S/.696</p></div>
          <div class="col-md-6"><p><strong>Estado:</strong> Disponible</p></div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row mt-4">
  <div class="col-lg-6 col-md-6 col-sm-12">
    <div class="card">
      <div class="card-header bg-light"><strong>Datos del Cliente</strong></div>
      <div class="card-body">

      </div>
    </div>
  </div>
  <div class="col-lg-6 col-md-6 col-sm-12 mt-4 mt-md-0">
    <div class="card">
      <div class="card-header bg-light"><strong>Datos del Alojamiento</strong></div>
      <div class="card-body">

      </div>
    </div>
  </div>
</div>

</body>
</html>