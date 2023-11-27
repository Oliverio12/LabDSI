<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Grupos</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5">Gestión de Grupos</h1>
            <h2>Listado de Grupos</h2>
            <h3>Conexion: ${mensaje_conexion}</h3><br>

            <div>
                <button class="btn btn-primary mb-3" onclick="regresar()">Regresar</button>    
                <a class="btn btn-primary mb-3" href="/ByteCode?accion=AgregarGrupo">Agregar Grupos</a><br><br>
            </div>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Grupo</th>
                        <th>ID Empleado</th>
                        <th>Turno</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                                    <!--Llamas lo del ArrayList -->
                    <c:forEach items="${listaTurno}" var="item">
                        <tr>
                                            <!--Aca es importante tener igual que en los ViewModels-->
                            <td><c:out value="${item.id_Grupo}" /></td>
                            <td><c:out value="${item.id_Empleado}" /></td>
                            <td><c:out value="${item.turno}" /></td>
                            <td class="text-center">
                                <!--Tener en cuanta que siempre tienes que asegurar que sean igual a los nombres que usaras-->
                                <form method="POST" action="/ByteCode/CRUD/Modificar/ModificarGrupo.jsp">
                                    <input type="hidden" name="Id_Cargo" value="${item.id_Grupo}" />
                                    <input type="hidden" name="cargo" value="${item.turno}" />   
                                                        <!--Tener en cuenta nombres de clase tambien sean acorde-->          
                                    <button type="submit" class="btn btn-warning">Modificar</button>
                                </form>    
                                <form method="POST" action="/ByteCode/CRUD/Eliminar/EliminarGrupo.jsp">
                                                                <!--Sino lo modificas los item."nombreJavaClass"-->
                                    <input type="hidden" name="Id_Cargo" value="${item.id_Grupo}" /><!--Ten por seguro un error 500-->
                                    <input type="hidden" name="cargo" value="${item.turno}" />             
                                    <button type="submit" class="m-2 btn btn-danger">Eliminar</button>
                                </form>
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
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
