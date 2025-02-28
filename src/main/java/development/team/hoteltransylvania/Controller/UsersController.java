package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Business.GestionEmployee;
import development.team.hoteltransylvania.Business.GestionUser;
import development.team.hoteltransylvania.Model.Employee;
import development.team.hoteltransylvania.Model.StatusUser;
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
    int IdEmployee = 0;

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
                String name = req.getParameter("nombre");
                String email = req.getParameter("email");
                String username1 = req.getParameter("username");;
                String password1 = req.getParameter("password");

                if (userdao.existeUsuario(username1)) {
                    System.out.println("El email ya está registrado.");
                } else {
                    //AGREGAR A USUARIOS
                    user.setUsername(username1);
                    user.setPassword(password1);

                        //AGREGAR A EMPLEADOS
                        employee.setName(name);
                        employee.setPosition("rolEmpleado"); //VALOR PREDETERMINADO PARA ROL DE EMPLEADO EN REGISTEO.JSP
                        employee.setEmail(email);
                        IdEmployee = employeedao.registerEmployee(employee);
                        employee.setId(IdEmployee);

                    user.setEmployee(employee);
                    user.setStatusUser(StatusUser.valueOf("Activo"));
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

