<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
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
            <h1 class="mt-5">Gestión de Empleados</h1>
            <h2>Listado de Empleados</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarEmpleado">Agregar Empleado</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Empleado</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Cargo</th>
                        <th>Direccion</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaEmpleados}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Empleado}" /></td>
                            <!--<td><c:out value="${item.dui_Empleado}" /></td>-->
                            <!--<td><c:out value="${item.isss_Empleado}" /></td>-->
                            <td><c:out value="${item.nombresEmpleado}" /></td>
                            <td><c:out value="${item.apellidosEmpleado}" /></td>
                            <!--<td><c:out value="${item.fechaNacEmpleado}" /></td>-->
                           <!-- <td><c:out value="${item.telefono}" /></td>-->
                            <!-- <td><c:out value="${item.correo}" /></td>-->
                            <!--<td><c:out value="${item.id_Cargo}" /></td>-->
                            <td><c:out value="${item.cargo}" /></td>
                            <!--<td><c:out value="${item.id_Direccion}" /></td>-->
                            <td><c:out value="${item.direccionCompleta}" /></td>
                            <td class="text-center">

                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarEmpleado.jsp">
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />
                                    <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />             
                                    <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />             
                                    <input type="hidden" name="id_Cargo" value="${item.id_Cargo}" />             
                                    <input type="hidden" name="id_Direccion" value="${item.id_Direccion}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarEmpleado.jsp">
                                    <input type="hidden" name="id_Empleado" value="${item.id_Empleado}" />
                                    <input type="hidden" name="dui_Empleado" value="${item.dui_Empleado}" />
                                    <input type="hidden" name="isss_Empleado" value="${item.isss_Empleado}" />
                                    <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />  
                                    <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />             
                                    <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />             
                                    <input type="hidden" name="telefono" value="${item.telefono}" />             
                                    <input type="hidden" name="correo" value="${item.correo}" />             
                                    <input type="hidden" name="id_Cargo" value="${item.id_Cargo}" />             
                                    <input type="hidden" name="id_Direccion" value="${item.id_Direccion}" />             

                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                                <button class="open-popup-btn mb-2 btn btn-success" 
                                        onclick="mostrarDetallesEmpleado(
                                                        '${item.id_Empleado}',
                                                        '${item.dui_Empleado}',
                                                        '${item.isss_Empleado}',
                                                        '${item.nombresEmpleado}',
                                                        '${item.apellidosEmpleado}',
                                                        '${item.fechaNacEmpleado}',
                                                        '${item.telefono}',
                                                        '${item.correo}',
                                                        '${item.cargo}',
                                                        '${item.direccionCompleta}'
                                                        )">Ver detalles
                                </button>
                                <div class="overlay" id="overlay"></div>
                                <div class="popup-container" id="popup">
                                    <label class="font-weight-bold">ID Empleado: <span id="id_Empleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">DUI: <span id="dui_Empleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">ISSS: <span id="isss_Empleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Nombres: <span id="nombresEmpleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Apellidos: <span id="apellidosEmpleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Fecha de nacimiento: <span id="fechaNacEmpleado" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Teléfono: <span id="telefono" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Correo: <span id="correo" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Cargo: <span id="cargo" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Dirección: <span id="direccionCompleta" class="text-info"></span></label><br><br>
                                    <button class="btn btn-secondary" onclick="abrirPopup()">Cerrar</button>

                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>            
            </table>
        </div>
        <script>
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

            function mostrarDetallesEmpleado(id_Empleado, dui_Empleado, isss_Empleado, nombresEmpleado, apellidosEmpleado, fechaNacEmpleado, telefono, correo, cargo, direccionCompleta) {
                document.getElementById('id_Empleado').textContent = id_Empleado;
                document.getElementById('dui_Empleado').textContent = dui_Empleado;
                document.getElementById('isss_Empleado').textContent = isss_Empleado;
                document.getElementById('nombresEmpleado').textContent = nombresEmpleado;
                document.getElementById('apellidosEmpleado').textContent = apellidosEmpleado;
                document.getElementById('fechaNacEmpleado').textContent = fechaNacEmpleado;
                document.getElementById('telefono').textContent = telefono;
                document.getElementById('correo').textContent = correo;
                document.getElementById('cargo').textContent = cargo;
                document.getElementById('direccionCompleta').textContent = direccionCompleta;

                // Muestra el pop-up
                abrirPopup();

            }

        </script>
        <script>
            function regresar() {
                window.location.href = "index.html";
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


    </body>
</html>
