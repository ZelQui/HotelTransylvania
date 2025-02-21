package development.team.hoteltransylvania.Model;

import java.time.LocalDate;

public class Checkout {
    private int id;
    private Reservation reservation;
    private LocalDate date_checkout;

    public Checkout(int id, Reservation reservation, LocalDate date_checkout) {
        this.id = id;
        this.reservation = reservation;
        this.date_checkout = date_checkout;
    }

    public Checkout() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public LocalDate getDate_checkout() {
        return date_checkout;
    }

    public void setDate_checkout(LocalDate date_checkout) {
        this.date_checkout = date_checkout;
    }

    @Override
    public String toString() {
        return "Checkout{" +
                "id=" + id +
                ", reservation=" + reservation +
                ", date_checkout=" + date_checkout +
                '}';
    }
}

