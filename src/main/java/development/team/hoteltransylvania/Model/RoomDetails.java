package development.team.hoteltransylvania.Model;

public class RoomDetails {
    private int id;
    private Reservation reservation;
    private Room room;

    public RoomDetails(int id, Reservation reservation, Room room) {
        this.id = id;
        this.reservation = reservation;
        this.room = room;
    }

    public RoomDetails() {
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

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "RoomDetails{" +
                "id=" + id +
                ", reservation=" + reservation +
                ", room=" + room +
                '}';
    }
}
