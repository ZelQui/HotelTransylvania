<%@ page import="development.team.hoteltransylvania.Business.GestionEmployee" %>
<%@ page import="java.util.List" %>
<%@ page import="development.team.hoteltransylvania.DTO.usersEmployeeDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Catálogo de Usuarios</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="d-flex justify-content-between align-items-center">
  <h4><i class="fa-solid fa-users-gear me-2"></i> Usuarios</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
    </ol>
  </nav>
</div>

<%
  List<usersEmployeeDTO> allEmplooyes = GestionEmployee.getAllEmployees();
%>

<!-- Sección de usuarios -->
<div class="card mt-4">
  <div class="card-header">
    <div class="row align-items-center">
      <div class="col-9 d-flex gap-2">
        <p>Catálogo de Usuarios</p>
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
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarUsuario">
      <i class="fas fa-plus"></i> Agregar nuevo
    </button>
  </div>

  <!-- Modal para agregar usuario -->
  <div class="modal fade" id="modalAgregarUsuario" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="agregarUsuario">Agregar Usuario</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">

          <form id="formUsuario" action="user" method="post">
            <input type="hidden" id="inputAgregarUsuario">
            <input type="hidden" name="accion" value="Registrar">
            <div class="mb-3">
              <label for="nombre">Nombre</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Completo" required>
              </div>
            </div>
            <div class="mb-3">
              <label for="correo">Correo</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                <input type="email" class="form-control" id="correo" name="email" placeholder="Correo Electrónico" required>
              </div>
            </div>
            <div class="mb-3">
              <label for="rol">Rol</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
                <select class="form-select" id="rol" name="rol" required>
                  <option selected disabled>Seleccionar Rol</option>
                  <option value="1">Administrador</option>
                  <option value="2">Recepcionista</option>
                </select>
              </div>
            </div>
            <div class="mb-3">
              <label for="username">Usuario</label>
              <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" id="username" name="username" class="form-control" placeholder="Nombre Usuario" required>
              </div>
            </div>
            <div class="mb-3">
              <button type="submit" class="btn btn-success">
                Guardar
              </button>
            </div>
          </form>

        </div>
      </div>
    </div>
  </div>

  <!-- Modal para editar usuario -->
  <div class="modal fade" id="modalEditarUsuario" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editarUsuario">Editar Usuario</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formEditarUsuario" action="user" method="post">
            <input type="hidden" name="accion" value="update">
            <input type="hidden" name="idemployee" id="inputEditarUsuario">
            <div class="mb-3">
              <label for="nombreEditar">Nombre</label>
              <input type="text" class="form-control" id="nombreEditar" name="nombreEdit" required>
            </div>
            <div class="mb-3">
              <label for="correoEditar">Correo</label>
              <input type="email" class="form-control" id="correoEditar" name="correoEdit" required>
            </div>
            <div class="mb-3">
              <label for="usuarioEditar">Usuario</label>
              <input type="text" class="form-control" id="usuarioEditar" name="userEdit" required>
            </div>
            <div class="mb-3">
              <label for="rolEditar">Rol</label>
              <select class="form-select" id="rolEditar" name="rolEditar" required>
                <option value="1">Administrador</option>
                <option value="2">Recepcionista</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="estatusEditar">Estatus</label>
              <select class="form-select" id="estatusEditar" name="estatusEdit" required>
                <option value="Activo">Activo</option>
                <option value="Inactivo">Inactivo</option>
              </select>
            </div>
            <button type="submit" class="btn btn-success">Guardar</button>
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
        <input type="text" class="form-control" id="nameSearch" placeholder="Buscar">
        <span class="input-group-text"><i class="fas fa-search"></i></span>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>N°</th>
          <th>Nombre</th>
          <th>Usuario</th>
          <th>Correo</th>
          <th>Tipo</th>
          <th>Estatus</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody id="tablaUsuarios">
          <% int count = 1; // Definir count antes del bucle %>
          <%for(usersEmployeeDTO employee : allEmplooyes){ %>
          <tr>
            <td><%=count%></td>
            <td><%=employee.getName_employee()%></td>
            <td><%=employee.getName_user()%></td>
            <td><%=employee.getEmail_user()%></td>
            <td><%=employee.getTipo_user()%></td>
            <td><%=employee.getEstado_user()%></td>
            <td class="d-flex justify-content-center gap-1">
              <button class="btn btn-warning btn-sm" id="btn-editar"
                      data-bs-toggle="modal"
                      data-bs-target="#modalEditarUsuario"
                      onclick="editarUser(<%=employee.getId_employee()%>)">✏️</button>
              <form action="user" method="post">
                <input type="hidden" name="idUser" value="<%=employee.getId_user()%>">
                <input type="hidden" name="accion" value="restartPass">
                <button class="btn btn-secondary btn-sm">🔑</button>
              </form>
              <form action="user" method="post">
                <input type="hidden" name="idUser" value="<%=employee.getId_user()%>">
                <input type="hidden" name="accion" value="delete">
                <button class="btn btn-danger btn-sm">❌</button>
              </form>
            </td>
          </tr>
          <% count++;}%>

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
