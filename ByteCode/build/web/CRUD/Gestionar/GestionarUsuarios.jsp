<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Usuarios</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
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
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Usuarios</h1>
            <h2>Listado de Usuarios</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarUsuario">Agregar Usuario</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Usuario</th>
                        <th>Nombres Empleado</th>
                        <th>Rol</th>
                        <th>Usuario</th>
                        <th>Clave</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaUsuarios}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Usuario}" /></td>
                            <!--<td><c:out value="${item.id_Empleado}" /></td>-->
                            <td><c:out value="${item.nombreCompleto}" /></td>
                            <!--<td><c:out value="${item.id_Rol}" /></td>-->
                            <td><c:out value="${item.nombreRol}" /></td>
                            <td><c:out value="${item.usuario}" /></td>
                            <td><c:out value="${item.clave}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarUsuario.jsp">
                                    <input type="hidden" name="id_Usuario" value="${item.id_Usuario}" />
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />
                                    <input type="hidden" name="usuario" value="${item.usuario}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarUsuario.jsp">
                                    <input type="hidden" name="id_Usuario" value="${item.id_Usuario}" />
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />                                    
                                    <input type="hidden" name="nombreCompleto" value="${item.nombreCompleto}" />                                    
                                    <input type="hidden" name="id_Rol" value="${item.id_Rol}" />                                    
                                    <input type="hidden" name="nombreRol" value="${item.nombreRol}" />                                    
                                    <input type="hidden" name="usuario" value="${item.usuario}" />             
                                    <input type="hidden" name="clave" value="${item.clave}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                                    
                                <button class="open-popup-btn mb-2 btn btn-success" 
                                        onclick="mostrarDetallesUsuario(
                                                        '${item.id_Usuario}',
                                                        '${item.id_Empleado}',
                                                        '${item.nombreCompleto}',
                                                        '${item.id_Rol}',
                                                        '${item.nombreRol}',
                                                        '${item.usuario}',
                                                        '${item.clave}'
                                                        )">Ver detalles
                                </button>
                                <div class="overlay" id="overlay"></div>
                                <div class="popup-container" id="popup">
                                    <label class="font-weight-bold">ID Usuario: <span id="id_Usuario" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">ID Empleado: <span id="id_Empleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Nombre Completo <span id="nombreCompleto" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">ID Rol: <span id="id_Rol" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Rol: <span id="nombreRol" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Usuario: <span id="usuario" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Clave: <span id="clave" class="text-info"></span></label><br>

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

            function mostrarDetallesUsuario(id_Usuario,id_Empleado,nombreCompleto, id_Rol, nombreRol, usuario,clave){
                document.getElementById('id_Usuario').textContent = id_Usuario;
                document.getElementById('id_Empleado').textContent = id_Empleado;
                document.getElementById('nombreCompleto').textContent = nombreCompleto;
                document.getElementById('id_Rol').textContent = id_Rol;
                document.getElementById('nombreRol').textContent = nombreRol;
                document.getElementById('usuario').textContent = usuario;
                document.getElementById('clave').textContent = clave;
                // Muestra el pop-up
                abrirPopup();

            }

        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
