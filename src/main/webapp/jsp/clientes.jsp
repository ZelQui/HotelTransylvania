<%@ page import="development.team.hoteltransylvania.Model.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="development.team.hoteltransylvania.Business.GestionClient" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clientes</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="/js/script.js"></script>
</head>

<%
  List<Client> listClients = GestionClient.getAllClients();
%>


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
    </div>

    <div class="d-flex justify-content-between mt-2">
      <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarCliente">
        <i class="fas fa-plus"></i> Agregar nuevo
      </button>
      <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exportModal">
        <i class="fa-solid fa-file-export"></i> Exportar
      </button>
    </div>
  </div>

  <!-- Modal para el boton de exportar -->
  <div class="modal fade" id="exportModal" tabindex="-1" aria-labelledby="exportModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exportModalLabel">Exportar Datos</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <!-- Tabla con los datos -->
          <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
            <table class="table table-bordered">
              <thead class="table-warning sticky-top">
              <tr>
                <th>N°</th>
                <th>Nombre Completo</th>
                <th>Tipo de Documento</th>
                <th>Documento</th>
                <th>Correo</th>
                <th>Teléfono</th>
              </tr>
              </thead>
              <tbody id="tableData">
              <!-- Los datos de la tabla irán aquí dinámicamente -->
              <tr>
                <td>1</td>
                <td>Juan Pérez</td>
                <td>DNI</td>
                <td>12345678</td>
                <td>juanperez@example.com</td>
                <td>999999999</td>
              </tr>
              <tr>
                <td>2</td>
                <td>María Gómez</td>
                <td>Pasaporte</td>
                <td>98765432</td>
                <td>mariagomez@example.com</td>
                <td>988888888</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Juan Pérez</td>
                <td>DNI</td>
                <td>12345678</td>
                <td>juanperez@example.com</td>
                <td>999999999</td>
              </tr>
              <tr>
                <td>2</td>
                <td>María Gómez</td>
                <td>Pasaporte</td>
                <td>98765432</td>
                <td>mariagomez@example.com</td>
                <td>988888888</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Juan Pérez</td>
                <td>DNI</td>
                <td>12345678</td>
                <td>juanperez@example.com</td>
                <td>999999999</td>
              </tr>
              <tr>
                <td>2</td>
                <td>María Gómez</td>
                <td>Pasaporte</td>
                <td>98765432</td>
                <td>mariagomez@example.com</td>
                <td>988888888</td>
              </tr>
              <tr>
                <td>1</td>
                <td>Juan Pérez</td>
                <td>DNI</td>
                <td>12345678</td>
                <td>juanperez@example.com</td>
                <td>999999999</td>
              </tr>
              <tr>
                <td>2</td>
                <td>María Gómez</td>
                <td>Pasaporte</td>
                <td>98765432</td>
                <td>mariagomez@example.com</td>
                <td>988888888</td>
              </tr>
              <!-- Agregar más filas según los datos -->
              </tbody>
            </table>
          </div>

          <!-- Opciones de descarga -->
          <div class="mt-3">
            <!-- Descargar los últimos -->
            <div class="form-check d-flex align-items-center">
              <input class="form-check-input" type="radio" name="downloadOption" id="downloadLast" value="last" onclick="toggleRadioInput()">
              <label class="form-check-label ms-2 me-3" for="downloadLast">
                Descargar los últimos
              </label>
              <input type="number" id="numLast" class="form-control" placeholder="Cantidad" style="width: 100px;" disabled>
            </div>
            <!-- Descargar todos -->
            <div class="form-check d-flex align-items-center mt-2">
              <input class="form-check-input" type="radio" name="downloadOption" id="downloadAll" value="all" onclick="toggleRadioInput()">
              <label class="form-check-label ms-2" for="downloadAll">
                Descargar todos
              </label>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" id="exportButton">Exportar/Descargar</button>
        </div>
      </div>
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
          <form id="formAgregarCliente" method="post" action="clientcontrol">
            <input type="hidden" id="inputAgregarCliente">
            <input type="hidden" value="add" name="actionclient">
            <div class="mb-3">
              <label for="nombre">Nombre Completo</label>
              <input type="text" class="form-control" id="nombre" name="clientname" required>
            </div>
            <div class="mb-3">
              <label for="tipoDocumento">Tipo de Documento</label>
              <select class="form-select" id="tipoDocumento" name="typedocument" required>
                <option value="DNI">DNI</option>
                <option value="Pasaporte">PASAPORTE</option>
                <option value="RUC">RUC</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="documento">Documento</label>
              <input type="text" class="form-control" id="documento" name="document" required>
            </div>
            <div class="mb-3">
              <label for="correo">Correo</label>
              <input type="email" class="form-control" id="correo" name="clientemail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            </div>
            <div class="mb-3">
              <label for="telefono">Teléfono</label>
              <input type="tel" class="form-control" id="telefono" name="telephone" pattern="[0-9]{9}" maxlength="9"  required>
            </div>
            <button type="submit" class="btn btn-success">Guardar</button>
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
          <form id="formEditarCliente" action="clientcontrol" method="post">
            <input type="hidden" name="actionclient" value="update">
            <input type="hidden" name="idclient" id="inputEditarCliente">
            <div class="mb-3">
              <label for="nombreEditar">Nombre Completo</label>
              <input type="text" class="form-control" id="nombreEditar" name="nombreEditar" required>
            </div>
            <div class="mb-3">
              <label for="tipoDocumentoEditar">Tipo de Documento</label>
              <select class="form-select" id="tipoDocumentoEditar" name="tipoDocumentoEditar" required>
                <option value="DNI">DNI</option>
                <option value="Pasaporte">PASAPORTE</option>
                <option value="RUC">RUC</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="documentoEditar">Documento</label>
              <input type="text" class="form-control" id="documentoEditar" name="documentoEditar" required>
            </div>
            <div class="mb-3">
              <label for="correoEditar">Correo</label>
              <input type="email" class="form-control" id="correoEditar" name="correoEditar" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            </div>
            <div class="mb-3">
              <label for="telefonoEditar">Teléfono</label>
              <input type="tel" class="form-control" id="telefonoEditar" name="telefonoEditar" pattern="[0-9]{9}" maxlength="9"  required>
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
        <input type="number" id="sizeClients" min="1" max="999" value="<%=listClients.size()%>" class="form-control d-inline-block" style="width: 3rem;">registros
      </span>
      <div class="input-group" style="max-width: 250px;">
        <input type="text" class="form-control" id="nameClientSearch" placeholder="Buscar"
               onkeyup="Search('#nameClientSearch','#tablaClients','#sizeClients','filterClientServlet')">
        <span class="input-group-text"><i class="fas fa-search"></i></span>
      </div>
    </div>

    <div class="table-responsive">
      <table id="tablaClients" class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>N°</th>
          <th>Nombre Completo</th>
          <th>Tipo de Documento</th>
          <th>Documento</th>
          <th>Correo</th>
          <th>Teléfono</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%int count=1; for(Client client : listClients){%>
          <tr>
            <td><%=count%></td>
            <td><%=client.getName()%></td>
            <td><%=client.getTypeDocument()%></td>
            <td><%=client.getNumberDocument()%></td>
            <td><%=client.getEmail()%></td>
            <td><%=client.getTelephone()%></td>
            <td class="d-flex justify-content-center gap-1">
              <button class="btn btn-warning btn-sm" id="btn-editar"
                      data-bs-toggle="modal"
                      data-bs-target="#modalEditarCliente"
                      onclick="editarClient(<%=client.getId()%>)">
                ✏️
              </button>
              <form action="clientcontrol" method="post">
                <input type="hidden" name="idClient" value="<%=client.getId()%>">
                <input type="hidden" name="actionclient" value="delete">
                <button class="btn btn-danger btn-sm">❌</button>
              </form>
            </td>
          </tr>
        <%count++;}%>
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