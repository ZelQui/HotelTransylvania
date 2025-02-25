package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Business.GestionEmployee;
import development.team.hoteltransylvania.Business.GestionUser;
import development.team.hoteltransylvania.Model.Employee;
import development.team.hoteltransylvania.Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "user", urlPatterns = {"/user"})
public class UsersController extends HttpServlet {

    GestionUser userdao = new GestionUser();
    User user = new User();

    GestionEmployee employeedao = new GestionEmployee();
    Employee employee = new Employee();

    String mensaje = "";
    int IdUsuario = 0;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");

        switch (accion) {
            case "Listar":
                List lista = userdao.getAllUsers();
                req.setAttribute("usuarios", lista);
                break;
            case "Registrar":
                //Para validar datos de inicio de sesión
                String nombre = "nombre";
                String email = req.getParameter("email");
                String telefono = req.getParameter("telefono");
                String genero = req.getParameter("genero");
                String contrasena = req.getParameter("password");

                if (userdao.existeUsuario(email)) {
                    System.out.println("El email ya está registrado.");
                } else {
                    //AGREGAR A USUARIOS
                    IdUsuario = userdao.registerUser(user);
                    System.out.printf("Se ha registrado el User con ID: " + IdUsuario);
                }
                resp.sendRedirect("index.jsp");
                return;
            default:
                break;
        }
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}

