package development.team.hoteltransylvania.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "reservatioController", urlPatterns = {"/reservatioController"})
public class ReservationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action1 = req.getParameter("nombre");
        String action2 = req.getParameter("tipoDocumento");
        String action3 = req.getParameter("fechaEntrada");
        String action4 = req.getParameter("adelanto");

        System.out.println(action1);
        System.out.println(action2);
        System.out.println(action3);
        System.out.println(action4);
    }
}
