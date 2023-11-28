package Models;

import java.util.Date;

public class ViewModelPagos {
     private int id_Pago;
    private int id_MetodoPago;
    private String metodoPago;
    private double monto;
    private Date fechaPago;

    public ViewModelPagos() {
    }

    public ViewModelPagos(int id_Pago, int id_MetodoPago, String metodoPago,double monto, Date fechaPago) {
        this.id_Pago = id_Pago;
        this.id_MetodoPago = id_MetodoPago;
        this.metodoPago = metodoPago;
        this.monto = monto;
        this.fechaPago = fechaPago;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }
    

    public int getId_Pago() {
        return id_Pago;
    }

    public void setId_Pago(int id_Pago) {
        this.id_Pago = id_Pago;
    }

    public int getId_MetodoPago() {
        return id_MetodoPago;
    }

    public void setId_MetodoPago(int id_MetodoPago) {
        this.id_MetodoPago = id_MetodoPago;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }
    
    
}
