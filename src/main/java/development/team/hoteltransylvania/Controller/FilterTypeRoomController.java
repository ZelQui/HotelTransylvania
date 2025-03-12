package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Business.GestionEmployee;
import development.team.hoteltransylvania.Business.GestionTypeRoom;
import development.team.hoteltransylvania.DTO.usersEmployeeDTO;
import development.team.hoteltransylvania.Model.TypeRoom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "filterTypeRoomServlet", urlPatterns = {"/filterTypeRoomServlet"})
public class FilterTypeRoomController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String filter = req.getParameter("filter");
            List<TypeRoom> typeRooms = GestionTypeRoom.filterTypeRoom(filter);
            int count = 1;
            for (TypeRoom typeRoom : typeRooms) {
                out.println("<tr>");
                out.println("    <td>" + count + "</td>");
                out.println("    <td>" + typeRoom.getName() + "</td>");
                out.println("    <td>Activo</td>");
                out.println("    <td class='d-flex justify-content-center gap-1'>");
                // Botón de edición
                out.println("        <button class='btn btn-warning btn-sm' data-bs-toggle='modal' data-bs-target='#modalEditarTipo' onclick='editarTypeRoom(" + typeRoom.getId() + ")'>✏️</button>");

                // Botón de activación/desactivación con formulario
                if (typeRoom.getStatus().equals("Activo")) {
                    out.println("        <form action='typeroomcontroller' method='post'>");
                    out.println("            <input type='hidden' name='idType' value='" + typeRoom.getId() + "'>");
                    out.println("            <input type='hidden' name='actionTypeRoom' value='inactivate'>");
                    out.println("            <button class='btn btn-danger btn-sm'>❌</button>");
                    out.println("        </form>");
                } else {
                    out.println("        <form action='typeroomcontroller' method='post'>");
                    out.println("            <input type='hidden' name='idType' value='" + typeRoom.getId() + "'>");
                    out.println("            <input type='hidden' name='actionTypeRoom' value='activate'>");
                    out.println("            <button class='btn btn-success btn-sm'>✅</button>");
                    out.println("        </form>");
                }
                out.println("    </td>");
                out.println("</tr>");

                count++;
            }
            out.println("<!--COUNT:" + typeRooms.size() + "-->");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

