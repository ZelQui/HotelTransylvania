package development.team.hoteltransylvania.Model;

import java.sql.Date;

public class Reservation {
    private int id;
    private Client client;
    private Employee employee;
    private Date fechaInicio;
    private Date fechaFin;
    private StatusReservation statusReservation;
    private double total;

    public Reservation() {
    }

    public Reservation(int id, Client client, Employee employee, Date fechaInicio, Date fechaFin, StatusReservation statusReservation, double total) {
        this.id = id;
        this.client = client;
        this.employee = employee;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.statusReservation = statusReservation;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public StatusReservation getStatusReservation() {
        return statusReservation;
    }

    public void setStatusReservation(StatusReservation statusReservation) {
        this.statusReservation = statusReservation;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", client=" + client +
                ", employee=" + employee +
                ", fechaInicio=" + fechaInicio +
                ", fechaFin=" + fechaFin +
                ", statusReservation=" + statusReservation +
                ", total=" + total +
                '}';
    }
}
