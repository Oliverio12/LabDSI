package Models;

import java.util.Date;

public class ViewModelCompra {
    private int id_Compra;
    private String proveedor;
    private String nombreCompra;
    private Date fecha_Compra;
    private double total;
    private String estado;
    private int id_Empleado;
    private String empleado;
    private String descripcionCompra;

    public ViewModelCompra() {
    }

    public ViewModelCompra(int id_Compra, String proveedor, String nombreCompra, Date fecha_Compra, double total, String estado, int id_Empleado, String empleado, String descripcionCompra) {
        this.id_Compra = id_Compra;
        this.proveedor = proveedor;
        this.nombreCompra = nombreCompra;
        this.fecha_Compra = fecha_Compra;
        this.total = total;
        this.estado = estado;
        this.id_Empleado = id_Empleado;
        this.empleado = empleado;
        this.descripcionCompra = descripcionCompra;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

   
    

    public int getId_Compra() {
        return id_Compra;
    }

    public void setId_Compra(int id_Compra) {
        this.id_Compra = id_Compra;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getNombreCompra() {
        return nombreCompra;
    }

    public void setNombreCompra(String nombreCompra) {
        this.nombreCompra = nombreCompra;
    }

    public Date getFecha_Compra() {
        return fecha_Compra;
    }

    public void setFecha_Compra(Date fecha_Compra) {
        this.fecha_Compra = fecha_Compra;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_Empleado() {
        return id_Empleado;
    }

    public void setId_Empleado(int id_Empleado) {
        this.id_Empleado = id_Empleado;
    }

    public String getDescripcionCompra() {
        return descripcionCompra;
    }

    public void setDescripcionCompra(String descripcionCompra) {
        this.descripcionCompra = descripcionCompra;
    }

    
    
}
