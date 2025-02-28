package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.Model.*;
import development.team.hoteltransylvania.Services.DataBaseUtil;
import development.team.hoteltransylvania.Util.LoggerConfifg;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

    public class GestionUser {
        private static final DataSource dataSource = DataBaseUtil.getDataSource();
        private static final Logger LOGGER = LoggerConfifg.getLogger(development.team.hoteltransylvania.Business.GestionUser.class);

        public static int registerUser(User user) {
            String sql = "INSERT INTO usuarios (username, password, empleado_id, estado) VALUES (?, ?, ?, ?)";
            int usuarioId = -1;

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement ps = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Importante para obtener ID generado

                ps.setString(1, user.getUsername());
                ps.setString(2, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
                ps.setInt(3, user.getEmployee().getId()); // Corregir índice
                ps.setString(4, user.getStatusUser().name()); // Corregir índice

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    LOGGER.info("User " + user.getUsername() + " registered successfully");
                    try (ResultSet rs = ps.getGeneratedKeys()) {
                        if (rs.next()) {
                            usuarioId = rs.getInt(1); // Obtener el ID generado
                        }
                    }
                }
            } catch (SQLException e) {
                LOGGER.warning("Error when registering the user: " + e.getMessage());
            }
            return usuarioId;
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

        public boolean validarCredenciales(String username, String contrasena) {
            String sql = "SELECT password FROM usuarios WHERE username = ?";

            try (Connection con = dataSource.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, username);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return BCrypt.checkpw(contrasena, rs.getString("password"));
                    }
                }
            } catch (SQLException e) {
                System.err.println("Error al validar las credenciales para el usuario: " + username + e.getMessage());
            }
            return false;
        }

        public User obtenerUsuarioSesion(String username) {
            User user = null;
            String sql = "SELECT id, username, empleado_id, estado FROM usuarios WHERE username = ?";

            try (Connection con = dataSource.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, username);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Método para obtener Employee
                        Employee employee = obtenerEmpleadoPorId(rs.getInt("empleado_id"));
                        StatusUser statusUser = StatusUser.valueOf(rs.getString("estado")); // Conversión a enum

                        user = new User(
                                rs.getInt("id"),
                                employee,
                                rs.getString("username"),
                                "***", // No es necesario recuperar la contraseña aquí
                                statusUser
                        );

                        System.out.println("Se validó el usuario: " + user.getUsername());
                    }
                }
            } catch (SQLException e) {
                System.err.println("Error al obtener el usuario: " + e.getMessage());
            }

            return user;
        }

        public Employee obtenerEmpleadoPorId(int empleadoId) {
            String sql = "SELECT id, nombre, rol_id, correo FROM empleados WHERE id = ?";
            Employee employee = null;

            try (Connection cnn = dataSource.getConnection();
                 PreparedStatement ps = cnn.prepareStatement(sql)) {

                ps.setInt(1, empleadoId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        employee = new Employee();
                        employee.setId(rs.getInt("id"));
                        employee.setName(rs.getString("nombre"));
                        employee.setPosition(rs.getInt("rol_id") == 1 ? "Empleado" : "OtroRol");
                        employee.setEmail(rs.getString("correo"));

                    } else {
                        LOGGER.warning("No se encontró ningún empleado con el ID: " + empleadoId);
                    }
                }
            } catch (SQLException e) {
                LOGGER.severe("Error al obtener el empleado con ID " + empleadoId + ": " + e.getMessage());
            }

            return employee;
        }

        public List<User> getAllUsers() {
            String sql = "SELECT id, username, empleado_id, estado FROM usuarios";
            List<User> lista = new ArrayList<>();
            try (Connection con = dataSource.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Employee employee = obtenerEmpleadoPorId(rs.getInt("empleado_id")); // Obtener Employee
                    StatusUser statusUser = StatusUser.valueOf(rs.getString("estado")); // Convertir estado a enum

                    User user = new User(
                            rs.getInt("id"),
                            employee,
                            rs.getString("username"),
                            "***", // No se recupera la contraseña por seguridad
                            statusUser
                    );
                    lista.add(user);
                }
            } catch (SQLException e) {
                System.err.println("Error al listar usuarios: " + e.getMessage());
            }
            return lista;
        }

        public boolean existeUsuario(String username) {
            String sql = "SELECT COUNT(*) FROM usuarios WHERE username = ?";
            boolean existe = false;

            try (Connection con = dataSource.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, username);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        existe = rs.getInt(1) > 0;
                    }
                }
            } catch (SQLException e) {
                System.err.println("Error al verificar si existe el usuario: " + username + " - " + e.getMessage());
            }

            return existe;
        }
    }


