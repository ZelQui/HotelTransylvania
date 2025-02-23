package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.Model.Employee;
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

public class GestionEmployee {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionEmployee.class);

    public static boolean registerEmployee(Employee employee) {
        String sql = "INSERT INTO empleados (nombre, cargo) VALUES (?, ?)";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, employee.getName());
            ps.setString(2, employee.getPosition());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Employee " + employee.getName() + " registered successfully");
                result = true;
            }
        } catch (SQLException e) {
            LOGGER.warning("Error when registering the employee: " + e.getMessage());
        }
        return result;
    }
    public static boolean updateEmployee(Employee newEmployee) {
        String sql = "UPDATE empleados SET nombre = ?, cargo = ? WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, newEmployee.getName());
            ps.setString(2, newEmployee.getPosition());
            ps.setInt(3, newEmployee.getId()); // Se asume que `id` es un atributo de `Employee`

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
    public static List<Employee> getAllEmployees() {
        String sql = "SELECT * FROM empleados";
        List<Employee> employees = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("nombre");
                String position = rs.getString("cargo");

                employees.add(new Employee(id, name, position));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving employees: " + e.getMessage());
        }

        return employees;
    }

}
