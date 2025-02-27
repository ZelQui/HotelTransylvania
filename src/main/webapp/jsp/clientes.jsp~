<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clientes</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="d-flex justify-content-between align-items-center">
  <h4><i class="fa-solid fa-users me-2"></i> Clientes</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Clientes</li>
    </ol>
  </nav>
</div>

<!-- Sección de Clientes -->
<div class="card mt-4">
  <div class="card-header">
    <div class="row align-items-center">
      <div class="col-9 d-flex gap-2">
        <p>Catálogo de Clientes</p>
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

    <div class="d-flex justify-content-between mt-2">
      <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarCliente">
        <i class="fas fa-plus"></i> Agregar nuevo
      </button>
      <button class="btn btn-success">
        <i class="fa-solid fa-file-export"></i> Exportar
      </button>
    </div>
  </div>

  <!-- Modal para agregar Cliente -->
  <div class="modal fade" id="modalAgregarCliente" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="agregarCliente">Agregar Cliente</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formCliente">
            <input type="hidden" id="inputAgregarCliente">
            <div class="mb-3">
              <label for="nombre">Nombre Completo</label>
              <input type="text" class="form-control" id="nombre" required>
            </div>
            <div class="mb-3">
              <label for="tipoDocumento">Tipo de Documento</label>
              <select class="form-select" id="tipoDocumento" required>
                <option value="#">DNI</option>
                <option value="#">PASAPORTE</option>
                <option value="#">RUC</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="documento">Documento</label>
              <input type="text" class="form-control" id="documento" required>
            </div>
            <div class="mb-3">
              <label for="correo">Correo</label>
              <input type="email" class="form-control" id="correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            </div>
            <div class="mb-3">
              <label for="telefono">Teléfono</label>
              <input type="tel" class="form-control" id="telefono" pattern="[0-9]{10}" maxlength="9"  required>
            </div>
            <div class="mb-3">
              <label for="nitNombre">NIT y Nombre</label>
              <input type="text" class="form-control" id="nitNombre" required>
            </div>
            <div class="mb-3">
              <label for="alta">Alta</label>
              <input type="date" class="form-control" id="alta" required>
            </div>
            <button type="button" class="btn btn-success">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para editar Cliente -->
  <div class="modal fade" id="modalEditarCliente" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editarCliente">Editar Cliente</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formEditarCliente">
            <input type="hidden" id="inputEditarCliente">
            <div class="mb-3">
              <label for="nombreEditar">Nombre Completo</label>
              <input type="text" class="form-control" id="nombreEditar" required>
            </div>
            <div class="mb-3">
              <label for="tipoDocumentoEditar">Tipo de Documento</label>
              <select class="form-select" id="tipoDocumentoEditar" required>
                <option value="DNI">DNI</option>
                <option value="RUC">PASAPORTE</option>
                <option value="RUC">RUC</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="documentoEditar">Documento</label>
              <input type="text" class="form-control" id="documentoEditar" required>
            </div>
            <div class="mb-3">
              <label for="correoEditar">Correo</label>
              <input type="email" class="form-control" id="correoEditar" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            </div>
            <div class="mb-3">
              <label for="telefonoEditar">Teléfono</label>
              <input type="tel" class="form-control" id="telefonoEditar" pattern="[0-9]{10}" maxlength="9"  required>
            </div>
            <div class="mb-3">
              <label for="nitNombreEditar">NIT y Nombre</label>
              <input type="text" class="form-control" id="nitNombreEditar" required>
            </div>
            <div class="mb-3">
              <label for="altaEditar">Alta</label>
              <input type="date" class="form-control" id="altaEditar" required>
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
        <input type="number" min="1" max="999" value="1" class="form-control d-inline-block" style="width: 3rem;">registros
      </span>
      <div class="input-group" style="max-width: 250px;">
        <input type="text" class="form-control" placeholder="Buscar">
        <button class="btn btn-primary"><i class="fas fa-search"></i></button>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>N°</th>
          <th>Nombre Completo</th>
          <th>Tipo de Documento</th>
          <th>Documento</th>
          <th>Correo</th>
          <th>Teléfono</th>
          <th>NIT y Nombre</th>
          <th>Alta</th>
          <th>Estatus</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody id="tablaClientes">
        <tr>
          <td>1</td>
          <td>Gonashi</td>
          <td>DNI</td>
          <td>69696969</td>
          <td>Gonashi@gmail.com</td>
          <td>969696969</td>
          <td>No sé que es eso</td>
          <td>15-05-2025</td>
          <td>Activo</td>
          <td class="d-flex justify-content-center gap-1">
            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modalEditarCliente">✏️</button>
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