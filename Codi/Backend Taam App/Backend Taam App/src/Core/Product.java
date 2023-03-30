package Core;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private String productName;
    private String barcode;
    List<Ingredient> productIngredientsList = new ArrayList<>();

    public Product() {

    }

    public String getProductName() {
        return productName;
    }

    public String getBarcode() {
        return barcode;
    }

    public List<Ingredient> getProductIngredientsList() {
        return productIngredientsList;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

}

