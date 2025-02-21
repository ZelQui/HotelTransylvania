package development.team.hoteltransylvania.Model;

public class User {
    private int id;
    private Employee employee;
    private String username;
    private String password;

    public User() {
    }

    public User(int id, Employee employee, String username, String password) {
        this.id = id;
        this.employee = employee;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", employee=" + employee +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
