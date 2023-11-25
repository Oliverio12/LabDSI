
package Models;

import java.util.Date;


public class ViewModelVenta {
    private int id_Venta;
    private int id_Cliente;
    private int id_Usuario;
    private int id_Pago;
    private Date fechaVenta;

    public ViewModelVenta(int id_Venta, int id_Cliente, int id_Usuario, int id_Pago, Date fechaVenta) {
        this.id_Venta = id_Venta;
        this.id_Cliente = id_Cliente;
        this.id_Usuario = id_Usuario;
        this.id_Pago = id_Pago;
        this.fechaVenta = fechaVenta;
    }

    public ViewModelVenta() {
    }

    public int getId_Venta() {
        return id_Venta;
    }

    public void setId_Venta(int id_Venta) {
        this.id_Venta = id_Venta;
    }

    public int getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(int id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public int getId_Usuario() {
        return id_Usuario;
    }

    public void setId_Usuario(int id_Usuario) {
        this.id_Usuario = id_Usuario;
    }

    public int getId_Pago() {
        return id_Pago;
    }

    public void setId_Pago(int id_Pago) {
        this.id_Pago = id_Pago;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }
    
    
    
    
    
}
