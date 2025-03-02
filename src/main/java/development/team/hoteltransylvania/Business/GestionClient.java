package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.DTO.usersEmployeeDTO;
import development.team.hoteltransylvania.Model.Client;
import development.team.hoteltransylvania.Model.TypeDocument;
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

public class GestionClient {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionClient.class);

    public static List<Client> getAllClients() {
        String sql = "SELECT * FROM clientes";
        List<Client> allClients = new ArrayList<>();

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id_cliente = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String email = rs.getString("email");
                String numDocu = rs.getString("numero_documento");
                String tipoDoc = rs.getString("tipo_documento");
                String telefono = rs.getString("telefono");
                String estado = rs.getString("estado");

                allClients.add(new Client(id_cliente,nombre,telefono,email, TypeDocument.valueOf(tipoDoc),numDocu,estado));
            }

        } catch (SQLException e) {
            LOGGER.severe("Error retrieving clients: " + e.getMessage());
        }

        return allClients;
    }
    public static boolean deleteClient(int clientId) {
        String checkSql = "SELECT COUNT(*) FROM clientes WHERE id = ?";
        String deleteSql = "DELETE FROM clientes WHERE id = ?";

        boolean result = false;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement checkPs = cnn.prepareStatement(checkSql)) {

            checkPs.setInt(1, clientId);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                try (PreparedStatement deletePs = cnn.prepareStatement(deleteSql)) {
                    deletePs.setInt(1, clientId);

                    int rowsAffected = deletePs.executeUpdate();
                    if (rowsAffected > 0) {
                        LOGGER.info("Client with ID " + clientId + " deleted successfully.");
                        result = true;
                    }
                }
            } else {
                LOGGER.warning("Error deleting client. No client found with ID: " + clientId);
            }

        } catch (SQLException e) {
            LOGGER.severe("Error deleting client " + clientId + ": " + e.getMessage());
        }

        return result;
    }
}
