<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar Categoria</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin-top: 50px;
        }

        .container {
            margin-top: 20px;
        }

        h1,
        h2,
        h3 {
            color: #007bff;
        }

        .card {
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
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
        <h1 class="mt-5">Gestión de Categoría</h1>
        <h2>Listado de Categoría</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <div>
            <a class="btn btn-primary mb-3" href="index.html">Regresar</a>
            <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCategoria">Agregar Categoría</a><br><br>
        </div>

        <div class="row">
            <c:forEach items="${listaCategoria}" var="item">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">
                            Categoría ID: ${item.id_Categoria}
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${item.nombreCategoria}</h5>
                            <div class="action-buttons">
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCategoria.jsp">
                                    <input type="hidden" name="id_Categoria" value="${item.id_Categoria}" />
                                    <input type="hidden" name="nombreCategoria" value="${item.nombreCategoria}" />
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCategoria.jsp">
                                    <input type="hidden" name="id_Categoria" value="${item.id_Categoria}" />
                                    <input type="hidden" name="nombreCategoria" value="${item.nombreCategoria}" />
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
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
        function regresar() {
            window.history.back();
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>
