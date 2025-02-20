<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <title>Inicio</title>
</head>

<body>
<div class="d-flex justify-content-between align-items-center">
    <h4><i class="fa-solid fa-house me-2"></i> Inicio</h4>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="#" onclick="cargarPagina('jsp/inicio.jsp')">Inicio</a></li>
        </ol>
    </nav>
</div>

<!-- Sección de habitaciones -->
<div class="row custom-row-rooms">
    <div class="col-lg-3 col-md-3 col-sm-12">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>50</h3>
                <p>Total Habitaciones</p>
            </div>
            <div class="icon">
                <i class="fas fa-bed room-icon"></i>
            </div>
            <a href="#" class="small-box-footer">Mas info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-12">
        <div class="small-box bg-success">
            <div class="inner">
                <h3>23</h3>
                <p>Habitaciones Libres</p>
            </div>
            <div class="icon">
                <i class="fas fa-bed room-icon"></i>
            </div>
            <a href="#" class="small-box-footer">Mas info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-12">
        <div class="small-box bg-danger">
            <div class="inner">
                <h3>27</h3>
                <p>Habitaciones Ocupadas</p>
            </div>
            <div class="icon">
                <i class="fas fa-bed room-icon"></i>
            </div>
            <a href="#" class="small-box-footer">Mas info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-12">
        <div class="small-box bg-warning">
            <div class="inner">
                <h3>4</h3>
                <p>Habitaciones Reservadas Hoy</p>
            </div>
            <div class="icon">
                <i class="fas fa-bed room-icon"></i>
            </div>
            <a href="#" class="small-box-footer">Mas info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
</div>

<!-- Sección de estadísticas y habitaciones ocupadas -->
<div class="row custom-row-statistics-rooms">
    <!-- Tarjeta de Estadísticas -->
    <div class="col-lg-7 col-md-7 col-sm-12">
        <div class="card mt-4">
            <div class="card-header text-white d-flex align-items-center">
                <p class="mb-0"><i class="fa-solid fa-chart-area me-2"></i> Estadísticas</p>
            </div>
            <div class="card-body">
                <!-- Filtro para seleccionar el rango de fechas por año-->
                <div class="mb-3">
                    <label for="filtroAnio" class="form-label">Seleccionar Año:</label>
                    <select id="filtroAnio" class="form-select">
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025" selected>2025</option>
                    </select>
                </div>

                <!-- Gráfica de barras -->
                <div style="height: 400px;">
                    <canvas id="graficaIngresos"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Tarjeta de Lista de Habitaciones Ocupadas -->
    <div class="col-lg-5 col-md-5 col-sm-12">
        <div class="card mt-4">
            <div class="card-header text-white d-flex align-items-center" style="background: #0e2238;">
                <p class="mb-0"><i class="fa-regular fa-clock me-2"></i> Lista de Habitaciones Ocupadas</p>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered align-middle">
                        <thead class="table-warning">
                        <tr>
                            <th>N°</th>
                            <th>Cliente</th>
                            <th>Habitación</th>
                            <th>Tarifa/Tipo</th>
                            <th>Ingreso</th>
                        </tr>
                        </thead>
                        <tbody id="tablaHabitacionesOcupadas">
                        <tr>
                            <td>1</td>
                            <td>Gonashi</td>
                            <td>696</td>
                            <td>24hr/Presidencial</td>
                            <th>15-05-25 16:10:05</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>