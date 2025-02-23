package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Business.GestionEmployee;
import development.team.hoteltransylvania.Business.GestionProduct;
import development.team.hoteltransylvania.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "productcontrol", urlPatterns = {"/productcontrol"})
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("actionproduct");

        switch (action) {
            case "add":
                String productName = req.getParameter("nameproduct");
                double price = Double.parseDouble(req.getParameter("priceproduct"));
                GestionProduct.registerProduct(new Product(productName, price));
                //req.getRequestDispatcher("jsp/catalagoProductos.jsp").forward(req, resp);
                break;
            case "delete":
                int productId = Integer.parseInt(req.getParameter("idproduct"));
                GestionProduct.deleteProduct(productId);
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("idproduct"));
                Product product = GestionProduct.getProductById(id);
                GestionProduct.updateProduct(product);
                break;
        }

    }
}
