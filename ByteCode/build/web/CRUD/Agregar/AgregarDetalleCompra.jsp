<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Detalle Compra</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container mt-5 mb-5 border p-4">
            <c:if test="${exito!=null}">
                <c:if test="${exito}">
                    <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
                </c:if>
                <c:if test="${!exito}">
                    <p><strong style="color: red;">No se guardó la información</strong></p>
                </c:if>
            </c:if>   
            <h1>Agregar nuevo Detalle de Compra</h1>

            <form method="POST" action="/ByteCode/ServletPrincipal?accion=AgregarDetalleCompra">
                <div class="mb-3">
                    <label for="id_Compra" class="form-label"> <strong>ID Compra: </strong></label>
                    <input type="text" class="form-control" name="id_Compra" id="id_Compra" required />
                </div>
                <div class="mb-3">
                    <label for="cantidad" class="form-label"> <strong> Cantidad: </strong></label>
                    <input type="number" min="0" class="form-control" name="cantidad" id="cantidad" required oninput="calcularTotal()"/>
                </div>
                <div class="mb-3">
                    <label for="precioUnitario" class="form-label"> <strong> Precio Unitario: </strong></label>
                    <input type="text" class="form-control" name="precioUnitario" id="precioUnitario" required oninput="calcularTotal()"/>
                </div>
                <div class="mb-3">
                    <label for="estadoCompra" class="form-label"> <strong> Estado Compra </strong></label>
                    <input type="text" class="form-control" name="estadoCompra" id="estadoCompra" required />
                </div>
                <div class="mb-3">
                    <label for="total" class="form-label"> <strong> Total </strong></label>
                    <input type="number" step="0.01" min="0" class="form-control" name="total" id="total" required />
                </div>

                <input type="submit" class="btn btn-primary" value="Registrar" onclick="return confirm('¿Desea registrar el Detalle de la compra?')" /><br><br>
            </form>

            <div class="mt-3">
                <a href="/ByteCode/?accion=GestionarDetalleCompra" class="btn btn-secondary">Regresar</a>
            </div>            

        </div>
        <script>
            function calcularTotal() {
                // Obtener los valores de cantidad y precio unitario
                var cantidad = document.getElementById('cantidad').value;
                var precioUnitario = document.getElementById('precioUnitario').value;

                // Verificar si ambos campos tienen valores
                if (cantidad !== "" && precioUnitario !== "") {
                    // Calcular el total
                    var total = cantidad * precioUnitario;

                    // Mostrar el total en el campo correspondiente
                    document.getElementById('total').value = total.toFixed(2);
                } else {
                    // Si falta algún valor, mostrar un total vacío
                    document.getElementById('total').value = 0.00;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
