package Models;

public class ViewModelDetalleVenta {
    private int id_DetalleVenta;
    private int id_Venta;
    private int id_Carrito;
    private int id_Producto;
    private int cantidad;
    private double precioUnitario;
    private double total;

    public ViewModelDetalleVenta() {
    }

    public ViewModelDetalleVenta(int id_DetalleVenta, int id_Venta, int id_Carrito, int id_Producto, int cantidad, double precioUnitario, double total) {
        this.id_DetalleVenta = id_DetalleVenta;
        this.id_Venta = id_Venta;
        this.id_Carrito = id_Carrito;
        this.id_Producto = id_Producto;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.total = total;
    }

    public int getId_DetalleVenta() {
        return id_DetalleVenta;
    }

    public void setId_DetalleVenta(int id_DetalleVenta) {
        this.id_DetalleVenta = id_DetalleVenta;
    }

    public int getId_Venta() {
        return id_Venta;
    }

    public void setId_Venta(int id_Venta) {
        this.id_Venta = id_Venta;
    }

    public int getId_Carrito() {
        return id_Carrito;
    }

    public void setId_Carrito(int id_Carrito) {
        this.id_Carrito = id_Carrito;
    }

    public int getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    
    
}
