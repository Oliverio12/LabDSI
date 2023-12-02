<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar Descuentos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin-top: 50px;
        }

        .container {
            margin-top: 20px;
        }

        h1, h2, h3 {
            color: #007bff;
        }

        .card {
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        .btn-success:hover {
            background-color: #28a745;
            border-color: #28a745;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="mt-5">Gestión de Descuentos</h1>
    <h2>Listado de Descuentos</h2>
    <h3>Conexion: ${mensaje_conexion}</h3><br>

    <div>
        <a class="btn btn-primary mb-3" href="index.html">Regresar</a>
        <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarDescuento">Agregar Descuento</a><br><br>
    </div>

    <div class="row">
        <c:forEach items="${listaDescuento}" var="item">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Descuento ID: ${item.id_Descuento}
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${item.producto}</h5>
                        <p class="card-text">
                            <strong>Porcentaje de Descuento:</strong> ${item.porcentajeDescuento}%<br>
                            <strong>Inicio Descuento:</strong> ${item.fechaInicio}<br>
                            <strong>Final Descuento:</strong> ${item.fechaFinal}
                        </p>
                        <div class="action-buttons">
                             <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarDescuento.jsp">
                                    <input type="hidden" name="id_Descuento" value="${item.id_Descuento}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="porcentajeDescuento" value="${item.porcentajeDescuento}" />
                                    <input type="hidden" name="fechaInicio" value="${item.fechaInicio}" />
                                    <input type="hidden" name="fechaFinal" value="${item.fechaFinal}" />             
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarDescuento.jsp">
                                    <input type="hidden" name="id_Descuento" value="${item.id_Descuento}" />
                                    <input type="hidden" name="id_Producto" value="${item.id_Producto}" />
                                    <input type="hidden" name="producto" value="${item.producto}" />
                                    <input type="hidden" name="porcentajeDescuento" value="${item.porcentajeDescuento}" />
                                    <input type="hidden" name="fechaInicio" value="${item.fechaInicio}" />
                                    <input type="hidden" name="fechaFinal" value="${item.fechaFinal}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    // Funciones JavaScript aquí...
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
