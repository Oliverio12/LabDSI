<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Iniciar Sesión</title>
        <style>
            /* Estilos generales */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #2c3e50;
                margin: 0;
                padding: 0;

            }
            .ajuste{
                display: flex;
                justify-content: center;
                align-items: center;

            }
            #formLogin {
                width: 50%;
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                height: 100%;
                border-radius: 10px;
                margin-top: 45px;
                box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
                text-align: center;
            }

            h1 {
                font-size: 32px;
                color: #2c3e50; /* Color original */
                margin-bottom: 20px;
                text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
            }

            label {
                font-weight: bold;
                color: #2c3e50; /* Color original */
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 15px;
                margin: 10px 0;
                border: none;
                border-bottom: 2px solid #f39c12; /* Color original */
                background-color: transparent;
                border-radius: 0;
                font-size: 18px;
                color: #2c3e50; /* Color original */
                transition: border-bottom 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-bottom: 2px solid #f39c12; /* Color original */
            }

            input[type="submit"] {
                background-color: #f39c12; /* Color original */
                color: #fff;
                padding: 15px 20px;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #34495e; /* Color original */
            }

            /* Estilos para el botón de regreso */
            .button-wrapper {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .button-wrapper a {
                text-decoration: none;
                display: inline-block;
                padding: 15px 30px;
                background-color: #f39c12; /* Color original */
                color: #fff;
                border-radius: 25px;
                font-size: 18px;
                transition: background-color 0.3s ease;
            }

            .button-wrapper a:hover {
                background-color: #34495e; /* Color original */
            }
            /* Estilos para el botón de regreso */
            button {
                background-color: transparent;
                border: none;
                color: #f39c12; /* Color original */
                font-size: 16px;
                cursor: pointer;
                margin-top: 20px;
                text-decoration: underline;
                transition: color 0.3s ease;
            }

            button:hover {
                color: #34495e; /* Color original */
            }
            @media (max-width: 768px) {
                #formLogin {
                    width: 90%;  /* Amplía el formulario al 90% del ancho de la ventana */
                    padding: 15px;  /* Reduce el padding */
                }

                h1 {
                    font-size: 24px;  /* Reduce el tamaño de fuente */
                    margin-bottom: 15px;  /* Reduce el margen inferior */
                }

                input[type="text"],
                input[type="password"] {
                    padding: 10px;  /* Reduce el padding */
                    font-size: 16px;  /* Reduce el tamaño de fuente */
                }

                input[type="submit"],
                .button-wrapper a {
                    padding: 10px 15px;  /* Reduce el padding */
                    font-size: 16px;  /* Reduce el tamaño de fuente */
                }
            }
        </style>
    </head>
    <body>
        <div class="ajuste">
            <form method="post" action="/ByteCode/ServletPrincipal?accion=Login" id="formLogin">
                <div id="resultLogin">  
                    <c:set var="fechaActual" value="<%=new java.util.Date() %>" />
                    <c:set var="formatoFecha" value="dd/MM/YYYY" />
                    <!-- Imprimir la fecha -->
                    <strong> 
                        <c:out value="Fecha Actual: "/>
                        <fmt:formatDate value='${fechaActual}' pattern='${formatoFecha}' />
                    </strong>
                </div>
                <div><h1>Iniciar Sesión</h1></div>
                <label>Usuario: </label>
                <input type="text" name="tfUsuario" placeholder="Ingresar Usuario" id="idtfUsuario"><br>
                <label>Contraseña: </label>
                <input type="password" name="tfContrasena" placeholder="******" id="idtfContraseña" ><br>
                <div> <input type="submit" value="Iniciar Sesión"> </div><br>
                <div class="button-wrapper">
                    <a href="#" onclick="regresar()">Regresar</a>
                </div>
            </form>

        </div>

        <script>
            function regresar() {
                window.history.back();
            }
        </script>
    </body>
</html>
