package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Business.GestionProduct;
import development.team.hoteltransylvania.Business.GestionRoom;
import development.team.hoteltransylvania.Model.Product;
import development.team.hoteltransylvania.Model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "filterRoomServlet", urlPatterns = {"/filterRoomServlet"})
public class FilterRoomController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String filter = req.getParameter("filter");
            List<Room> rooms = GestionRoom.filterRooms(filter);
            int count = 1;
            for (Room room : rooms) {
                out.println("<tr>");
                out.println("<td>" + room.getNumber() + "</td>");
                String floor = "Nivel " + room.getFloor();
                out.println("<td>" + floor + "</td>");
                out.println("<td>" + room.getTypeRoom().getName() + "</td>");
                out.println("<td>" + room.getPrice() + "</td>");
                out.println("<td>24hr.</td>");
                out.println("<td>" + room.getStatusRoom().getName() + "</td>");
                out.println("<td class='d-flex justify-content-center gap-1'>");
                out.println("  <button class='btn btn-warning btn-sm' id='btn-editar' " +
                        "data-bs-toggle='modal' " +
                        "data-bs-target='#modalEditarHabitacion' " +
                        "onclick='editarRoom(" + room.getId() + ")'>✏️</button>");
                out.println("  <form action='roomcontroller' method='post'>");
                out.println("    <input type='hidden' name='idroom' value='" + room.getId() + "'>");
                out.println("    <input type='hidden' name='actionRoom' value='delete'>");
                out.println("    <button class='btn btn-danger btn-sm'>❌</button>");
                out.println("  </form>");
                out.println("</td>");
                out.println("</tr>");

                count++;
            }
            out.println("<!--COUNT:" + rooms.size() + "-->");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
