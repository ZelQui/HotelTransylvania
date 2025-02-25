package development.team.hoteltransylvania.Services;

import development.team.hoteltransylvania.Business.GestionUser;
import development.team.hoteltransylvania.Model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Auth {
    private GestionUser userdao = new GestionUser(); // Instanciamos directamente

    public String login(String username, String password, HttpServletRequest request) {
        if (userdao.validarCredenciales(username, password)) {
            User user = userdao.obtenerUsuarioSesion(username);
            HttpSession session = request.getSession(); // Obtener la sesión de la petición
            session.setAttribute("usuario", user);
            return "Datos correctos, sesión iniciada";
        } else {
            return "Datos incorrectos";
        }
    }
}
