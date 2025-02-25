package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.Model.Room;
import development.team.hoteltransylvania.Model.StatusRoom;
import development.team.hoteltransylvania.Model.TypeRoom;
import development.team.hoteltransylvania.Services.DataBaseUtil;
import development.team.hoteltransylvania.Util.LoggerConfifg;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class GestionRoom {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionRoom.class);

    public static boolean registerRoom(Room Room) {
        String sql = "INSERT INTO habitaciones (numero, tipo_id, estado_id, precio) VALUES (?, ?,?,?)";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, Room.getNumber());
            ps.setInt(2, Room.getTypeRoom().getId());
            //AQUI SE DEBE CAMBIAR PORQUE ESTADO EN BD ES INTEGER
            ps.setString(3, String.valueOf(Room.getStatusRoom().getDeclaringClass()));
            ps.setDouble(4, Room.getPrice());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Room " + Room.getNumber() + " registered successfully");
                result = true;
            }
        } catch (SQLException e) {
            LOGGER.warning("Error when registering the Room: " + e.getMessage());
        }
        return result;
    }
    public static boolean updateRoom(Room newRoom) {
        String sql = "UPDATE habitaciones SET numero = ?, precio = ? WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, newRoom.getNumber());
            ps.setDouble(2, newRoom.getPrice());
            ps.setInt(3, newRoom.getId()); // Se asume que `id` es un atributo de `Room`

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Room " + newRoom.getId() + " updated successfully.");
                result = true;
            } else {
                LOGGER.warning("Error updating Room. No Room found with ID: " + newRoom.getId());
            }
        } catch (SQLException e) {
            LOGGER.severe("Error updating Room " + newRoom.getId() + ": " + e.getMessage());
        }

        return result;
    }
    public static boolean deleteRoom(int RoomId) {
        String checkSql = "SELECT COUNT(*) FROM habitaciones WHERE id = ?";
        String deleteSql = "DELETE FROM habitaciones WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {

            checkPs.setInt(1, RoomId);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                try (PreparedStatement deletePs = cnn.prepareStatement(deleteSql)) {
                    deletePs.setInt(1, RoomId);

                    int rowsAffected = deletePs.executeUpdate();
                    if (rowsAffected > 0) {
                        LOGGER.info("Room with ID " + RoomId + " deleted successfully.");
                        result = true;
                    }
                }
            } else {
                LOGGER.warning("Error deleting Room. No Room found with ID: " + RoomId);
            }

        } catch (SQLException e) {
            LOGGER.severe("Error deleting Room " + RoomId + ": " + e.getMessage());
        }

        return result;
    }
    public static List<Room> getAllRooms() {

        String sql = "SELECT h.id, h.numero, h.tipo_id, h.estado_id, h.precio, t.tipo " +
                "FROM habitaciones h " +
                "JOIN tipo_habitacion t ON h.tipo_id = t.id";
        List<Room> Rooms = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String number = rs.getString("numero");
                int tipoId = rs.getInt("tipo_id");
                int estadoId = rs.getInt("estado_id");
                double price = rs.getDouble("precio");
                String nameType = rs.getString("nameType");  // Obtener el nombre del tipo de habitación

                TypeRoom typeRoom = new TypeRoom(tipoId, nameType);  // Crear objeto TypeRoom
                StatusRoom statusRoom = getStatusRoomById(estadoId); // Método seguro para convertir el ID

                Rooms.add(new Room(id, number, typeRoom, statusRoom, price));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Rooms: " + e.getMessage());
        }

        return Rooms;
    }

    // Método para convertir estadoId en StatusRoom de manera segura
    public static StatusRoom getStatusRoomById(int id) {
        StatusRoom[] statuses = StatusRoom.values();
        if (id >= 0 && id < statuses.length) {
            return statuses[id];
        }
        throw new IllegalArgumentException("ID de estado no válido: " + id);
    }

}

