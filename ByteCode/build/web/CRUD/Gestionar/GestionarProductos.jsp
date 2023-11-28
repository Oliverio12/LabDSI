<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Cargos</title>

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
            <h1 class="mt-5">Gestión de Productos</h1>
            <h2>Listado de Productos</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarProducto">Agregar Productos</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Productos</th>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Marca</th>
                        <th>Categoria</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaProductos}" var="item">
                        <tr>
                            <td><c:out value="${item.id_Producto}" /></td>
                            <td><c:out value="${item.nombreProducto}" /></td>
                            <!--<td><c:out value="${item.descripcion}" /></td>-->
                            <td><c:out value="${item.precio}" /></td>
                            <!--<td><c:out value="${item.id_Inventario}" /></td>-->
                            <!--<td><c:out value="${item.inventario}" /></td>-->
                            <!--<td><c:out value="${item.id_Marca}" /></td>-->
                            <td><c:out value="${item.marca}" /></td>
                            <!--<td><c:out value="${item.id_Categoria}" /></td>-->
                            <td><c:out value="${item.categoria}" /></td>
                            <td class="text-center">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarProducto.jsp">
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />             
                                    <input type="hidden" name="descripcion" value="${item.descripcion}" />             
                                    <input type="hidden" name="precio" value="${item.precio}" />             
                                    <input type="hidden" name="id_Inventario" value="${item.id_Inventario}" />             
                                    <input type="hidden" name="id_Marca" value="${item.id_Marca}" />             
                                    <input type="hidden" name="id_Categoria" value="${item.id_Categoria}" /> 
                                    <input type="hidden" name="marca" value="${item.marca}" />     
                                    <input type="hidden" name="categoria" value="${item.categoria}" />             
                                    <input type="hidden" name="inventario" value="${item.inventario}" />             

                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarProducto.jsp">
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />             
                                    <input type="hidden" name="descripcion" value="${item.descripcion}" />             
                                    <input type="hidden" name="precio" value="${item.precio}" />             
                                    <input type="hidden" name="id_Inventario" value="${item.id_Inventario}" />             
                                    <input type="hidden" name="id_Marca" value="${item.id_Marca}" />             
                                    <input type="hidden" name="id_Categoria" value="${item.id_Categoria}" /> 
                                    <input type="hidden" name="marca" value="${item.marca}" />     
                                    <input type="hidden" name="categoria" value="${item.categoria}" />             
                                    <input type="hidden" name="inventario" value="${item.inventario}" />                 
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>

                                <button class="open-popup-btn mb-2 btn btn-success" 
                                        onclick="mostrarDetallesProductos(
                                                        '${item.id_Producto}',
                                                        '${item.nombreProducto}',
                                                        '${item.descripcion}',
                                                        '${item.precio}',
                                                        '${item.inventario}',
                                                        '${item.marca}',
                                                        '${item.categoria}'
                                                        )">Ver detalles
                                </button>
                                <div class="overlay" id="overlay"></div>
                                <div class="popup-container" id="popup">
                                    <label class="font-weight-bold">ID Producto<span id="id_Producto" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Producto<span id="nombreProducto" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Descripcicon<span id="descripcion" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Precio<span id="precio" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Inventario<span id="inventario" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Marca<span id="marca" class="text-info"></span></label><br>
                                    <label class="font-weight-bold">Categoria<span id="categoria" class="text-info"></span></label><br>

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

            function mostrarDetallesProductos(id_Producto, nombreProducto, descripcion, precio, inventario, marca, categoria) {
                document.getElementById('id_Producto').textContent = id_Producto;
                document.getElementById('nombreProducto').textContent = nombreProducto;
                document.getElementById('descripcion').textContent = descripcion;
                document.getElementById('precio').textContent = precio;
                document.getElementById('inventario').textContent = inventario;
                document.getElementById('marca').textContent = marca;
                document.getElementById('categoria').textContent = categoria;

                // Muestra el pop-up
                abrirPopup();

            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
