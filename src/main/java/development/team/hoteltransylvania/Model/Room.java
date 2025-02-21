package development.team.hoteltransylvania.Model;

public class Room {
    private int id;
    private String number;
    private TypeRoom typeRoom;
    private StatusRoom statusRoom;
    private double price;

    public Room() {
    }

    public Room(double price, StatusRoom statusRoom, TypeRoom typeRoom, String number, int id) {
        this.price = price;
        this.statusRoom = statusRoom;
        this.typeRoom = typeRoom;
        this.number = number;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public TypeRoom getTypeRoom() {
        return typeRoom;
    }

    public void setTypeRoom(TypeRoom typeRoom) {
        this.typeRoom = typeRoom;
    }

    public StatusRoom getStatusRoom() {
        return statusRoom;
    }

    public void setStatusRoom(StatusRoom statusRoom) {
        this.statusRoom = statusRoom;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", typeRoom=" + typeRoom +
                ", statusRoom=" + statusRoom +
                ", price=" + price +
                '}';
    }
}
