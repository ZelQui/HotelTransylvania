package development.team.hoteltransylvania.Model;

public class Product {
    private int id;
    private String name;
    private Double price;

    public Product() {
    }

    public Product(Double price, String name, int id) {
        this.price = price;
        this.name = name;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Producto{" + "ID=" + id + ", Nombre='" + name + ", Precio= S/ " + price + "}";
    }
}
