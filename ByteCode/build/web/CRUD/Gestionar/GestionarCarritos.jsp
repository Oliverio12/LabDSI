<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar Carrito</title>
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
    </style>
</head>
<body>

<div class="container">
    <h1 class="mt-5">Gestión de Carrito</h1>
    <h2>Listado de Carrito</h2>
    <h3>Conexion: ${mensaje_conexion}</h3><br>

    <div>
        <a class="btn btn-primary mb-3" href="index.html">Regresar</a>
        <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCarrito">Agregar Carrito</a><br><br>
    </div>

    <div class="row">
        <c:forEach items="${listaCarrito}" var="item">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        ID Carrito: <c:out value="${item.id_Carrito}" />
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><strong>Producto:</strong> <c:out value="${item.producto}" /></li>
                            <li><strong>Venta:</strong> <c:out value="${item.venta}" /></li>
                            <li><strong>Cantidad:</strong> <c:out value="${item.cantidad}" /></li>
                            <li><strong>Fecha Agregado:</strong> <c:out value="${item.fechaAgregado}" /></li>
                        </ul>
                        <div class="action-buttons">
                           <<form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCarrito.jsp">
                                    <input type="hidden" name="id_Carrito" value="${item.id_Carrito}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />             
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="id_Venta" value="${item.id_Venta}" />             
                                    <input type="hidden" name="venta" value="${item.venta}" />
                                    <input type="hidden" name="cantidad" value="${item.cantidad}" />             
                                    <input type="hidden" name="fechaAgregado" value="${item.fechaAgregado}" />              
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCarrito.jsp">
                                    <input type="hidden" name="id_Carrito" value="${item.id_Carrito}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />             
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="id_Venta" value="${item.id_Venta}" />             
                                    <input type="hidden" name="venta" value="${item.venta}" />
                                    <input type="hidden" name="cantidad" value="${item.cantidad}" />             
                                    <input type="hidden" name="fechaAgregado" value="${item.fechaAgregado}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
