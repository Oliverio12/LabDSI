<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Cargos</title>
        <style>
            /* Estilo para el contenedor del pop-up */
            .popup-container {
                display: none;
                position: fixed;
                text-align: left;
                font-size: 1rem;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                border-radius: 20px;
                z-index: 1;
            }

            /* Estilo para el fondo oscuro */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
        </style>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Marca</h1>
            <h2>Listado de Marca</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarMarca">Agregar Marca</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Marca</th>
                        <th>Marca</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaMarca}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Marca}" /></td>
                            <td><c:out value="${item.nombreMarca}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarMarca.jsp">
                                    <input type="hidden" name="id_Marca" value="${item.id_Marca}" />
                                    <input type="hidden" name="nombreMarca" value="${item.nombreMarca}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarMarca.jsp">
                                    <input type="hidden" name="id_Marca" value="${item.id_Marca}" />
                                    <input type="hidden" name="nombreMarca" value="${item.nombreMarca}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                                    
                                     <button class="open-popup-btn mb-2 btn btn-success" 
                                        onclick="mostrarDetallesMarca(
                                                        '${item.id_Marca}',
                                                        '${item.nombreMarca}'
                                                        )">Ver detalles
                                </button>
                                <div class="overlay" id="overlay"></div>
                                <div class="popup-container" id="popup">
                                    <label class="font-weight-bold">ID Marca <span id="id_Marca" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Marca del Producto <span id="nombreMarca" class="text-info"></span></label><br>
                                    
                                    <button class="btn btn-secondary" onclick="abrirPopup()">Cerrar</button>

                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>            
            </table>
        </div>
        <script>
            function regresar() {
                window.location.href = "index.html";
            }
            
            function abrirPopup() {
                var popup = document.getElementById('popup');
                var overlay = document.getElementById('overlay');

                if (popup.style.display === 'block') {
                    popup.style.display = 'none';
                    overlay.style.display = 'none';
                } else {
                    popup.style.display = 'block';
                    overlay.style.display = 'block';
                }
            }

            function mostrarDetallesMarca(id_Marca,nombreMarca){
                document.getElementById('id_Marca').textContent = id_Marca;
                document.getElementById('nombreMarca').textContent = nombreMarca;
                // Muestra el pop-up
                abrirPopup();

            }
            
            
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
