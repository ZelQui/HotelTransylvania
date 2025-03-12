package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.Model.*;
import development.team.hoteltransylvania.Services.DataBaseUtil;
import development.team.hoteltransylvania.Util.LoggerConfifg;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class GestionRoom {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionRoom.class);

    public static boolean registerRoom(Room Room) {
        String sql = "INSERT INTO habitaciones (numero, tipo_id, estado_id, precio, piso_id) VALUES (?,?,?,?,?)";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, Room.getNumber());
            ps.setInt(2, Room.getTypeRoom().getId());
            ps.setInt(3, Room.getStatusRoom().getValue());
            ps.setDouble(4, Room.getPrice());
            ps.setInt(5, Room.getFloor());

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
    public static boolean updateRoom(Room roomUpdate) {
        String sql = "UPDATE habitaciones SET numero = ?, tipo_id = ?, estado_id = ?, precio = ? WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, roomUpdate.getNumber());
            ps.setDouble(2, roomUpdate.getTypeRoom().getId());
            ps.setInt(3, roomUpdate.getStatusRoom().getValue());
            ps.setDouble(4, roomUpdate.getPrice());
            ps.setInt(5, roomUpdate.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Room " + roomUpdate.getId() + " updated successfully.");
                result = true;
            } else {
                LOGGER.warning("Error updating Room. No Room found with ID: " + roomUpdate.getId());
            }
        } catch (SQLException e) {
            LOGGER.severe("Error updating Room " + roomUpdate.getId() + ": " + e.getMessage());
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
        String sql = "SELECT " +
                "    h.id, " +
                "    h.numero, " +
                "    h.piso_id, " +
                "    p.nombre AS nombre_piso, " +
                "    h.tipo_id, " +
                "    t.nombre AS tipo_nombre, t.estatus AS estado_tipo, " +
                "    h.precio, " +
                "    h.estado_id, " +
                "    e.estado AS estado_nombre " +
                "FROM habitaciones h " +
                "JOIN tipo_habitacion t ON h.tipo_id = t.id " +
                "JOIN estado_habitacion e ON h.estado_id = e.id " +
                "JOIN pisos p ON p.id = h.piso_id ";  // Paginación aplicada

        List<Room> rooms = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String number = rs.getString("numero");
                int typeId = rs.getInt("tipo_id");
                String typeName = rs.getString("tipo_nombre");
                String statusTypeRoom = rs.getString("estado_tipo");
                int statusId = rs.getInt("estado_id");
                double price = rs.getDouble("precio");
                int floorId = rs.getInt("piso_id");

                // Se obtiene el enum directamente por ID
                StatusRoom statusRoom = StatusRoom.fromId(statusId);

                // Se crea el objeto TypeRoom directamente sin consulta extra
                TypeRoom typeRoom = new TypeRoom(typeId, typeName, statusTypeRoom);

                rooms.add(new Room(id, number, typeRoom, statusRoom, price, floorId));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Rooms: " + e.getMessage());
        }

        return rooms.stream()
                .sorted(Comparator.comparing((Room room) -> Integer.parseInt(room.getNumber())))
                .collect(Collectors.toList());
    }
    public static List<Room> getRoomsPaginated(int page, int pageSize) {
        String sql = "SELECT " +
                "    h.id, " +
                "    h.numero, " +
                "    h.piso_id, " +
                "    p.nombre AS nombre_piso, " +
                "    h.tipo_id, " +
                "    t.nombre AS tipo_nombre, t.estatus AS estado_tipo, " +
                "    h.precio, " +
                "    h.estado_id, " +
                "    e.estado AS estado_nombre " +
                "FROM habitaciones h " +
                "JOIN tipo_habitacion t ON h.tipo_id = t.id " +
                "JOIN estado_habitacion e ON h.estado_id = e.id " +
                "JOIN pisos p ON p.id = h.piso_id " +
                "ORDER BY h.numero ASC " +
                "LIMIT ? OFFSET ?";

        List<Room> rooms = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, pageSize);
            ps.setInt(2, (page - 1) * pageSize); // OFFSET = (página - 1) * tamaño

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String number = rs.getString("numero");
                int typeId = rs.getInt("tipo_id");
                String typeName = rs.getString("tipo_nombre");
                String statusTypeR = rs.getString("estado_tipo");
                int statusId = rs.getInt("estado_id");
                double price = rs.getDouble("precio");
                int floorId = rs.getInt("piso_id");

                StatusRoom statusRoom = StatusRoom.fromId(statusId);
                TypeRoom typeRoom = new TypeRoom(typeId, typeName, statusTypeR);

                rooms.add(new Room(id, number, typeRoom, statusRoom, price, floorId));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Rooms: " + e.getMessage());
            System.out.println("Error retrieving Rooms: " + e.getMessage());
        }

        return rooms;
    }
    public static int getTotalRooms() {
        String sql = "SELECT COUNT(*) FROM habitaciones";
        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            LOGGER.severe("Error counting Rooms: " + e.getMessage());
            System.out.println("Error counting Rooms: " + e.getMessage());
        }
        return 0;
    }



    /*public static TypeRoom getTypeRoom(String nombre) {
        try {
            return TypeRoom.valueOf(nombre.toLowerCase());
        } catch (IllegalArgumentException e) {
            LOGGER.severe("Error: TypeRoom no válido -> '" + nombre + "'");
            return null; // Manejar errores adecuadamente
        }
    }*/
    public static StatusRoom getStatusRoom(String nombre) {
        try {
            return StatusRoom.valueOf(nombre.toLowerCase());
        } catch (IllegalArgumentException e) {
            LOGGER.severe("Error: StatusRoom no válido -> '" + nombre + "'");
            return null;
        }
    }
    public static TypeRoom getTypeRoomById(int idType) {
        String sql = "SELECT * FROM tipo_habitacion WHERE id = ?";
        TypeRoom typeRoom = null;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, idType);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int tipoId = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    String estatus = rs.getString("estatus");
                    typeRoom = new TypeRoom(tipoId, nombre, estatus);
                }
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving TypeRoom: " + e.getMessage());
        }

        return typeRoom;
    }
    public static Room getRoomById(int roomId) {
        String sql = "SELECT h.id, h.numero, h.tipo_id, h.piso_id, h.precio, h.estado_id, " +
                "t.nombre AS tipo_nombre, t.estatus AS estado_tipo " +
                "FROM habitaciones h " +
                "JOIN tipo_habitacion t ON h.tipo_id = t.id " +
                "WHERE h.id = ?;";
        Room room = null;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, roomId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String number = rs.getString("numero");
                int typeId = rs.getInt("tipo_id");
                String typeName = rs.getString("tipo_nombre");
                String estadoType = rs.getString("estado_tipo");
                int statusId = rs.getInt("estado_id");
                double price = rs.getDouble("precio");
                int floorId = rs.getInt("piso_id");

                StatusRoom statusRoom = StatusRoom.fromId(statusId);
                TypeRoom typeRoom = new TypeRoom(typeId, typeName, estadoType);

                room = new Room(id, number, typeRoom, statusRoom, price, floorId);
            }
        } catch (SQLException e) {
            LOGGER.severe("Error retrieving product with ID " + roomId + ": " + e.getMessage());
        }

        return room;
    }

    public static List<Room> filterRooms(String nombre) {
        if (nombre == null || nombre.isEmpty()) {
            return getAllRooms();
        }

        return getAllRooms().stream()
                .filter(room -> room.getNumber().contains(nombre))
                .collect(Collectors.toList());
    }

    public static int quantityFloors(){
        String sql = "SELECT COUNT(*) FROM pisos";
        int count = 0;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1); // Obtener el resultado del conteo
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }
}

