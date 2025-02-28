package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.DTO.usersEmployeeDTO;
import development.team.hoteltransylvania.Model.Employee;
import development.team.hoteltransylvania.Services.DataBaseUtil;
import development.team.hoteltransylvania.Util.LoggerConfifg;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class GestionEmployee {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionEmployee.class);

    public static int registerEmployee(Employee employee) {
        String sql = "INSERT INTO empleados (nombre, rol_id, correo) VALUES (?, ?, ?)";
        int empleadoId = -1;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Permite obtener el ID generado

            ps.setString(1, employee.getName());
            ps.setInt(2, 1); // Se mantiene el valor 1 para rol_id
            ps.setString(3, employee.getEmail());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Employee " + employee.getName() + " registered successfully");
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        empleadoId = rs.getInt(1); // Obtener el ID generado
                    }
                }
            }
        } catch (SQLException e) {
            LOGGER.warning("Error when registering the employee: " + e.getMessage());
        }
        return empleadoId;
    }
    public static boolean updateEmployee(Employee newEmployee) {
        String sql = "UPDATE empleados SET nombre = ?, rol_id = ? , correo = ? WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, newEmployee.getName());
            ps.setString(2, newEmployee.getPosition());
            ps.setString(3, newEmployee.getEmail());
            ps.setInt(4, newEmployee.getId()); // Se asume que `id` es un atributo de `Employee`

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Employee " + newEmployee.getId() + " updated successfully.");
                result = true;
            } else {
                LOGGER.warning("Error updating employee. No employee found with ID: " + newEmployee.getId());
            }
        } catch (SQLException e) {
            LOGGER.severe("Error updating employee " + newEmployee.getId() + ": " + e.getMessage());
        }

        return result;
    }
    public static boolean deleteEmployee(int employeeId) {
        String checkSql = "SELECT COUNT(*) FROM empleados WHERE id = ?";
        String deleteSql = "DELETE FROM empleados WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {

            checkPs.setInt(1, employeeId);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                try (PreparedStatement deletePs = cnn.prepareStatement(deleteSql)) {
                    deletePs.setInt(1, employeeId);

                    int rowsAffected = deletePs.executeUpdate();
                    if (rowsAffected > 0) {
                        LOGGER.info("Employee with ID " + employeeId + " deleted successfully.");
                        result = true;
                    }
                }
            } else {
                LOGGER.warning("Error deleting employee. No employee found with ID: " + employeeId);
            }

        } catch (SQLException e) {
            LOGGER.severe("Error deleting employee " + employeeId + ": " + e.getMessage());
        }

        return result;
    }
    public static List<usersEmployeeDTO> getAllEmployees() {
        String sql = "SELECT e.id AS id_empleado, r.id AS id_usuario, e.nombre, u.username AS nombre_usuario, " +
                "e.correo, r.nombre AS tipo, u.estado " +
                "FROM empleados as e " +
                "JOIN usuarios AS u ON u.empleado_id=e.id " +
                "JOIN roles AS r ON e.rol_id=r.id";
        List<usersEmployeeDTO> allEmployees = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id_empleado = rs.getInt("id_empleado");
                int id_usuario = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String nombre_usuario = rs.getString("nombre_usuario");
                String email = rs.getString("correo");
                String tipo = rs.getString("tipo");
                String estado = rs.getString("estado");

                allEmployees.add(new usersEmployeeDTO(id_empleado,id_usuario,nombre,nombre_usuario,email,tipo,estado));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving employees: " + e.getMessage());
        }

        return allEmployees;
    }

}
