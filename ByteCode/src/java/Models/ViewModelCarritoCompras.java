package Models;

import java.util.Date;

public class ViewModelCarritoCompras {
    private int id_Carrito;
    private int id_Producto;
    private String producto;
    private int id_Venta;
    private String venta;
    private int cantidad;
    private Date fechaAgregado;

    public ViewModelCarritoCompras() {
    }

    public ViewModelCarritoCompras(int id_Carrito, int id_Producto, String producto, int id_Venta, String venta, int cantidad, Date fechaAgregado) {
        this.id_Carrito = id_Carrito;
        this.id_Producto = id_Producto;
        this.producto = producto;
        this.id_Venta = id_Venta;
        this.venta = venta;
        this.cantidad = cantidad;
        this.fechaAgregado = fechaAgregado;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getVenta() {
        return venta;
    }

    public void setVenta(String venta) {
        this.venta = venta;
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

    public int getId_Venta() {
        return id_Venta;
    }

    public void setId_Venta(int id_Venta) {
        this.id_Venta = id_Venta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaAgregado() {
        return fechaAgregado;
    }

    public void setFechaAgregado(Date fechaAgregado) {
        this.fechaAgregado = fechaAgregado;
    }
    
    
    
}
