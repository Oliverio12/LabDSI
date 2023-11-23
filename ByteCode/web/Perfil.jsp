<!DOCTYPE html>
<html>
    <head>
        <title>Perfil de Administrador</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #2c3e50;
                color: #f8f8f2;
                margin: 0;
                padding: 0;
            }

            .header {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                text-align: center;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            }

            .profile-pic {
                border-radius: 50%;
                width: 150px;
                height: 150px;
                border: 3px solid #f39c12;
                transition: transform 0.3s ease-in-out;
            }

            .profile-pic:hover {
                transform: scale(1.05);
            }

            .nav {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 10px;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
                text-align: center;
                margin-bottom: 20px;

            }

            .nav a {
                margin: 0 10px;
                color: #2c3e50;
                text-decoration: none;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 20px;
                transition: background-color 0.3s ease-in-out;
            }

            .nav a:hover {
                background-color: #f39c12;
            }


            h1, .section-title {
                color: #2c3e50;
                text-align: left;
                font-weight: bold;
            }

            .section {
                margin-bottom: 20px;
            }

            .content {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                margin: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
                display: flex;
                overflow-x: auto;
                gap: 20px;
            }

            .card {
                background-color: #f8f8f2;
                border-radius: 10px;
                padding: 20px;
                min-width: 45%;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            }

            .section-title {
                color: #2c3e50;
                font-size: 1.5em;
                margin-bottom: 15px;
                text-align: center;
            }

            .info {
                color: #2c3e50;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .info span {
                font-weight: bold;
            }

            .info i {
                color: #f39c12;
            }
            /* ...resto del código... */

            /* Estilos responsivos */
            @media (max-width: 768px) {
                .content {
                    flex-direction: column;
                    align-items: center;
                    overflow-x: visible;
                }

                .card {
                    min-width: 100%;
                    box-shadow: none;
                    border: 1px solid #ccc;
                }

                .info {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
/* ...resto del código... *//* ...resto del código... */

/* Estilos responsivos */
@media (max-width: 768px) {
    .header, .nav {
        text-align: center;
    }

    .profile-pic {
        width: 100px;
        height: 100px;
    }

    .header h1 {
        font-size: 1.5em;
        margin-top: 10px;
    }

    .nav {
        display: flex;
        flex-direction: column;
    }

    .nav a {
        margin-bottom: 10px;
    }
}


        </style>
    </head>
    <body>

        <div>
            <%@include file="MenuAdministrador.jsp" %>
        </div>

        <div class="header">
            <img src="user2.png" alt="Foto de Perfil" class="profile-pic">
            <h1>Nombre del Administrador</h1>
        </div>

        <div class="nav">
            <a href="#agregar">Agregar</a>
            <a href="#eliminar">Eliminar</a>
            <a href="#actualizar">Actualizar</a>
            <a href="#consultar">Consultar</a>
        </div>


        <div class="content">
            <div class="employee-info card">
                <div class="section-title">Información del Empleado</div>
                <div class="info"><i class="fas fa-id-badge"></i><span>ID Empleado:</span> 1</div>
                <div class="info"><i class="fas fa-id-card"></i><span>DUI Empleado:</span> 12345678-9</div>
                <div class="info"><i class="fas fa-medkit"></i><span>ISSS Empleado:</span> 1234567890</div>
                <div class="info"><i class="fas fa-user"></i><span>Nombres:</span> Nombre del Empleado</div>
                <div class="info"><i class="fas fa-user"></i><span>Apellidos:</span> Apellidos del Empleado</div>
                <div class="info"><i class="fas fa-birthday-cake"></i><span>Fecha de Nacimiento:</span> 01/01/1990</div>
                <div class="info"><i class="fas fa-phone"></i><span>Teléfono:</span> 1234-5678</div>
                <div class="info"><i class="fas fa-envelope"></i><span>Correo:</span> empleado@example.com</div>
                <div class="info"><i class="fas fa-briefcase"></i><span>ID Cargo:</span> 1</div>
                <div class="info"><i class="fas fa-map-marker-alt"></i><span>ID Dirección:</span> 1</div>
            </div>

            <div class="user-info card">
                <div class="section-title">Información del Usuario</div>
                <div class="info"><i class="fas fa-user-circle"></i><span>ID Usuario:</span> 1</div>
                <div class="info"><i class="fas fa-id-badge"></i><span>ID Empleado:</span> 1</div>
                <div class="info"><i class="fas fa-users-cog"></i><span>ID Rol:</span> 1</div>
                <div class="info"><i class="fas fa-user-alt"></i><span>Usuario:</span> admin</div>
            </div>
        </div>

        <div>
            <%@include file="footer.html" %>
        </div>


    </body>
</html>
