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
import Models.ViewModelCarritoCompras;
import Models.ViewModelClientes;
import Models.ViewModelCompra;
import Models.ViewModelDescuento;
import Models.ViewModelDetalleCompra;
import Models.ViewModelDetalleVenta;
import Models.ViewModelEmpleados;
import Models.ViewModelGrupos;
import Models.ViewModelInventario;
import Models.ViewModelMetodosPago;
import Models.ViewModelPagos;
import Models.ViewModelProductos;
import Models.ViewModelUsuarios;
import Models.ViewModelVenta;

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
    //FUNCIONES DE SELECT
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

    //Inicio Grupos
    public void mostrarGrupo(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Grupos.Grupo";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelGrupos> listaTurno = new ArrayList<>();
                while (rs.next()) {
                    ViewModelGrupos cargo = new ViewModelGrupos();
                    cargo.setId_Grupo(rs.getInt("Id_Grupo"));
                    cargo.setId_Empleado(rs.getInt("Id_Empleado"));
                    cargo.setTurno(rs.getString("Turno"));
                    listaTurno.add(cargo);
                }
                request.setAttribute("listaTurno", listaTurno);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//Fin de grupos

    //empleados
    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaEmpleadoDireccion";
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
                    empleado.setId_Cargo(rs.getInt("Id_Cargo"));
                    empleado.setCargo(rs.getString("CargoEmpleado"));
                    empleado.setId_Direccion(rs.getInt("Id_Direccion"));
                    empleado.setDireccionCompleta(rs.getString("Direccion"));

                    listaEmpleados.add(empleado);
                }
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }//fin de empleados

    //Usuarios
    public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  VistaUsuarios ";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();

                while (rs.next()) {
                    ViewModelUsuarios user = new ViewModelUsuarios();
                    user.setId_Usuario(rs.getInt("Id_Usuario"));
                    user.setId_Empleado(rs.getInt("Id_Empleado"));
                    user.setNombreCompleto(rs.getString("nombreCompleto"));
                    user.setId_Rol(rs.getInt("Id_Rol"));
                    user.setNombreRol(rs.getString("NombreRol"));
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
    //fin Usuarios

    //Clientes
    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select\n"
                        + "    C.*,\n"
                        + "    R.FechaRegistro\n"
                        + "FROM\n"
                        + "    Cliente.Clientes C\n"
                        + "left join\n"
                        + "    Cliente.RegistroClientes R ON C.Id_Cliente = R.Id_Cliente;";
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
    //Fin Clientes

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
    //Fin Inventarios

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

    //Descuento
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

    //Inicio Compras
    public void mostrarCompras(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.Compra";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCompra> listaCompra = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCompra compra = new ViewModelCompra();
                    compra.setId_Compra(rs.getInt("Id_Compra"));
                    compra.setProveedor(rs.getString("Proveedor"));
                    compra.setNombreCompra(rs.getString("NombreCompra"));
                    compra.setFecha_Compra(rs.getDate("Fecha_Compra"));
                    compra.setTotal(rs.getDouble("Total"));
                    compra.setEstado(rs.getString("Estado"));
                    compra.setId_Empleado(rs.getInt("Id_Empleado"));
                    compra.setDescripcionCompra(rs.getString("DescripcionCompra"));

                    listaCompra.add(compra);
                }
                request.setAttribute("listaCompra", listaCompra);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin compras

    // inicio  Detalles de compra
    public void mostrarDetallesCompra(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.DetalleCompra";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelDetalleCompra> listaDetalleCompra = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDetalleCompra detalleCompra = new ViewModelDetalleCompra();
                    detalleCompra.setId_DetalleCompra(rs.getInt("Id_DetalleCompra"));
                    detalleCompra.setId_Compra(rs.getInt("Id_Compra"));
                    detalleCompra.setCantidad(rs.getInt("Cantidad"));
                    detalleCompra.setPrecioUnitario(rs.getDouble("PrecioUnitario"));
                    detalleCompra.setEstadoCompra(rs.getString("EstadoCompra"));
                    detalleCompra.setTotal(rs.getDouble("Total"));
                    listaDetalleCompra.add(detalleCompra);
                }
                request.setAttribute("listaDetalleCompra", listaDetalleCompra);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin detalles de compra

    // inicio metodos de pago
    public void mostrarMetodosPago(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.MetodosPago";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelMetodosPago> listaMetodosPago = new ArrayList<>();

                while (rs.next()) {
                    ViewModelMetodosPago metodoPago = new ViewModelMetodosPago();
                    metodoPago.setIdMetodoPago(rs.getInt("Id_MetodoPago"));
                    metodoPago.setMetodo(rs.getString("Metodo"));

                    listaMetodosPago.add(metodoPago);
                }
                request.setAttribute("listaMetodosPago", listaMetodosPago);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin metodos de pago

    //inicio de pagos
    public void mostrarPagos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.Pagos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelPagos> listaPagos = new ArrayList<>();

                while (rs.next()) {
                    ViewModelPagos pago = new ViewModelPagos();
                    pago.setId_Pago(rs.getInt("Id_Pago"));
                    pago.setId_MetodoPago(rs.getInt("Id_MetodoPago"));
                    pago.setMonto(rs.getDouble("Monto"));
                    pago.setFechaPago(rs.getDate("FechaPago"));
                    listaPagos.add(pago);
                }
                request.setAttribute("listaPagos", listaPagos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin de pagos

    //inicio Ventas
    public void mostrarVentas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.Venta";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelVenta> listaVentas = new ArrayList<>();

                while (rs.next()) {
                    ViewModelVenta venta = new ViewModelVenta();
                    venta.setId_Venta(rs.getInt("Id_Venta"));
                    venta.setId_Cliente(rs.getInt("Id_Cliente"));
                    venta.setId_Usuario(rs.getInt("Id_Usuario"));
                    venta.setId_Pago(rs.getInt("Id_Pago"));
                    venta.setFechaVenta(rs.getDate("FechaVenta"));
                    listaVentas.add(venta);
                }
                request.setAttribute("listaVentas", listaVentas);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //fin de ventas

    //Inicio de Carritos
    public void mostrarCarrito(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Cliente.CarritoCompras";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelCarritoCompras> listaCarrito = new ArrayList<>();

                while (rs.next()) {
                    ViewModelCarritoCompras carritoCompras = new ViewModelCarritoCompras();
                    carritoCompras.setId_Carrito(rs.getInt("Id_Carrito"));
                    carritoCompras.setId_Producto(rs.getInt("Id_Producto"));
                    carritoCompras.setId_Venta(rs.getInt("Id_Venta"));
                    carritoCompras.setCantidad(rs.getInt("Cantidad"));
                    carritoCompras.setFechaAgregado(rs.getDate("FechaAgregado"));
                    listaCarrito.add(carritoCompras);
                }
                request.setAttribute("listaCarrito", listaCarrito);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin de Carritos

    //Inicio Detalles de venta
    public void mostrarDetallesVenta(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from  Ventas.DetalleVenta";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();

                ArrayList<ViewModelDetalleVenta> listaDetalleVenta = new ArrayList<>();

                while (rs.next()) {
                    ViewModelDetalleVenta detalleVenta = new ViewModelDetalleVenta();
                    detalleVenta.setId_DetalleVenta(rs.getInt("Id_DetalleVenta"));
                    detalleVenta.setId_Venta(rs.getInt("Id_Venta"));
                    detalleVenta.setId_Carrito(rs.getInt("Id_Carrito"));
                    detalleVenta.setId_Producto(rs.getInt("Id_Producto"));
                    detalleVenta.setCantidad(rs.getInt("Cantidad"));
                    detalleVenta.setPrecioUnitario(rs.getDouble("PrecioUnitario"));
                    detalleVenta.setTotal(rs.getDouble("Total"));

                    listaDetalleVenta.add(detalleVenta);
                }
                request.setAttribute("listaDetalleVenta", listaDetalleVenta);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    //Fin detalle de ventas

    //FUNCIONES DE INSERT ------------------------------------------------------------
    //Empleados Insert
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES

        //El ID de los empleados es autoincrementable
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Persona.Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, DUI_Empleado);
                pstmt.setString(2, ISSS_Empleado);
                pstmt.setString(3, nombresEmpleado);
                pstmt.setString(4, apellidosEmpleado);
                pstmt.setString(5, fechaNacEmpleado);
                pstmt.setString(6, telefonoEmpleado);
                pstmt.setString(7, correo);
                pstmt.setString(8, ID_Cargo);
                pstmt.setString(9, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //FIn Empleados Insert

    //Cargo Insert
    public void agregarCargo(HttpServletRequest request, HttpServletResponse response) {

        String Cargo = request.getParameter("Cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Persona.Cargos values ( ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Cargo);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Cargo Insert

    //Usuario Insert
    public void agregarUsuario(HttpServletRequest request, HttpServletResponse response) {

        String id_Empleado = request.getParameter("id_Empleado");
        String Id_Rol = request.getParameter("id_Rol");
        String Usuario = request.getParameter("usuario");
        String Clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Rol.Usuarios values ( ?,?,?,? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id_Empleado);
                pstmt.setString(2, Id_Rol);
                pstmt.setString(3, Usuario);
                pstmt.setString(4, Clave);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Usuario Insert

    //Cliente Insert
    public void agregarCliente(HttpServletRequest request, HttpServletResponse response) {

        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String duiCliente = request.getParameter("duiCliente");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String id_Direccion = request.getParameter("id_Direccion");
        String Usuario = request.getParameter("usuario");
        String Clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Cliente.Clientes values ( ?, ?, ?, ?, ?, ?, ?, ? )";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresCliente);
                pstmt.setString(2, apellidosCliente);
                pstmt.setString(3, duiCliente);
                pstmt.setString(4, telefono);
                pstmt.setString(5, correo);
                pstmt.setString(6, id_Direccion);
                pstmt.setString(7, Usuario);
                pstmt.setString(8, Clave);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Cliente Insert

    //FUNCIONES DE UPDATE-------------------------------------------------------------------
    //Update Empleado
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String Id_Empleado = request.getParameter("Id_Empleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Persona.Empleados set "
                        + "DUI_Empleado='" + DUI_Empleado + "', "
                        + "ISSS_Empleado='" + ISSS_Empleado + "', "
                        + "NombresEmpleado='" + nombresEmpleado + "', "
                        + "ApellidosEmpleado='" + apellidosEmpleado + "', "
                        + "FechaNacEmpleado='" + fechaNacEmpleado + "', "
                        + "Telefono='" + telefonoEmpleado + "', "
                        + "Correo='" + correo + "', "
                        + "Id_Cargo='" + ID_Cargo + "', "
                        + "Id_Direccion='" + ID_Direccion + "' "
                        + "where Id_Empleado='" + Id_Empleado + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //fin Update Empleado

    //Update Usuario
    public void modificarUsuario(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String Id_Usuario = request.getParameter("id_Usuario");
        String Id_Empleado = request.getParameter("id_Empleado");
        String Id_Rol = request.getParameter("id_Rol");
        String Usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Rol.Usuarios set "
                        + "Id_Empleado='" + Id_Empleado + "', "
                        + "Id_Rol='" + Id_Rol + "', "
                        + "Usuario='" + Usuario + "', "
                        + "Clave='" + clave + "' "
                        + "where Id_Usuario='" + Id_Usuario + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Usuario

    //Inicio Update Cargo
    public void modificarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String Id_Cargo = request.getParameter("Id_Cargo");
        String Cargo = request.getParameter("Cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Persona.Cargos set "
                        + "Cargo='" + Cargo + "'"
                        + "Where Id_Cargo ='" + Id_Cargo + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Cargo

    //Update Cliente
    public void modificarCliente(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String id_Cliente = request.getParameter("id_Cliente");
        String nombresClietne = request.getParameter("nombresCliente");
        String ApellidosCliente = request.getParameter("apellidosCliente");
        String duiCliente = request.getParameter("duiCliente");
        String Telefono = request.getParameter("telefono");
        String Correo = request.getParameter("correo");
        String Id_Direccion = request.getParameter("id_Direccion");
        String Usuario = request.getParameter("usuario");
        String Clave = request.getParameter("clave");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Cliente.Clientes set "
                        + "NombresCliente='" + nombresClietne + "', "
                        + "ApellidosCliente='" + ApellidosCliente + "', "
                        + "DUI_Cliente='" + duiCliente + "', "
                        + "Telefono='" + Telefono + "', "
                        + "Correo='" + Correo + "' ,"
                        + "Id_Direccion='" + Id_Direccion + "' ,"
                        + "Usuario='" + Usuario + "', "
                        + "Clave='" + Clave + "' "
                        + "where Id_Cliente='" + id_Cliente + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Update Cliente

    //FUNCIONES DE DELETE ---------------------------------------------------------------
    //Delete Empleado
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Persona.Empleados where Id_Empleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Empleado

    //Delete Cargo
    public void eliminarCargo(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cargo = request.getParameter("Id_Cargo");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Persona.Cargos where Id_Cargo='" + ID_Cargo + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Cargo

    //Delete Usuarios
    public void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        String ID_Usuario = request.getParameter("id_Usuario");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Rol.Usuarios where Id_Usuario='" + ID_Usuario + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Usuarios

    //Delete Cliente
    public void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cliente = request.getParameter("id_Cliente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Cliente.Clientes where Id_Cliente='" + ID_Cliente + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    //Fin Delete Usuarios

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
        } else if (accion.equals("GestionarCompra")) {
            mostrarCompras(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCompra.jsp").forward(request, response);
        } else if (accion.equals("GestionarDetalleCompra")) {
            mostrarDetallesCompra(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarDetalleCompra.jsp").forward(request, response);
        } else if (accion.equals("GestionarMetodosPago")) {
            mostrarMetodosPago(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarMetodosPago.jsp").forward(request, response);
        } else if (accion.equals("GestionarPago")) {
            mostrarPagos(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarPago.jsp").forward(request, response);
        } else if (accion.equals("GestionarVenta")) {
            mostrarVentas(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarVenta.jsp").forward(request, response);
        } else if (accion.equals("GestionarDetalleVentas")) {
            mostrarCarrito(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarCarritos.jsp").forward(request, response);
        } else if (accion.equals("GestionarCarritos")) {
            mostrarDetallesVenta(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarDetalleVentas.jsp").forward(request, response);
        } else if (accion.equals("GestionarGrupos")) {
            mostrarGrupo(request, response);
            request.getRequestDispatcher("/CRUD/Gestionar/GestionarGrupos.jsp").forward(request, response);
        } else if (accion.equals("AgregarEmpleado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarEmpleado.jsp").forward(request, response);
        } else if (accion.equals("AgregarCargo")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCargo.jsp").forward(request, response);
        } else if (accion.equals("AgregarUsuario")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarUsuario.jsp").forward(request, response);
        } else if (accion.equals("AgregarCliente")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("CRUD/Agregar/AgregarCliente.jsp").forward(request, response);
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

        //Captura del Post
        if (accion.equals("AgregarEmpleado")) {
            agregarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEmpleado");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("AgregarCargo")) {
            agregarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCargo");
        } else if (accion.equals("ModificarCargo")) {
            modificarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargo");
        } else if (accion.equals("EliminarCargo")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargo");
        } else if (accion.equals("AgregarUsuario")) {
            agregarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarUsuario");
        } else if (accion.equals("ModificarUsuario")) {
            modificarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarUsuarios");
        } else if (accion.equals("EliminarUsuario")) {
            eliminarUsuario(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarUsuarios");
        } else if (accion.equals("AgregarCliente")) {
            agregarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCliente");
        } else if (accion.equals("ModificarCliente")) {
            modificarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarClientes");
        } else if (accion.equals("EliminarCliente")) {
            eliminarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarClientes");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
