package Models;

/**
 * create table Productos.Marca( --Listo
    Id_Marca int primary key identity(1, 1),
    NombreMarca varchar(60) not null
);
*/
public class ViewModelMarca {
    private int id_Marca;
    private String nombreMarca;

    public ViewModelMarca(int id_Marca, String nombreMarca) {
        this.id_Marca = id_Marca;
        this.nombreMarca = nombreMarca;
    }

    public ViewModelMarca() {
    }

    public int getId_Marca() {
        return id_Marca;
    }

    public void setId_Marca(int id_Marca) {
        this.id_Marca = id_Marca;
    }

    public String getNombreMarca() {
        return nombreMarca;
    }

    public void setNombreMarca(String nombreMarca) {
        this.nombreMarca = nombreMarca;
    }
    
    
    
}
