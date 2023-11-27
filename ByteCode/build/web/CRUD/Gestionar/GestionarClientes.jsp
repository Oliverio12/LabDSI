<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Clientes</title>
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
            <h1 class="mt-5">Gestión de Clientes</h1>
            <h2>Listado de Clientes</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCliente">Agregar Cliente</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Cliente</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        
                        <th>Usuario</th>
                        <th>Clave</th>
                        <th>Fecha de Registro</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaClientes}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Cliente}" /></td>
                            <td><c:out value="${item.nombresCliente}" /></td>
                            <td><c:out value="${item.apellidosCliente}" /></td>
                            <!--<td><c:out value="${item.duiCliente}" /></td>-->
                            <!--<td><c:out value="${item.telefono}" /></td>-->
                            <!--<td><c:out value="${item.correo}" /></td>-->
                            <!--<td><c:out value="${item.id_Direccion}" /></td>-->
                            <td><c:out value="${item.direccionCompleta}" /></td>
                            <td><c:out value="${item.usuario}" /></td>
                            <td><c:out value="${item.clave}" /></td>
                            <td><c:out value="${item.fechaRegistro}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCliente.jsp">
                                    <input type="hidden" name="id_Cliente" value="${item.id_Cliente}" />
                                    <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCliente.jsp">
                                    <input type="hidden" name="id_Cliente" value="${item.id_Cliente}" />
                                    <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />             
                                    <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />             
                                    <input type="hidden" name="duiCliente" value="${item.duiCliente}" />             
                                    <input type="hidden" name="telefono" value="${item.telefono}" />             
                                    <input type="hidden" name="correo" value="${item.correo}" />             
                                    <input type="hidden" name="id_Direccion" value="${item.id_Direccion}" />             
                                    <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />             
                                    <input type="hidden" name="usuario" value="${item.usuario}" />             
                                    <input type="hidden" name="clave" value="${item.clave}" />             
                                    <input type="hidden" name="fechaRegistro" value="${item.fechaRegistro}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                                <button class="open-popup-btn mb-2 btn btn-success" 
                                        onclick="mostrarDetallesCliente(
                                                        '${item.id_Cliente}',
                                                        '${item.nombresCliente}',
                                                        '${item.apellidosCliente}',
                                                        '${item.duiCliente}',
                                                        '${item.telefono}',
                                                        '${item.correo}',
                                                        '${item.direccionCompleta}',
                                                        '${item.usuario}',
                                                        '${item.clave}',
                                                        '${item.fechaRegistro}'
                                                        )">Ver detalles
                                </button>
                                <div class="overlay" id="overlay"></div>
                                <div class="popup-container" id="popup">
                                    <label class="font-weight-bold">ID Cliente: <span id="id_Cliente" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Nombres: <span id="nombresCliente" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Apellidos: <span id="apellidosCliente" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Dui: <span id="duiCliente" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Telefono: <span id="telefono" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Correo: <span id="correo" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Direccion: <span id="direccionCompleta" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Usuario: <span id="usuario" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Clave: <span id="clave" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Fecha de Registro: <span id="fechaRegistro" class="text-info"></span></label><br>

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

            function mostrarDetallesCliente(id_Cliente,nombresCliente,apellidosCliente, duiCliente, telefono,correo,direccionCompleta, usuario,clave,fechaRegistro){
                document.getElementById('id_Cliente').textContent = id_Cliente;
                document.getElementById('nombresCliente').textContent = nombresCliente;
                document.getElementById('apellidosCliente').textContent = apellidosCliente;
                document.getElementById('duiCliente').textContent = duiCliente;
                document.getElementById('telefono').textContent = telefono;
                document.getElementById('correo').textContent = correo;
                document.getElementById('direccionCompleta').textContent = direccionCompleta;
                document.getElementById('usuario').textContent = usuario;
                document.getElementById('clave').textContent = clave;
                document.getElementById('fechaRegistro').textContent = fechaRegistro;
                // Muestra el pop-up
                abrirPopup();

            }

                
            
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
