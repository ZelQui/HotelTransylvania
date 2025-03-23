package development.team.hoteltransylvania.Model;

import java.sql.Date;

public class Reservation {
    private int id;
    private Client client;
    private Employee employee;
    private Date fechaInicio;
    private Date fechaFin;
    private StatusReservation statusReservation;
    private double dsct;
    private double cobro_extra;
    private double adelanto;

    public Reservation() {
    }

    public Reservation(int id, Client client, Employee employee, Date fechaInicio, Date fechaFin, StatusReservation statusReservation, double dsct, double cobro_extra, double adelanto) {
        this.id = id;
        this.client = client;
        this.employee = employee;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.statusReservation = statusReservation;
        this.dsct = dsct;
        this.cobro_extra = cobro_extra;
        this.adelanto = adelanto;
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

    public double getDsct() {
        return dsct;
    }

    public void setDsct(double dsct) {
        this.dsct = dsct;
    }

    public double getCobro_extra() {
        return cobro_extra;
    }

    public void setCobro_extra(double cobro_extra) {
        this.cobro_extra = cobro_extra;
    }

    public double getAdelanto() {
        return adelanto;
    }

    public void setAdelanto(double adelanto) {
        this.adelanto = adelanto;
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
                ", dsct=" + dsct +
                ", cobro_extra=" + cobro_extra +
                ", adelanto=" + adelanto +
                '}';
    }
}
