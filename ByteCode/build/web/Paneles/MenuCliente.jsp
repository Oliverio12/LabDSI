<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Cliente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background: linear-gradient(to right, #ff3366, #00ccff);
                color: #ffffff;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                text-align: center;
            }

            h1 {
                font-size: 2.5em;
                margin-bottom: 20px;
            }

            nav {
                display: flex;
                justify-content: center;
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 8px;
                overflow: hidden;
                margin-top: 20px;
            }

            .nav-link {
                text-decoration: none;
                color: #ffffff;
                padding: 15px 20px;
                transition: background-color 0.3s ease;
            }

            .nav-link:hover {
                background-color: #ff3366;
                color: #ffffff;

                border-radius: 20px
            }
        </style>
    </head>
    <body>

        <div class="container text-center">
            <h1 class="mt-5">¡Bienvenido a ByteCode!</h1>

            <nav>
                <ul class="nav">
                    <li class="nav-item"> <a class="nav-link" href="/ByteCode">Inicio</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/ByteCode?accion=Login">Login</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/ByteCode?accion=GestionarProductos">Gestionar Productos</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/ByteCode?accion=GestionarDetalleCompra">Gestionar Detalle Compra</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/ByteCode?accion=GestionarCarritos">Gestionar Carritos</a></li>

                </ul>
            </nav>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
