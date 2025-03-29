package development.team.hoteltransylvania.Business;

import development.team.hoteltransylvania.DTO.TableReservationDTO;
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
import java.util.Comparator;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class GestionReservation {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();
    private static final Logger LOGGER = LoggerConfifg.getLogger(GestionReservation.class);

    public static List<TableReservationDTO> getReservationPaginated(int page, int pageSize) {
        //TODO: FALTA LOGICA
        /*SELECT cl.id AS id_cliente, cl.nombre, cl.tipo_documento, cl.numero_documento,
                h.id AS id_habitacion, h.numero, th.nombre, r.fecha_inicio, r.fecha_fin,
                er.estado
        FROM reservas r
        INNER JOIN estado_reserva er ON er.id=r.estado_id
        INNER JOIN clientes cl ON r.cliente_id=cl.id
        INNER JOIN detalle_habitacion dh ON dh.reserva_id=r.id
        INNER JOIN habitaciones h ON h.id=dh.habitacion_id
        INNER JOIN tipo_habitacion th ON th.id=h.tipo_id
        WHERE r.id=2*/
        return null;
    }
}
