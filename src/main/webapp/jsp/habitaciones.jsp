<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Catálogo de Habitaciones</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="d-flex justify-content-between align-items-center">
  <h4><i class="fa-solid fa-gears me-2"></i> Habitaciones</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Configuración</a></li>
      <li class="breadcrumb-item active" aria-current="page">Habitaciones</li>
    </ol>
  </nav>
</div>

<!-- Sección de habitaciones -->
<div class="card mt-4">
  <div class="card-header">
    <div class="row align-items-center">
      <div class="col-9 d-flex gap-2">
        <p>Catálogo de Habitaciones</p>
      </div>
      <div class="col-3 d-flex justify-content-end align-items-center">
        <label for="estadoSelect" class="form-label m-0 me-2">Estado:</label>
        <select id="estadoSelect" class="form-select  w-auto">
          <option value="activos">Activos</option>
          <option value="inactivos">Inactivos</option>
        </select>
        <script>
          document.getElementById("estadoSelect").addEventListener("change", function() {
            console.log("Estado seleccionado:", this.value);
          });
        </script>
      </div>
    </div>

    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarHabitación">
      <i class="fas fa-plus"></i> Agregar nueva
    </button>
  </div>

  <!-- Modal para agregar habitación -->
  <div class="modal fade" id="modalAgregarHabitación" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="agregarHabitacion">Agregar Habitación</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formHabitacion">
            <input type="hidden" id="inputAgregarHabitacion">
            <div class="mb-3">
              <label for="nombre">Nombre/Número de Habitación</label>
              <input type="text" class="form-control" id="nombre" required>
            </div>
            <div class="mb-3">
              <label for="piso">Nivel/Piso</label>
              <select class="form-select" id="piso" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="categoria">Categoría</label>
              <select class="form-select" id="categoria" required>
                <option value="#">Categoría 1</option>
                <option value="#">Categoría 2</option>
                <option value="#">Categoría 3</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="precio">Precio</label>
              <input type="number" class="form-control" id="precio" required>
            </div>
            <div class="mb-3">
              <label for="tarifa">Tarifa</label>
              <select class="form-select" id="tarifa" required>
                <option value="#">24 hr.</option>
                <option value="#">12 hr.</option>
                <option value="#">XX hr.</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="detalle" class="form-label">Detalle</label>
              <textarea class="form-control" id="detalle" rows="4" required></textarea>
            </div>
            <button type="button" class="btn btn-success">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para editar habitación -->
  <div class="modal fade" id="modalEditarHabitacion" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editarHabitacion">Editar Habitación</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formEditarHabitacion">
            <input type="hidden" id="inputEditarHabitacion">
            <div class="mb-3">
              <label for="nombreEditar">Nombre/Número de Habitación</label>
              <input type="text" class="form-control" id="nombreEditar">
            </div>
            <div class="mb-3">
              <label for="pisoEditar">Nivel/Piso</label>
              <select class="form-select" id="pisoEditar" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="categoriaEditar">Categoría</label>
              <select class="form-select" id="categoriaEditar" required>
                <option value="#">Categoría 1</option>
                <option value="#">Categoría 2</option>
                <option value="#">Categoría 3</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="precioEditar">Precio</label>
              <input type="number" class="form-control" id="precioEditar" required>
            </div>
            <div class="mb-3">
              <label for="tarifaEditar">Tarifa</label>
              <select class="form-select" id="tarifaEditar" required>
                <option value="23">24 hr.</option>
                <option value="12">12 hr.</option>
                <option value="XX">XX hr.</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="detalleEditar">Detalle</label>
              <textarea class="form-control" id="detalleEditar" rows="4" required></textarea>
            </div>
            <div class="mb-3">
              <label for="estatusEditar">Estatus</label>
              <select class="form-select" id="estatusEditar">
                <option value="Activo">Activo</option>
                <option value="Inactivo">Inactivo</option>
              </select>
            </div>
            <button type="button" class="btn btn-success">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="card-body">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <span>Mostrando
        <input type="number" min="1" max="999" value="1" class="form-control d-inline-block" style="width: 3rem;"> registros
      </span>

      <div class="input-group" style="max-width: 250px;">
        <input type="text" class="form-control" id="nameSearch" placeholder="Buscar">
        <span class="input-group-text"><i class="fas fa-search"></i></span>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>Nombre / Número de Habitación</th>
          <th>Nivel / Piso</th>
          <th>Categoría</th>
          <th>Precio</th>
          <th>Tarifa</th>
          <th>Detalle</th>
          <th>Estatus</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody id="tablaHabitaciones">
        <tr>
          <td>100</td>
          <td>1</td>
          <td>Simple</td>
          <td>S/.696</td>
          <td>24 hr.</td>
          <td>Bien cómodo todo</td>
          <td>Activo</td>
          <td class="d-flex justify-content-center gap-1">
            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modalEditarHabitacion">✏️</button>
            <button class="btn btn-danger btn-sm">❌</button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="d-flex justify-content-end align-items-center">
      <nav aria-label="Page navigation example">
        <ul class="pagination mb-0">
          <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
        </ul>
      </nav>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>