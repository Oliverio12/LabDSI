package servlet;

//importaciones de servlet
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import librerias de conexion con BD
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//import de modelos
import Models.ViewModelCargo;
import Models.ViewModelClientes;
import Models.ViewModelDescuento;
import Models.ViewModelEmpleados;
import Models.ViewModelInventario;
import Models.ViewModelProductos;
import Models.ViewModelUsuarios;

public class ServletPrincipal extends HttpServlet {

    //Estableciendo conexion con la BD
    private final String usuario = "sa";
    private final String contrasenia = "admin123";
    private final String servidor = "localhost:1433";
    private final String bd = "TiendaByteCode";

    String url = "jdbc:sqlserver://"
            + servidor
            + ";databaseName=" + bd
            + ";user=" + usuario
            + ";password=" + contrasenia
            + ";encrypt=false;trustServerCertificate=false;";

    //Funciones del CRUD sobre la base de datos
    //Funcion de Lectura
    //Cargos
    public void mostrarCargos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Persona.Cargos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCargo> listaCargos = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCargo cargo = new ViewModelCargo();
                    cargo.setId_Cargo(rs.getInt("Id_Cargo"));
                    cargo.setCargo(rs.getString("Cargo"));
                    listaCargos.add(cargo);
                }
                request.setAttribute("listaCargos", listaCargos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin de cargos

    //empleados
    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Persona.Empleados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelEmpleados> listaEmpleados = new ArrayList<>();

                while (rs.next()) {
                    ViewModelEmpleados empleado = new ViewModelEmpleados();
                    empleado.setId_Empleado(rs.getInt("Id_Empleado"));
                    empleado.setId_Empleado(rs.getInt("Id_Empleado"));
                    empleado.setDui_Empleado(rs.getString("DUI_Empleado"));
                    empleado.setIsss_Empleado(rs.getInt("ISSS_Empleado"));
                    empleado.setNombresEmpleado(rs.getString("NombresEmpleado"));
                    empleado.setApellidosEmpleado(rs.getString("ApellidosEmpleado"));
                    empleado.setFechaNacEmpleado(rs.getDate("FechaNacEmpleado"));
                    empleado.setTelefono(rs.getString("Telefono"));
                    empleado.setCorreo(rs.getString("Correo"));

                    listaEmpleados.add(empleado);
                }
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//fin de empleados

    public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Rol.Usuarios";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();

                while (rs.next()) {
                    ViewModelUsuarios user = new ViewModelUsuarios();
                    user.setId_Usuario(rs.getInt("Id_Usuario"));
                    user.setId_Empleado(rs.getInt("Id_Empleado"));
                    user.setId_Rol(rs.getInt("Id_Rol"));
                    user.setUsuario(rs.getString("Usuario"));
                    user.setClave(rs.getString("Clave"));
                    listaUsuarios.add(user);
                }
                request.setAttribute("listaUsuarios", listaUsuarios);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }// fin de usuarios

    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Cliente.Clientes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelClientes> listaClientes = new ArrayList<>();

                while (rs.next()) {
                    ViewModelClientes cliente = new ViewModelClientes();
                    cliente.setId_Cliente(rs.getInt("Id_Cliente"));
                    cliente.setNombresCliente(rs.getString("NombresCliente"));
                    cliente.setApellidosCliente(rs.getString("ApellidosCliente"));
                    cliente.setDuiCliente(rs.getString("DUI_Cliente"));
                    cliente.setTelefono(rs.getString("Telefono"));
                    cliente.setCorreo(rs.getString("Correo"));
                    cliente.setId_Direccion(rs.getInt("Id_Direccion"));
                    cliente.setUsuario(rs.getString("Usuario"));
                    cliente.setClave(rs.getString("Clave"));
                    cliente.setFechaRegistro(rs.getString("FechaRegistro"));
                    listaClientes.add(cliente);
                }
                request.setAttribute("listaClientes", listaClientes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }// fin de Clientes

    ///Inventario
    public void mostrarInventario(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Productos.Inventario";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelInventario> listaInventario = new ArrayList<>();

                while (rs.next()) {
                    ViewModelInventario inventario = new ViewModelInventario();
                    inventario.setId_Inventario(rs.getInt("Id_Inventario"));
                    inventario.setStock(rs.getInt("Stock"));
                    inventario.setNombreProducto(rs.getString("Nombre_producto"));
                    inventario.setDescripcion(rs.getString("Descripcion"));
                    inventario.setPrecio(rs.getDouble("Precio"));
                    inventario.setFechaAdquisicion(rs.getDate("Fecha_adquisicion"));
                    inventario.setFechaUltimaActualizacion(rs.getDate("Fecha_ultima_actualizacion"));
                    inventario.setCategoria(rs.getString("Categoria"));
                    inventario.setProveedor(rs.getString("Proveedor"));
                    listaInventario.add(inventario);
                }
                request.setAttribute("listaInventario", listaInventario);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin Inventario

    //Inicio Productos
    public void mostrarProducto(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Productos.Producto";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelProductos> listaProductos = new ArrayList<>();

                while (rs.next()) {
                    ViewModelProductos producto = new ViewModelProductos();
                    producto.setId_Producto(rs.getInt("Id_Producto"));
                    producto.setNombreProducto(rs.getString("NombreProducto"));
                    producto.setDescripcion(rs.getString("Descripcion"));
                    producto.setPrecio(rs.getDouble("Precio"));
                    producto.setId_Inventario(rs.getInt("Id_Inventario"));
                    producto.setId_Marca(rs.getInt("Id_Marca"));
                    producto.setId_Categoria(rs.getInt("Id_Categoria"));

                    listaProductos.add(producto);
                }
                request.setAttribute("listaProductos", listaProductos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin Productos

    //Descuento:
    public void mostrarDescuento(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Productos.Descuento";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelDescuento> listaDescuento = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDescuento descuento = new ViewModelDescuento();
                    descuento.setId_Descuento(rs.getInt("Id_Descuento"));
                    descuento.setId_Producto(rs.getInt("Id_Producto"));
                    descuento.setPorcentajeDescuento(rs.getDouble("PorcentajeDescuento"));
                    descuento.setFechaInicio(rs.getDate("FechaInicio"));
                    descuento.setFechaFinal(rs.getDate("FechaFinal"));
                    listaDescuento.add(descuento);
                }
                request.setAttribute("listaDescuento", listaDescuento);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin Descuento

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("GestionarCargos")) {
            mostrarCargos(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCargos.jsp").forward(request, response);
        } else if (accion.equals("GestionarEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarEmpleados.jsp").forward(request, response);
        } else if (accion.equals("GestionarUsuarios")) {
            mostrarUsuarios(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarUsuarios.jsp").forward(request, response);
        } else if (accion.equals("GestionarClientes")) {
            mostrarClientes(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarClientes.jsp").forward(request, response);
        } else if (accion.equals("GestionarInventario")) {
            mostrarInventario(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarInventario.jsp").forward(request, response);
        } else if (accion.equals("GestionarProductos")) {
            mostrarProducto(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarProductos.jsp").forward(request, response);
        } else if (accion.equals("GestionarDescuento")) {
            mostrarDescuento(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarDescuento.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("Login")) {
            String Usuario = request.getParameter("tfUsuario");
            String Contrasenia = request.getParameter("tfContrasena");

            try (PrintWriter print = response.getWriter()) {
                if (Usuario.equals("Admin") && Contrasenia.equals("root")) {
                    request.getRequestDispatcher("/index.html").forward(request, response);
                } else {
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Error</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1> ERROR: CONTRASEÑA O USUARIO SON ERRONEOS </h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }//fin if 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
