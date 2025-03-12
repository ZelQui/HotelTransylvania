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

public class GestionTypeRoom {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionRoom.class);

    public static boolean registerTypeRoom(TypeRoom typeRoom) {
        String sql = "INSERT INTO tipo_habitacion (id, nombre) VALUES (?,?)";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, typeRoom.getId());
            ps.setString(2, typeRoom.getName());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("TypeRoom " + typeRoom.getId() + " registered successfully");
                result = true;
            }
        } catch (SQLException e) {
            LOGGER.warning("Error when registering the TypeRoom: " + e.getMessage());
        }
        return result;
    }
    public static boolean updateTypeRoom(TypeRoom TypeRoomUpdate) {
        String sql = "UPDATE tipo_habitacion SET nombre = ? WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, TypeRoomUpdate.getName());
            ps.setInt(2, TypeRoomUpdate.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Room " + TypeRoomUpdate.getId() + " updated successfully.");
                result = true;
            } else {
                LOGGER.warning("Error updating TypeRoom found with ID: " + TypeRoomUpdate.getId());
            }
        } catch (SQLException e) {
            LOGGER.severe("Error updating Room " + TypeRoomUpdate.getId() + ": " + e.getMessage());
        }

        return result;
    }
    public static boolean deleteTypeRoom(int TypeRoomId) {
        String checkSql = "SELECT COUNT(*) FROM tipo_habitacion WHERE id = ?";
        String deleteSql = "DELETE FROM tipo_habitacion WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {

            checkPs.setInt(1, TypeRoomId);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                try (PreparedStatement deletePs = cnn.prepareStatement(deleteSql)) {
                    deletePs.setInt(1, TypeRoomId);

                    int rowsAffected = deletePs.executeUpdate();
                    if (rowsAffected > 0) {
                        LOGGER.info("TypeRoomId with ID " + TypeRoomId + " deleted successfully.");
                        result = true;
                    }
                }
            } else {
                LOGGER.warning("Error deleting Room. No Room found with ID: " + TypeRoomId);
            }

        } catch (SQLException e) {
            LOGGER.severe("Error deleting Room " + TypeRoomId + ": " + e.getMessage());
        }

        return result;
    }
    public static List<TypeRoom> getAllTypeRooms() {
        String sql = "SELECT id, nombre FROM tipo_habitacion";

        List<TypeRoom> typeRooms = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");

                typeRooms.add(new TypeRoom(id, nombre));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving TypeRooms: " + e.getMessage());
        }
        return typeRooms.stream()
                .sorted(Comparator.comparingInt(TypeRoom::getId))
                .collect(Collectors.toList());
    }

    public static int getTotalTypeRooms() {
        String sql = "SELECT COUNT(*) FROM tipo_habitacion";
        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            LOGGER.severe("Error counting TypeRooms: " + e.getMessage());
        }
        return 0;
    }

    public static List<TypeRoom> getTypeRoomsPaginated(int page, int pageSize) {
        String sql = "SELECT th.id, th.nombre " +
                "FROM tipo_habitacion th " +
                "ORDER BY th.id ASC " +
                "LIMIT ? OFFSET ?";

        List<TypeRoom> typeRooms = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, (page - 1) * pageSize); // OFFSET = (página - 1) * tamaño

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("nombre");

                typeRooms.add(new TypeRoom(id, name));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving TypeRooms: " + e.getMessage());
        }

        return typeRooms;
    }
}


