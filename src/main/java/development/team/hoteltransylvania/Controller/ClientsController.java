package development.team.hoteltransylvania.Controller;

import development.team.hoteltransylvania.Business.GestionClient;
import development.team.hoteltransylvania.Business.GestionProduct;
import development.team.hoteltransylvania.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "clientcontrol", urlPatterns = {"/clientcontrol"})
public class ClientsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("actionclient");

        switch (action) {
            case "add":
                /*String productName = req.getParameter("nameproduct");
                double price = Double.parseDouble(req.getParameter("priceproduct"));
                GestionProduct.registerProduct(new Product(productName, price));
                //req.getRequestDispatcher("jsp/catalagoProductos.jsp").forward(req, resp);
                resp.sendRedirect("menu.jsp?view=catalogoProductos");*/
                break;
            case "delete":
                int idClient = Integer.parseInt(req.getParameter("idClient"));
                GestionClient.deleteClient(idClient);
                resp.sendRedirect("menu.jsp?view=clientes");
                break;
            case "update":
                /*int id = Integer.parseInt(req.getParameter("idproduct"));
                Product product = GestionProduct.getProductById(id);
                String name = req.getParameter("nameproduct");
                String priceString = req.getParameter("priceproduct");
                product.setName(name); product.setPrice(Double.parseDouble(priceString));
                GestionProduct.updateProduct(product);
                resp.sendRedirect("menu.jsp?view=catalogoProductos");*/
                break;
        }
    }
}
