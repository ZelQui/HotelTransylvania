package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Services.Auth;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private Auth authService = new Auth(); // Instanciamos la clase Auth

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String mensaje = authService.login(username, password, request);

        response.getWriter().write(mensaje); // Responde con el mensaje
    }
}

