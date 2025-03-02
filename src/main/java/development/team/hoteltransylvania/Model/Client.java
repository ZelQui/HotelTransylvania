package development.team.hoteltransylvania.Model;

public class Client {
    private int id;
    private String name;
    private String telephone;
    private String email;
    private TypeDocument typeDocument;
    private String numberDocument;
    private String estatus;

    public Client(int id, String name, String telephone, String email, TypeDocument typeDocument, String numberDocument, String estatus) {
        this.id = id;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.typeDocument = typeDocument;
        this.numberDocument = numberDocument;
        this.estatus = estatus;
    }

    public Client() {
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

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public TypeDocument getTypeDocument() {
        return typeDocument;
    }

    public void setTypeDocument(TypeDocument typeDocument) {
        this.typeDocument = typeDocument;
    }

    public String getNumberDocument() {
        return numberDocument;
    }

    public void setNumberDocument(String numberDocument) {
        this.numberDocument = numberDocument;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", typeDocument=" + typeDocument +
                ", numberDocument='" + numberDocument + '\'' +
                ", estatus='" + estatus + '\'' +
                '}';
    }
}
