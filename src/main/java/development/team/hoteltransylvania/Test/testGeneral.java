package development.team.hoteltransylvania.Test;

import development.team.hoteltransylvania.Business.GestionProduct;
import development.team.hoteltransylvania.Model.Product;
import development.team.hoteltransylvania.Util.LoggerConfifg;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;
import java.util.logging.Logger;

public class testGeneral {
    public static void main(String[] args) {

        boolean test = BCrypt.checkpw("123456", "$2a$10$XwA.Z1FYsLj20WFn.jvnSun/PerG22PrnpNZ4cVTtFMHktkF548Hq");
        System.out.println("Prueba manual de BCrypt: " + test);

    }
}
