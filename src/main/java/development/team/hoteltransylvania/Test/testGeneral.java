package development.team.hoteltransylvania.Test;

import development.team.hoteltransylvania.Business.GestionProduct;
import development.team.hoteltransylvania.Model.Product;
import development.team.hoteltransylvania.Util.LoggerConfifg;

import java.util.List;
import java.util.logging.Logger;

public class testGeneral {
    public static void main(String[] args) {

        List<Product> productsInList= GestionProduct.getAllProducts();

        productsInList.forEach(System.out::println);

    }
}
