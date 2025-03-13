<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
  <h4><i class="fa-solid fa-calendar-days me-2"></i> Reserva</h4>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Reserva</li>
    </ol>
  </nav>
</div>

<div class="d-flex justify-content-center gap-1">
  <div class="square bg-primary" title="Nueva Reservación"></div>
  <div class="square bg-success" title="Reservación Confirmada"></div>
  <div class="square" style="background-color: orange;" title="Reservación Ocupada"></div>
  <div class="square bg-dark" title="Reservación Cancelada"></div>
  <div class="square bg-warning" title="Reservación Culminada"></div>
</div>

<!-- Sección de Reserva -->
<div class="card mt-4">
  <div class="card-header">
    <div class="d-flex justify-content-start">
      <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAgregarReserva">
        <i class="fas fa-plus"></i> Agregar Reserva
      </button>
    </div>
  </div>

  <!-- Modal para agregar Reserva -->
  <div class="modal fade" id="modalAgregarReserva" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="agregarReserva">Agregar Reserva</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form id="formReserva">
            <input type="hidden" id="inputAgregarReserva">
            <div class="row">
              <!-- Datos del Cliente -->
              <div class="col-md-4 border-end">
                <h5>Datos del Cliente</h5>
                <input type="text" class="form-control mb-3" id="numberDocument" placeholder="Buscar por Documento"
                       onkeyup="buscarCliente()">
                <div id="datosCliente">
                  <p style='color:red;' class='mt-2'>⚠️ Debes ingresar un número de documento</p>
                  <div class="mb-3">
                    <label for="nombre">Nombre Completo</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                  </div>
                  <div class="mb-3">
                    <label for="tipoDocumento">Tipo de Documento</label>
                    <select class="form-select" id="tipoDocumento" name="tipoDocumento" required>
                      <option value="#">DNI</option>
                      <option value="#">PASAPORTE</option>
                      <option value="#">RUC</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="documento">Documento</label>
                    <input type="text" class="form-control" id="documento" name="documento" required>
                  </div>
                  <div class="mb-3">
                    <label for="correo">Correo</label>
                    <input type="email" class="form-control" id="correo" name="correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                  </div>
                </div>
              </div>

              <!-- Datos del Alojamiento -->
              <div class="col-md-4 border-end">
                <h5>Datos del Alojamiento</h5>
                <div class="mb-3">
                  <label for="tipoHabitacion">Tipo de Habitación</label>
                  <select class="form-select" id="tipoHabitacion" required>
                    <option value="#">Simple</option>
                    <option value="#">Doble</option>
                    <option value="#">Matrimonial</option>
                    <option value="#">Suite</option>
                    <option value="#">Presidencial</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="habitacion">Habitación</label>
                  <select class="form-select" id="habitacion" required>
                    <option value="#">696</option>
                    <option value="#">600</option>
                    <option value="#">100</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="fechaEntrada">Fecha y Hora de Entrada</label>
                  <input type="date" class="form-control" id="fechaEntrada" required>
                </div>
                <div class="mb-3">
                  <label for="fechaSalida">Fecha y Hora de Salida</label>
                  <input type="date" class="form-control" id="fechaSalida" required>
                </div>
              </div>

              <!-- Costo -->
              <div class="col-md-4">
                <h5>Costo</h5>
                <div class="mb-3">
                  <label for="descuento">Descuento</label>
                  <select class="form-select" id="descuento">
                    <option value="#">0%</option>
                    <option value="#">5%</option>
                    <option value="#">10%</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="cobroExtra">Cobro extra</label>
                  <input type="number" class="form-control" id="cobroExtra">
                </div>
                <div class="mb-3">
                  <label for="adelanto">Adelanto</label>
                  <input type="number" class="form-control" id="adelanto">
                </div>
                <div class="mb-3">
                  <label for="totalPagar">Total a Pagar</label>
                  <input type="number" class="form-control" id="totalPagar" required>
                </div>
                <div class="mb-3">
                  <label for="observacion">Observaciones</label>
                  <textarea id="observacion" class="form-control" rows="4"></textarea>
                </div>
              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-success">Guardar</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

</div>

<!-- Modal para ver Detalle -->
<div class="modal fade" id="modalVerDetalle" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel">Detalles de la Reserva</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <!-- Datos del Cliente -->
          <div class="col-md-4 border-end">
            <h5>Datos del Cliente</h5>
            <div class="mb-3">
              <label for="nombreDetalle">Nombre Completo</label>
              <input type="text" class="form-control" id="nombreDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="tipoDocumentoDetalle">Tipo de Documento</label>
              <select class="form-select" id="tipoDocumentoDetalle" disabled>
                <option value="DNI">DNI</option>
                <option value="PASAPORTE">PASAPORTE</option>
                <option value="RUC">RUC</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="documentoDetalle">Documento</label>
              <input type="text" class="form-control" id="documentoDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="nitDetalle">NIT</label>
              <input type="text" class="form-control" id="nitDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="facturarDetalle">Nombre a Facturar</label>
              <input type="text" class="form-control" id="facturarDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="correoDetalle">Correo</label>
              <input type="email" class="form-control" id="correoDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="telefonoDetalle">Teléfono</label>
              <input type="tel" class="form-control" id="telefonoDetalle" readonly>
            </div>
          </div>

          <!-- Datos del Alojamiento -->
          <div class="col-md-4 border-end">
            <h5>Datos del Alojamiento</h5>
            <div class="mb-3">
              <label for="tipoHabitacionDetalle">Tipo de Habitación</label>
              <select class="form-select" id="tipoHabitacionDetalle" disabled>
                <option value="Simple">Simple</option>
                <option value="Doble">Doble</option>
                <option value="Presidencial">Presidencial</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="habitacionDetalle">Habitación</label>
              <select class="form-select" id="habitacionDetalle" disabled>
                <option value="696">696</option>
                <option value="600">600</option>
                <option value="100">100</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="fechaEntradaDetalle">Fecha y Hora de Entrada</label>
              <input type="date" class="form-control" id="fechaEntradaDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="fechaSalidaDetalle">Fecha y Hora de Salida</label>
              <input type="date" class="form-control" id="fechaSalidaDetalle" readonly>
            </div>
          </div>

          <!-- Costo -->
          <div class="col-md-4">
            <h5>Costo</h5>
            <div class="mb-3">
              <label for="descuentoDetalle">Descuento</label>
              <select class="form-select" id="descuentoDetalle" disabled>
                <option value="0%">0%</option>
                <option value="5%">5%</option>
                <option value="10%">10%</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="cobroExtraDetalle">Cobro extra</label>
              <input type="number" class="form-control" id="cobroExtraDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="adelantoDetalle">Adelanto</label>
              <input type="number" class="form-control" id="adelantoDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="totalPagarDetalle">Total a Pagar</label>
              <input type="number" class="form-control" id="totalPagarDetalle" readonly>
            </div>
            <div class="mb-3">
              <label for="observacionDetalle">Observaciones</label>
              <textarea id="observacionDetalle" class="form-control" rows="4" readonly></textarea>
            </div>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal para editar Reserva -->
<div class="modal fade" id="modalEditarReserva" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="EditarReserva">Editar Reserva</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <form id="formEditarReserva">
          <input type="hidden" id="editIndex">

          <div class="row">
            <!-- Datos del Cliente -->
            <div class="col-md-4 border-end">
              <h5>Datos del Cliente</h5>
              <div class="mb-3">
                <label for="nombreEditar" class="form-label">Nombre Completo</label>
                <input type="text" class="form-control" id="nombreEditar" required>
              </div>
              <div class="mb-3">
                <label for="tipoDocumentoEditar" class="form-label">Tipo de Documento</label>
                <select class="form-select" id="tipoDocumentoEditar" required>
                  <option value="DNI">DNI</option>
                  <option value="PASAPORTE">PASAPORTE</option>
                  <option value="RUC">RUC</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="documentoEditar" class="form-label">Documento</label>
                <input type="text" class="form-control" id="documentoEditar" required>
              </div>
              <div class="mb-3">
                <label for="nitEditar" class="form-label">NIT</label>
                <input type="text" class="form-control" id="nitEditar" required>
              </div>
              <div class="mb-3">
                <label for="facturarEditar" class="form-label">Nombre a Facturar</label>
                <input type="text" class="form-control" id="facturarEditar" required>
              </div>
              <div class="mb-3">
                <label for="correoEditar" class="form-label">Correo</label>
                <input type="email" class="form-control" id="correoEditar" required>
              </div>
              <div class="mb-3">
                <label for="telefonoEditar" class="form-label">Teléfono</label>
                <input type="tel" class="form-control" id="telefonoEditar" maxlength="9" required>
              </div>
            </div>

            <!-- Datos del Alojamiento -->
            <div class="col-md-4 border-end">
              <h5>Datos del Alojamiento</h5>
              <div class="mb-3">
                <label for="tipoHabitacionEditar" class="form-label">Tipo de Habitación</label>
                <select class="form-select" id="tipoHabitacionEditar" required>
                  <option value="Simple">Simple</option>
                  <option value="Doble">Doble</option>
                  <option value="Presidencial">Presidencial</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="habitacionEditar" class="form-label">Habitación</label>
                <select class="form-select" id="habitacionEditar" required>
                  <option value="696">696</option>
                  <option value="600">600</option>
                  <option value="100">100</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="fechaEntradaEditar" class="form-label">Fecha y Hora de Entrada</label>
                <input type="date" class="form-control" id="fechaEntradaEditar" required>
              </div>
              <div class="mb-3">
                <label for="fechaSalidaEditar" class="form-label">Fecha y Hora de Salida</label>
                <input type="date" class="form-control" id="fechaSalidaEditar" required>
              </div>
            </div>

            <!-- Costo -->
            <div class="col-md-4">
              <h5>Costo</h5>
              <div class="mb-3">
                <label for="descuentoEditar" class="form-label">Descuento</label>
                <select class="form-select" id="descuentoEditar">
                  <option value="0%">0%</option>
                  <option value="5%">5%</option>
                  <option value="10%">10%</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="cobroExtraEditar" class="form-label">Cobro extra</label>
                <input type="number" class="form-control" id="cobroExtraEditar">
              </div>
              <div class="mb-3">
                <label for="adelantoEditar" class="form-label">Adelanto</label>
                <input type="number" class="form-control" id="adelantoEditar">
              </div>
              <div class="mb-3">
                <label for="totalPagarEditar" class="form-label">Total a Pagar</label>
                <input type="number" class="form-control" id="totalPagarEditar" required>
              </div>
              <div class="mb-3">
                <label for="observacionEditar" class="form-label">Observaciones</label>
                <textarea class="form-control" id="observacionEditar" rows="4"></textarea>
              </div>
            </div>
          </div>

          <hr>

          <!-- Botón Guardar alineado a la izquierda -->
          <div class="d-flex justify-content-start">
            <button type="button" class="btn btn-success">Guardar</button>
          </div>

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
      <input type="text" class="form-control" id="nameSearch" placeholder="Buscar">
      <span class="input-group-text"><i class="fas fa-search"></i></span>
    </div>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered align-middle">
      <thead class="table-warning">
      <tr>
        <th>N°</th>
        <th>Cliente</th>
        <th>Habitación</th>
        <th>Tipo de Habitación</th>
        <th>Fecha de Entrada</th>
        <th>Fecha de Salida</th>
        <th>Estado</th>
        <th>Acciones</th>
      </tr>
      </thead>
      <tbody id="tablaReserva">
      <tr>
        <td>1</td>
        <td>Gonashi</td>
        <td>696</td>
        <td>Presidencial</td>
        <td>15-05-25 13:33</td>
        <td>16-05-25 12:05</td>
        <td class="text-primary">Nueva Reservación</td>
        <td class="align-middle text-center">
          <div class="d-flex justify-content-center align-items-center gap-1">
            <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#modalVerDetalle">👁️</button>
            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modalEditarReserva">✏️</button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>