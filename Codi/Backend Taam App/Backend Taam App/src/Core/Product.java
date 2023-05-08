package Core;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private String productName;
    private String barcode;
    private String image;
    List<Ingredient> productIngredientsList = new ArrayList<>();

    public Product() {

    }

    public String getProductName() {
        return productName;
    }

    public String getBarcode() {
        return barcode;
    }
    public String getImage() {return image; }

    public List<Ingredient> getProductIngredientsList() {
        return productIngredientsList;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }
    public void setImage(String image) {this.image = image; }

}

