package Models;

public class ViewModelCargo {
    private int id_Cargo;
    private String cargo;

    public ViewModelCargo(int id_Cargo, String cargo) {
        this.id_Cargo = id_Cargo;
        this.cargo = cargo;
    }

    public ViewModelCargo() {
    }

    public int getId_Cargo() {
        return id_Cargo;
    }

    public void setId_Cargo(int id_Cargo) {
        this.id_Cargo = id_Cargo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    
    
    
}
