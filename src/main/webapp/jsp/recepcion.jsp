<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recepción</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>
<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
  <h4><i class="fas fa-sign-in-alt"></i> Recepción</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Recepción</li>
    </ol>
  </nav>
</div>

<!-- Pestañas -->
<ul class="nav nav-tabs flex-column flex-md-row mt-4">
  <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#todos">Todos</button></li>
  <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#primer-nivel">Primer Nivel</button></li>
  <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#segundo-nivel">Segundo Nivel</button></li>
  <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#tercer-nivel">Tercer Nivel</button></li>
</ul>

<!-- Contenido de pestañas -->
<div class="tab-content mt-3">
  <div id="todos" class="tab-pane fade show active">
    <div class="row">
      <div class="col-md-3">
        <button class="room-card available" onclick="handleClick(101)">
          <h5>101</h5>
          <span>SENCILLA</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Disponible</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <div class="col-md-3">
        <button class="room-card occupied" onclick="handleClick(105)">
          <h5>105</h5>
          <span>TRIPLE</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Ocupada</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <div class="col-md-3">
        <button class="room-card available" onclick="handleClick(203)">
          <h5>203</h5>
          <span>SENCILLA</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Disponible</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <div class="col-md-3">
        <button class="room-card cleaning" onclick="handleClick(207)">
          <h5>207</h5>
          <span>DOBLE</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Limpieza</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
    </div>
  </div>
  <div id="primer-nivel" class="tab-pane fade show">
    <div class="row">
      <div class="col-md-3">
        <button class="room-card available" onclick="handleClick(101)">
          <h5>101</h5>
          <span>SENCILLA</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Disponible</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <div class="col-md-3">
        <button class="room-card occupied" onclick="handleClick(105)">
          <h5>105</h5>
          <span>TRIPLE</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Ocupada</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
      <div class="col-md-3">
        <button class="room-card available" onclick="handleClick(203)">
          <h5>203</h5>
          <span>SENCILLA</span>
          <i class="fas fa-bed room-icon"></i>
          <div class="room-status">
            <span>Disponible</span>
            <i class="fas fa-arrow-right"></i>
          </div>
        </button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  function handleClick(roomNumber) {
    alert("Has seleccionado la habitación " + roomNumber);
  }
</script>
</body>
</html>