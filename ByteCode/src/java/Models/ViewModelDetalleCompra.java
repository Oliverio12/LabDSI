package Models;

public class ViewModelDetalleCompra {
    private int id_DetalleCompra;
    private int id_Compra;
    private int cantidad;
    private double precioUnitario;
    private String estadoCompra;
    private double total;

    public ViewModelDetalleCompra() {
    }

    public ViewModelDetalleCompra(int id_DetalleCompra, int id_Compra, int cantidad, double precioUnitario, String estadoCompra, double total) {
        this.id_DetalleCompra = id_DetalleCompra;
        this.id_Compra = id_Compra;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.estadoCompra = estadoCompra;
        this.total = total;
    }

    public int getId_DetalleCompra() {
        return id_DetalleCompra;
    }

    public void setId_DetalleCompra(int id_DetalleCompra) {
        this.id_DetalleCompra = id_DetalleCompra;
    }

    public int getId_Compra() {
        return id_Compra;
    }

    public void setId_Compra(int id_Compra) {
        this.id_Compra = id_Compra;
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

    public String getEstadoCompra() {
        return estadoCompra;
    }

    public void setEstadoCompra(String estadoCompra) {
        this.estadoCompra = estadoCompra;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    
    
}
