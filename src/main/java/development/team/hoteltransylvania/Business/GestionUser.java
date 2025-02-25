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
import java.util.List;
import java.util.logging.Logger;

    public class GestionUser {
        private static final DataSource dataSource = DataBaseUtil.getDataSource();
        private static final Logger LOGGER = LoggerConfifg.getLogger(development.team.hoteltransylvania.Business.GestionUser.class);

        public static boolean registerUser(User user) {
            String sql = "INSERT INTO usuarios (username, password, empleado_id, estado) VALUES (?, ?,?,?)";

            boolean result = false;

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement ps = cnn.prepareStatement(sql)) {

                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                ps.setInt(4, user.getEmployee().getId());
                ps.setString(4, user.getStatusUser().name());

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    LOGGER.info("user " + user.getUsername() + " registered successfully");
                    result = true;
                }
            } catch (SQLException e) {
                LOGGER.warning("Error when registering the user: " + e.getMessage());
            }
            return result;
        }
        public static boolean updateUserEmployee(User newUser) {
            String sql = "UPDATE usuarios SET empleado_id = ? WHERE id = ?";

            boolean result = false;

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement ps = cnn.prepareStatement(sql)) {

                ps.setInt(1, newUser.getEmployee().getId());

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    LOGGER.info("user " + newUser.getId() + " updated successfully.");
                    result = true;
                } else {
                    LOGGER.warning("Error updating user. No user found with ID: " + newUser.getId());
                }
            } catch (SQLException e) {
                LOGGER.severe("Error updating user " + newUser.getId() + ": " + e.getMessage());
            }

            return result;
        }
        public static boolean updateUserPassword(User user, String newPassword) {
            String sql = "UPDATE usuarios SET password = ? WHERE id = ?";

            boolean result = false;

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement ps = cnn.prepareStatement(sql)) {

                ps.setString(1, newPassword);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    LOGGER.info("user " + user.getId() + " updated successfully.");
                    result = true;
                } else {
                    LOGGER.warning("Error updating user. No user found with ID: " + user.getId());
                }
            } catch (SQLException e) {
                LOGGER.severe("Error updating user " + user.getId() + ": " + e.getMessage());
            }

            return result;
        }

        public static boolean deleteuser(int userId) {
            String checkSql = "SELECT COUNT(*) FROM usuarios WHERE id = ?";
            String deleteSql = "DELETE FROM usuarios WHERE id = ?";

            boolean result = false;

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {

                checkPs.setInt(1, userId);
                ResultSet rs = checkPs.executeQuery();

                if (rs.next() && rs.getInt(1) > 0) {
                    try (PreparedStatement deletePs = cnn.prepareStatement(deleteSql)) {
                        deletePs.setInt(1, userId);

                        int rowsAffected = deletePs.executeUpdate();
                        if (rowsAffected > 0) {
                            LOGGER.info("user with ID " + userId + " deleted successfully.");
                            result = true;
                        }
                    }
                } else {
                    LOGGER.warning("Error deleting user. No user found with ID: " + userId);
                }

            } catch (SQLException e) {
                LOGGER.severe("Error deleting user " + userId + ": " + e.getMessage());
            }

            return result;
        }
        public static List<User> getAllusers() {

            String sql = "SELECT u.id , u.username, u.empleado_id, u.estado" +
                    "FROM usuarios as u" +
                    "JOIN empleados AS e ON u.empleado_id = e.id";
            List<User> users = new ArrayList<>();

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement ps = cnn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    int empleadoId = rs.getInt("empleado_id");
                    String estado = rs.getString("estado");

                    Employee employee = new Employee();
                    employee.setId(empleadoId);

                    StatusUser statusUser = getStatusUser(estado); // Método seguro para convertir el ID

                    users.add(new User(id, employee, username, "***", statusUser));
                }

            } catch (SQLException e) {
                LOGGER.severe("Error retrieving users: " + e.getMessage());
            }

            return users;
        }

        // Método para convertir estadoId en StatusRoom de manera segura
        public static StatusUser getStatusUser(String estado) {
            try {
                return StatusUser.valueOf(estado.toUpperCase()); // Convierte a mayúsculas para evitar problemas de coincidencia
            } catch (IllegalArgumentException e) {
                LOGGER.warning("Estado no válido: " + estado);
                return StatusUser.DEFAULT; // Un estado por defecto en caso de error
            }
        }
    }


