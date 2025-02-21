package development.team.hoteltransylvania.Model;

public class TypeRoom {
    private int id;
    private String nameType;

    public TypeRoom() {
    }

    public TypeRoom(int id, String nameType) {
        this.id = id;
        this.nameType = nameType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }

    @Override
    public String toString() {
        return "TypeRoom{" +
                "id=" + id +
                ", nameType='" + nameType + '\'' +
                '}';
    }
}
