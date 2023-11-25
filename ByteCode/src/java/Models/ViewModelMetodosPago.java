package Models;

public class ViewModelMetodosPago {
    private int idMetodoPago;
    private String metodo;

    public ViewModelMetodosPago() {
    }

    public ViewModelMetodosPago(int idMetodoPago, String metodo) {
        this.idMetodoPago = idMetodoPago;
        this.metodo = metodo;
    }

    public int getIdMetodoPago() {
        return idMetodoPago;
    }

    public void setIdMetodoPago(int idMetodoPago) {
        this.idMetodoPago = idMetodoPago;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }
    

}
