package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.Model.Floor;
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

public class GestionFloor {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionFloor.class);

    public static boolean registerFloor(Floor Floor) {
        String sql = "INSERT INTO pisos (nombre, estatus) VALUES (?,?)";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, Floor.getName());
            ps.setString(2, Floor.getStatus());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Floor " + Floor.getId() + " registered successfully");
                System.out.println("Floor " + Floor.getId() + " registered successfully");
                result = true;
            }
        } catch (SQLException e) {
            LOGGER.warning("Error when registering the Floor: " + e.getMessage());
            System.out.println("Error when registering the Floor: " + e.getMessage());
        }
        return result;
    }
    public static boolean updateFloor(Floor FloorUpdate) {
        String sql = "UPDATE pisos SET nombre = ? WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, FloorUpdate.getName());
            ps.setInt(2, FloorUpdate.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("floor " + FloorUpdate.getId() + " updated successfully.");
                result = true;
            } else {
                LOGGER.warning("Error updating Floor found with ID: " + FloorUpdate.getId());
            }
        } catch (SQLException e) {
            LOGGER.severe("Error updating floor " + FloorUpdate.getId() + ": " + e.getMessage());
        }

        return result;
    }
    public static boolean deleteFloor(int FloorId) {
        String checkSql = "SELECT COUNT(*) FROM pisos WHERE id = ?";
        String deleteSql = "DELETE FROM pisos WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {

            checkPs.setInt(1, FloorId);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                try (PreparedStatement deletePs = cnn.prepareStatement(deleteSql)) {
                    deletePs.setInt(1, FloorId);

                    int rowsAffected = deletePs.executeUpdate();
                    if (rowsAffected > 0) {
                        LOGGER.info("FloorId with ID " + FloorId + " deleted successfully.");
                        result = true;
                    }
                }
            } else {
                LOGGER.warning("Error deleting floor. No floor found with ID: " + FloorId);
            }

        } catch (SQLException e) {
            LOGGER.severe("Error deleting floor " + FloorId + ": " + e.getMessage());
        }

        return result;
    }
    public static List<Floor> getAllFloors() {
        String sql = "SELECT id, nombre, estatus FROM pisos";

        List<Floor> Floors = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String estatus = rs.getString("estatus");

                Floors.add(new Floor(id, nombre,estatus));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Floors: " + e.getMessage());
            System.out.println("Error retrieving Floors: " + e.getMessage());
        }
        return Floors.stream()
                .sorted(Comparator.comparingInt(Floor::getId))
                .collect(Collectors.toList());
    }
    public static List<Floor> getAllFloorsPaginated(int page, int pageSize) {
        String sql = "SELECT id, nombre, estatus FROM pisos " +
                "LIMIT ? OFFSET ?";;

        List<Floor> Floors = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, pageSize);
            ps.setInt(2, (page - 1) * pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String estatus = rs.getString("estatus");

                Floors.add(new Floor(id, nombre,estatus));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Floors: " + e.getMessage());
            System.out.println("Error retrieving Floors: " + e.getMessage());
        }
        return Floors.stream()
                .sorted(Comparator.comparingInt(Floor::getId))
                .collect(Collectors.toList());
    }
    public static List<Floor> filterFloors(String nombre, String estado, int page, int size) {
        List<Floor> allFloors = getAllFloors(); // Obtiene todos los registros

        String estadoLower = estado.toLowerCase().trim();
        String nombreLower = nombre.toLowerCase().trim();

        List<Floor> filteredFloors = allFloors.stream()
                .filter(floor ->
                        (nombreLower.isEmpty() || floor.getName().toLowerCase().contains(nombreLower)) &&
                                (estadoLower.isEmpty() || floor.getStatus().equalsIgnoreCase(estadoLower))
                )
                .collect(Collectors.toList());

        // Paginación: calcular desde qué índice empezar y hasta dónde llegar
        int fromIndex = (page - 1) * size;
        int toIndex = Math.min(fromIndex + size, filteredFloors.size());

        return filteredFloors.subList(fromIndex, toIndex);
    }
    public static int countFilteredFloors(String nombre, String estado) {
        List<Floor> allFloors = getAllFloors();

        String estadoLower = estado.toLowerCase().trim();
        String nombreLower = nombre.toLowerCase().trim();

        return (int) allFloors.stream()
                .filter(floor ->
                        (nombreLower.isEmpty() || floor.getName().toLowerCase().contains(nombreLower)) &&
                                (estadoLower.isEmpty() || floor.getStatus().equalsIgnoreCase(estadoLower))
                ).count();
    }

    public static int getTotalFloors() {
        String sql = "SELECT COUNT(*) FROM pisos";
        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            LOGGER.severe("Error counting Floors: " + e.getMessage());
        }
        return 0;
    }

    public static List<Floor> getFloorsPaginated(int page, int pageSize) {
        String sql = "SELECT th.id, th.nombre, th.estatus " +
                "FROM pisos th " +
                "ORDER BY th.id ASC " +
                "LIMIT ? OFFSET ?";

        List<Floor> Floors = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, (page - 1) * pageSize); // OFFSET = (página - 1) * tamaño

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("nombre");
                String estatus = rs.getString("estatus");

                Floors.add(new Floor(id, name,estatus));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Floors: " + e.getMessage());
            System.out.println("Error retrieving Floors: " + e.getMessage());
        }

        return Floors;
    }
    public static Floor getFloorById(int idFloor) {
        String sql = "SELECT * FROM pisos WHERE id = ?";
        Floor Floor = null;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setInt(1, idFloor);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int PisoId = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    String estatus = rs.getString("estatus");
                    Floor = new Floor(PisoId, nombre, estatus);
                }
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving Floor: " + e.getMessage());
        }

        return Floor;
    }

    public static void updateStatus(int idFloor, String estado) {
        String sql = "UPDATE pisos SET estatus = ? WHERE id = ?";

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, estado);
            ps.setInt(2, idFloor);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Floor " + idFloor + " updated status successfully.");
            } else {
                LOGGER.warning("Error updating Floor. No user found with ID: " + idFloor);
            }
        } catch (SQLException e) {
            LOGGER.severe("Error updating Floor " + idFloor + ": " + e.getMessage());
        }
    }

    public static List<Floor> filterFloor(String nombre) {
        List<Floor> allFloors = getAllFloors(); // Obtiene todos los Pisos una sola vez

        if (nombre == null || nombre.trim().isEmpty()) {
            System.out.println("Lista completa de Pisos retornada: " + allFloors);
            return allFloors;
        }

        String nombreLower = nombre.toLowerCase(); // Convertir el criterio de búsqueda a minúsculas

        List<Floor> filteredFloors = allFloors.stream()
                .filter(Floor -> Floor.getName().toLowerCase().contains(nombreLower))
                .collect(Collectors.toList());

        System.out.println("Empleados filtrados: " + filteredFloors);
        return filteredFloors;
    }
}


