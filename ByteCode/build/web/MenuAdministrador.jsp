<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <title>JSP Page</title>
        <style>
            /* Estilos básicos */
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                padding: 0;
                margin: 0;
            }

            h1 {
                color: white;
                text-align: center;
                margin: 0;
                background-color: #2c3e50;
                padding: 7px;
                height: 50px;
            }

            /* Navegación */
            nav {
                background-color: #2c3e50;
                border-radius: 10px;
                overflow: hidden;
                margin-top: 15px;
            }

            nav ul {
                padding: 0;
                margin: 0;
                display: flex;
                justify-content: space-around;
                list-style-type: none;
            }

            nav li {
                flex: 1;
                text-align: center;
                position: relative;
            }

            nav a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 15px;
                transition: background-color 0.3s;
                position: relative;
            }

            nav a::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 0;
                height: 3px;
                background-color: #f39c12;
                transition: width 0.3s;
            }

            nav a:hover {
                background-color: #34495e;
            }

            nav a:hover::before {
                width: 100%;
            }

            /* Botón de hamburguesa */
            .hamburger-button {
                display: none; /* Ocultar por defecto */
                flex-direction: column;
                justify-content: space-around;
                width: 2rem;
                height: 2rem;
                background: transparent;
                border: none;
                cursor: pointer;
            }

            .hamburger-button .bar {
                width: 2rem;
                height: 0.25rem;
                background-color: #333;
            }

            /* Estilos responsivos */
            @media (max-width: 768px) {
                h1 {
                    font-size: 1.5em; /* Reducir el tamaño de fuente */
                    text-align: center; /* Centrar el texto */
                }

                nav ul {
                    display: flex;
                    flex-direction: column;
                    align-items: center; /* Centrar los elementos en el eje transversal */
                }

                nav li {
                    margin: 5px 0; /* Agregar margen entre elementos de la lista */
                    text-align: center; /* Centrar el texto de los elementos de la lista */
                }

                nav a {
                    width: 100%; /* Ocupar todo el ancho disponible */
                    padding: 10px; /* Agregar padding para un área de clic más grande */
                    box-sizing: border-box; /* Asegurarse de que el padding no aumente el tamaño total del enlace */
                }

                .hamburger-button {
                    display: flex;
                }

                #nav-menu {
                    display: none; /* Ocultar menú por defecto */
                    flex-direction: column;
                }

                #nav-menu.show {
                    display: flex; /* Mostrar menú cuando esté activo */
                }
            }
        </style>


    </head>
    <body>

        <h1>Bienvenido al Sistema de Tienda en Linea</h1>

        <button class="hamburger-button" onclick="toggleMenu()">
            <span class="bar"> </span>
            <span class="bar"> </span>
            <span class="bar"> </span>
        </button>


        <nav id="nav-menu">
            <ul>
                <li> <a href="/ByteCode"><i class="fas fa-home"></i> Inicio</a></li>
                <li> <a href="/ByteCode?accion=Login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li> <a href="/ByteCode?accion=RegistroEmpleado"><i class="fas fa-user-plus"></i> Registro Empleado</a></li>
                <li> <a href="/ByteCode?accion=RegistroProducto"><i class="fas fa-shopping-cart"></i> Registro Producto</a></li>
                <li> <a href="/ByteCode?accion=RegistroCliente"><i class="fas fa-user"></i> Registro Cliente</a></li>
                <li> <a href="/ByteCode?accion=RegistroVenta"><i class="fas fa-dollar-sign"></i> Registro Venta</a></li>
                <li> <a href="/ByteCode?accion=Perfil"><span class="icon"><i class="fas fa-user"></i></span> Perfil</a></li>
            </ul>
        </nav>
        <script>
            function toggleMenu() {
                var menu = document.getElementById('nav-menu');
                if (menu.classList.contains('show')) {
                    menu.classList.remove('show');
                } else {
                    menu.classList.add('show');
                }
            }

        </script>
    </body>
</html>
