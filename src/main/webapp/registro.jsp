<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Transylvania</title>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="row border rounded-5 p-3 bg-white shadow box-area">
        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4">
                    <h2>Regístrate</h2>
                    <p>Crea una cuenta para acceder a nuestro sistema.</p>
                </div>

                <div class="input-group mb-3">
                    <label for="nombre" class="input-group-text"><i class="fas fa-user"></i></label>
                    <input type="text" id="nombre" class="form-control form-control-lg bg-light fs-6" placeholder="Nombre Completo">
                </div>

                <div class="input-group mb-3">
                    <label for="email" class="input-group-text"><i class="fas fa-envelope"></i></label>
                    <input type="email" id="email" class="form-control form-control-lg bg-light fs-6" placeholder="Correo Electrónico">
                </div>

                <div class="input-group mb-3">
                    <label for="telefono" class="input-group-text"><i class="fa-solid fa-phone"></i></label>
                    <input type="text" id="telefono" class="form-control form-control-lg bg-light fs-6" placeholder="Teléfono">
                </div>

                <div class="input-group mb-3">
                    <label for="genero" class="input-group-text"><i class="fa-solid fa-venus-mars"></i></label>
                    <select id="genero" class="form-select form-select-lg bg-light fs-6">
                        <option value="" selected disabled>Selecciona tu género</option>
                        <option value="masculino">Masculino</option>
                        <option value="femenino">Femenino</option>
                    </select>
                </div>

                <div class="input-group mb-3">
                    <label for="password" class="input-group-text"><i class="fas fa-lock"></i></label>
                    <input type="password" id="password" class="form-control form-control-lg bg-light fs-6" placeholder="Contraseña">
                </div>

                <div class="input-group mb-3">
                    <label for="confirm-password" class="input-group-text"><i class="fas fa-lock"></i></label>
                    <input type="password" id="confirm-password" class="form-control form-control-lg bg-light fs-6" placeholder="Confirmar Contraseña">
                </div>

                <div class="input-group mb-3">
                    <button type="button" class="btn btn-lg w-100 fs-6 text-white" style="background: rgb(24,59,113);" onclick="window.location.href='index.jsp'">
                        Registrarse
                    </button>
                </div>

                <div class="row">
                    <small>¿Ya tienes cuenta? <a href="index.jsp">Inicia Sesión</a></small>
                </div>
            </div>
        </div>

        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box p-3" style="background: #0e2238;">
            <div class="featured-image">
                <img src="img/hotelLogo.png" alt="Hotel Transylvania" class="img-fluid" style="max-width: 100%; height: auto;">
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/login.js"></script>
</body>
</html>
