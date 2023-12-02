<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Detalle Venta</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin-top: 50px;
            }

            .container {
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1, h2, h3 {
                color: #007bff;
            }

            .btn-primary,
            .btn-warning,
            .btn-danger {
                width: 150px;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .btn-warning:hover {
                background-color: #d39e00;
                border-color: #d39e00;
            }

            .btn-danger:hover {
                background-color: #bd2130;
                border-color: #bd2130;
            }

            .card {
                margin-top: 20px;
            }

            .card-header {
                background-color: #007bff;
                color: #ffffff;
                font-weight: bold;
            }

            .card-body {
                text-align: left;
            }

            .action-buttons {
                margin-top: 10px;
            }
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
            <h1 class="mt-5">Gestión de Detalle Venta</h1>
            <h2>Listado de Detalle Venta</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <a class="btn btn-primary mb-3" href="index.html">Regresar</a>
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarDetalleVenta">Agregar </a><br><br>
            </div>

            <div class="row">
                <c:forEach items="${listaDetalleVenta}" var="item">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                ID Detalle Venta: <c:out value="${item.id_DetalleVenta}" />
                            </div>
                            <div class="card-body">
                                <ul class="list-unstyled">

                                    <li><strong>Producto:</strong> <c:out value="${item.producto}" /></li>
                                    <li><strong>Cantidad:</strong> <c:out value="${item.cantidad}" /></li>
                                    <li><strong>Precio Unitario:</strong> <c:out value="${item.precioUnitario}" /></li>
                                    <li><strong>Total:</strong> <c:out value="${item.total}" /></li>
                                </ul>
                                <div class="action-buttons">
                                    <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarDetalleVenta.jsp">
                                        <input type="hidden" name="id_DetalleVenta" value="${item.id_DetalleVenta}" />
                                        <input type="hidden" name="id_Venta" value="${item.id_Venta}" />
                                        <input type="hidden" name="venta" value="${item.venta}" />
                                        <input type="hidden" name="id_Carrito" value="${item.id_Carrito}" />
                                        <input type="hidden" name="carrito" value="${item.carrito}" />
                                        <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                        <input type="hidden" name="producto" value="${item.producto}" />
                                        <input type="hidden" name="cantidad" value="${item.cantidad}" />
                                        <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                        <input type="hidden" name="total" value="${item.total}" />
                                        <button type="submit" class="btn btn-warning">Modificar</button>
                                    </form>

                                    <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarDetalleVenta.jsp">
                                        <input type="hidden" name="id_DetalleVenta" value="${item.id_DetalleVenta}" />
                                        <input type="hidden" name="id_Venta" value="${item.id_Venta}" />
                                        <input type="hidden" name="venta" value="${item.venta}" />
                                        <input type="hidden" name="id_Carrito" value="${item.id_Carrito}" />
                                        <input type="hidden" name="carrito" value="${item.carrito}" />
                                        <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                        <input type="hidden" name="producto" value="${item.producto}" />
                                        <input type="hidden" name="cantidad" value="${item.cantidad}" />
                                        <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                        <input type="hidden" name="total" value="${item.total}" />
                                        <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                    </form>
                                    <button class="open-popup-btn mb-2 btn btn-success" 
                                            onclick="mostrarDetallesVenta(
                                                            '${item.id_DetalleVenta}',
                                                            '${item.id_Venta}',
                                                            '${item.venta}',
                                                            '${item.id_Carrito}',
                                                            '${item.carrito}',
                                                            '${item.id_Producto}',
                                                            '${item.producto}',
                                                            '${item.precioUnitario}',
                                                            '${item.total}'
                                                            )">Ver detalles
                                    </button>
                                    <div class="overlay" id="overlay"></div>
                                    <div class="popup-container" id="popup">
                                        <label class="font-weight-bold">ID Detalle Venta: <span id="id_DetalleVenta" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">ID Venta: <span id="id_Venta" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">Venta: <span id="venta" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">ID Carrito: <span id="id_Carrito" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">Carrito: <span id="carrito" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">ID Producto: <span id="id_Producto" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">Producto: <span id="producto" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">Precio Unitario: <span id="precioUnitario" class="text-info"></span></label><br>
                                        <label class="font-weight-bold">Total: <span id="total" class="text-info"></span></label><br>

                                        <button class="btn btn-secondary" onclick="abrirPopup()">Cerrar</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div>
            <%@include file="footer.html" %>
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

            function mostrarDetallesVenta(id_DetalleVenta, id_Venta, venta, id_Carrito, carrito, id_Producto, producto, precioUnitario, total) {

                document.getElementById('id_DetalleVenta').textContent = id_DetalleVenta;
                document.getElementById('id_Venta').textContent = id_Venta;
                document.getElementById('venta').textContent = venta;
                document.getElementById('id_Carrito').textContent = id_Carrito;
                document.getElementById('carrito').textContent = carrito;
                document.getElementById('id_Producto').textContent = id_Producto;
                document.getElementById('producto').textContent = producto;
                document.getElementById('precioUnitario').textContent = precioUnitario;
                document.getElementById('total').textContent = total;
                // Muestra el pop-up
                abrirPopup();

            }
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
