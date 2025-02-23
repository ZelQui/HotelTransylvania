<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <title>Catálogo de Productos</title>
</head>

<body>
<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
  <h4><i class="fa-solid fa-basket-shopping me-2"></i> Catálogo de Productos</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item"><a href="#" onclick="cargarPagina('jsp/habitaciones.jsp')">Habitaciones</a></li>
      <li class="breadcrumb-item active" aria-current="page">Catálogo de Productos</li>
    </ol>
  </nav>
</div>

<!-- Sección de Catálogo de Productos -->
<div class="card mt-4">
  <div class="card-header">
    <div class="row align-items-center">
      <div class="col-lg-9 col-md-9 col-sm-12 d-flex gap-2 text-white">
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarCatalogoProducto">
          <i class="fas fa-plus"></i> Agregar Producto
        </button>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-12 d-flex justify-content-end align-items-center text-white">
        <label for="estadoSelect" class="form-label m-0 me-2">Estado:</label>
        <select id="estadoSelect" class="form-select w-auto">
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
  </div>

  <!-- Modal para agregar Catálogo de Producto -->
  <div class="modal fade" id="modalAgregarCatalogoProducto" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="agregarCatalagoProducto">Agregar Catálogo de Producto</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formCatalogoProducto">
            <input type="hidden" id="inputAgregarCatalagoProducto">
            <div class="mb-3">
              <label for="tipo">Tipo</label>
              <select class="form-select" id="tipo" required>
                <option value="#">Producto</option>
                <option value="#">Servicio</option>
                <option value="#">Otro</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" required>
            </div>
            <div class="mb-3">
              <label for="marca">Marca</label>
              <input type="text" class="form-control" id="marca" required>
            </div>
            <div class="mb-3">
              <label for="detalle">Detalle</label>
              <input type="text" class="form-control" id="detalle" required>
            </div>
            <div class="mb-3">
              <label for="stock">Stock</label>
              <input type="number" class="form-control" id="stock" min="0" required>
            </div>
            <div class="mb-3">
              <label for="proveedor">Proveedor</label>
              <input type="text" class="form-control" id="proveedor" required>
            </div>
            <div class="mb-3">
              <label for="precioCompra">Precio Compra</label>
              <input type="number" class="form-control" id="precioCompra" min="0" required>
            </div>
            <div class="mb-3">
              <label for="precioVenta">Precio Venta</label>
              <input type="number" class="form-control" id="precioVenta" min="0" required>
            </div>
            <button type="button" class="btn btn-success">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para editar Cliente -->
  <div class="modal fade" id="modalEditarCatalogoProducto" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editarCatalagoProducto">Editar Catálogo de Producto</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formEditarCatalogoProducto">
            <input type="hidden" id="inputEditarCatalagoProducto">
            <div class="mb-3">
              <label for="tipoEditar">Tipo</label>
              <select class="form-select" id="tipoEditar" required>
                <option value="#">Producto</option>
                <option value="#">Servicio</option>
                <option value="#">Otro</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="nombreEditar">Nombre</label>
              <input type="text" class="form-control" id="nombreEditar" required>
            </div>
            <div class="mb-3">
              <label for="marcaEditar">Marca</label>
              <input type="text" class="form-control" id="marcaEditar" required>
            </div>
            <div class="mb-3">
              <label for="detalleEditar">Detalle</label>
              <input type="text" class="form-control" id="detalleEditar" required>
            </div>
            <div class="mb-3">
              <label for="stockEditar">Stock</label>
              <input type="number" class="form-control" id="stockEditar" min="0" required>
            </div>
            <div class="mb-3">
              <label for="proveedorEditar">Proveedor</label>
              <input type="text" class="form-control" id="proveedorEditar" required>
            </div>
            <div class="mb-3">
              <label for="precioCompraEditar">Precio Compra</label>
              <input type="number" class="form-control" id="precioCompraEditar" min="0" required>
            </div>
            <div class="mb-3">
              <label for="precioVentaEditar">Precio Venta</label>
              <input type="number" class="form-control" id="precioVentaEditar" min="0" required>
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

  <div class="card-body mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <span class="d-none d-md-inline">Mostrando
        <input type="number" min="1" max="999" value="1" class="form-control d-inline-block" style="width: 4rem;"> registros
      </span>
      <div class="input-group ms-auto" style="max-width: 250px;">
        <input type="text" class="form-control" placeholder="Buscar">
        <button class="btn btn-primary"><i class="fas fa-search"></i></button>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle">
        <thead class="table-warning">
        <tr>
          <th>N°</th>
          <th>Tipo</th>
          <th>Nombre</th>
          <th>Marca</th>
          <th>Detalle</th>
          <th>Stock</th>
          <th>Proveedor</th>
          <th>Precio Compra</th>
          <th>Precio Venta</th>
          <th>Estatus</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody id="tablaCatalagoProductos">
        <tr>
          <td>1</td>
          <td>Producto</td>
          <td>Gaseosa</td>
          <td>Inca Kola</td>
          <td>Gaseosa de 3L.</td>
          <td>15</td>
          <td>Inca Kola</td>
          <td>S/.4</td>
          <td>S/.6</td>
          <td>Activo</td>
          <td class="align-middle text-center">
            <div class="d-flex justify-content-center align-items-center gap-1">
              <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modalEditarCatalogoProducto">✏️</button>
              <button class="btn btn-danger btn-sm">❌</button>
            </div>
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

</body>