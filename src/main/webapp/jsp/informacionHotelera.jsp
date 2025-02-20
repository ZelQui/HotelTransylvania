<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Información del Hotel</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="d-flex justify-content-between align-items-center">
  <h4><i class="fa-solid fa-gears me-2"></i> Información del Hotel</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Configuración</a></li>
      <li class="breadcrumb-item active" aria-current="page">Información del Hotel</li>
    </ol>
  </nav>
</div>

<!-- Sección de Información del Hotel -->
<div class="card mt-4">
  <div class="card-header" style="background: #0e2238;">
  </div>
  <div class="card-body">
    <div class="d-flex justify-content-center align-content-center">
      <img src="${pageContext.request.contextPath}/img/hotelLogo.png" class="img-fluid" style="max-width: 50%; height: auto;" alt="Hotel Transylvania">
    </div>
    <form id="formHotel">
      <input type="hidden" id="editIndex">
      <div class="mb-3">
        <label for="nombreHotel">Nombre del Hotel</label>
        <input type="text" class="form-control" id="nombreHotel" required>
      </div>
      <div class="mb-3">
        <label for="telefonoHotel">Teléfono</label>
        <input type="tel" class="form-control" id="telefonoHotel" pattern="[0-9]{10}" maxlength="9"  required>
      </div>
      <div class="mb-3">
        <label for="correoHotel">Correo</label>
        <input type="email" class="form-control" id="correoHotel" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
      </div>
      <div class="mb-3">
        <label for="ubicacionHotel">Ubicación</label>
        <input type="text" class="form-control" id="ubicacionHotel" required>
      </div>
      <div class="mb-3">
        <label for="monedaHotel">Tipo de moneda: (S/, $, $US, €, £, ¥)</label>
        <input type="text" class="form-control" id="monedaHotel" required>
      </div>
      <button type="button" class="btn btn-success">Guardar</button>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>