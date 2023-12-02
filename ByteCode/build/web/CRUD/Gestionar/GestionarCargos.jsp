<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Cargos</title>
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

         
            .card-body {
                text-align: center;
            }

            .action-buttons {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1 class="mt-5">Gestión de Cargos</h1>
            <h2>Listado de Cargos</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <a class="btn btn-primary mb-3" href="Paneles/PanelAdministrador.jsp">Regresar</a>
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarCargo">Agregar Cargo</a><br><br>
            </div>

            <div class="row">
                <c:forEach items="${listaCargos}" var="item">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                ID Cargo: <c:out value="${item.id_Cargo}" />
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${item.cargo}</h5>
                                <div class="action-buttons">
                                    <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarCargo.jsp">
                                        <input type="hidden" name="id_Cargo" value="${item.id_Cargo}" />
                                        <input type="hidden" name="cargo" value="${item.cargo}" />
                                        <button type="submit" class="btn btn-warning">Modificar</button>
                                    </form>
                                    <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarCargo.jsp">
                                        <input type="hidden" name="id_Cargo" value="${item.id_Cargo}" />
                                        <input type="hidden" name="cargo" value="${item.cargo}" />
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


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
