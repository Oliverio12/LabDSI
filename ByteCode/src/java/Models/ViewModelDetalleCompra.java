package Models;

public class ViewModelDetalleCompra {
    private int id_DetalleCompra;
    private int id_Compra;
    private String compra;
    private int cantidad;
    private double precioUnitario;
    private String estadoCompra;
    private double total;

    public ViewModelDetalleCompra() {
    }

    public ViewModelDetalleCompra(int id_DetalleCompra, int id_Compra, String compra, int cantidad, double precioUnitario, String estadoCompra, double total) {
        this.id_DetalleCompra = id_DetalleCompra;
        this.id_Compra = id_Compra;
        this.compra = compra;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.estadoCompra = estadoCompra;
        this.total = total;
    }

    public String getCompra() {
        return compra;
    }

    public void setCompra(String compra) {
        this.compra = compra;
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
