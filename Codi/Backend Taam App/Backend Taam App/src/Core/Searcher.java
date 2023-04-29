package Core;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 * The "Searcher" class is the one that allows to query a product (by its name or by its barcode) and an ingredient
 * (by its name) in the database and retrieve its information. The information retrieved with the methods of this class
 * are the ones that allow later to check if it is suitable for the user according to his preferences.
 */
public class Searcher {
    private String productName;
    private String barcode;
    private String ingredientName;
    private DataBase db = new DataBase();

    public Searcher()
    {
    }


    public String getProductName(){
        return productName;
    }

    public String getBarcode(){
        return barcode;
    }

    public String getIngredientName(){
        return ingredientName;
    }
    /**
     * This is the search engine for a product by barcode. This method allows the user to search in the database for the
     * ingredients of a product by its barcode.
     * Attributes "productName" and "ingredientName" are set to "null" except attribute "barcode", in this way we know
     * at any moment what the user is looking for.
     */
    public Product searchProductByBarcode(String barcode) throws SQLException {

            if (!(barcode instanceof String)) {
                return null;
            }
            productName = null;
            this.barcode = barcode;
            ingredientName = null;

            boolean productFound = false;
            ResultSet result1 = db.selectProductName(barcode);
            Product product = new Product();

            while (result1.next()) {
                productFound = true;
                product.setProductName(result1.getString("name"));
                product.setBarcode(barcode);
            }

            if (productFound) {
                ResultSet result2 = db.selectProductIngredientsId(barcode);

                while (result2.next()) {
                    Integer ingredient_id = result2.getInt("ingredient_id");
                    ResultSet result3 = db.selectProductIngredientName(ingredient_id);

                    while (result3.next()) {
                        String ingredientName = result3.getString("name" + Configuration.getInstance().getLanguage());
                        Ingredient ingredient = new Ingredient(ingredientName, ingredient_id);

                        product.productIngredientsList.add(ingredient);
                    }
                }

                return product;

            } else {
                return null;
            }
    }

    /**
     * This is the search engine for a product by name. This method allows the user to search in the database for the
     * ingredients of a product by its name.
     * Attributes "barcode" and "ingredientName" are set to "null" except attribute "productName", in this way we know
     * at any moment what the user is looking for.
     */
    public Product searchProductByName(String nameSearched) throws SQLException {
        if (nameSearched != null)
        {
            ResultSet result = db.selectProductIdName();

            boolean productFound = false;
            Product product = new Product();
            while ((result.next()) && (productFound == false))
            {
                productName = result.getString("name");
                String auxiliaryName = result.getString("name").toLowerCase()
                        .replaceAll("(\\s|')", "")
                        .replaceAll("(%c3%a1|%c3%a4|%c3%a0|%c3%a2|%c3%81|%c3%84|%c3%80|%c3%82)", "a")
                        .replaceAll("(%c3%a9|%c3%ab|%c3%a8|%c3%aa|%c3%89|%c3%8b|%c3%88|%c3%8a)", "e")
                        .replaceAll("(%c3%ac|%c3%ad|%c3%ae|%c3%af|%c3%8c|%c3%8d|%c3%8e|%c3%8f)", "i")
                        .replaceAll("(%c3%b3|%c3%b6|%c3%b2|%c3%b4|%c3%93|%c3%94|%c3%92|%c3%96)", "o")
                        .replaceAll("(%c3%99|%c3%9a|%c3%9b|%c3%9c|%c3%b9|%c3%ba|%c3%bb|%c3%bc)", "u");

                if (auxiliaryName.equals(nameSearched))
                {
                    productFound = true;
                    product.setProductName(productName);
                    product.setBarcode(result.getString("id"));
                }
            }

            if (productFound == true)
            {
                result = db.selectProductIngredientsId(product.getBarcode());

                List<Integer> ingredientIdList = new ArrayList<>();
                while (result.next()) {
                    int integerId = Integer.parseInt(result.getString("ingredient_id"));
                    ingredientIdList.add(integerId);
                }

                for ( int ingredientID : ingredientIdList)
                {
                    result = db.selectProductIngredientName(ingredientID);

                    while (result.next()) {
                        String ingredientName = result.getString("name" + Configuration.getInstance().getLanguage());
                        Ingredient ingredient = new Ingredient(ingredientName, ingredientID);
                        product.productIngredientsList.add(ingredient);
                    }
                }

                this.productName = productName;
                barcode = null;
                ingredientName = null;
                return product;
            }
            else
            {
                this.productName = nameSearched;
                barcode = null;
                ingredientName = null;
                return null;
            }
        }
        else
        {
            return null;
        }
    }

    /**
     * This is the search engine for a ingredient by name. This method allows the user to know if an ingredient is in
     * the database.
     * Attributes "productName" and "barcode" are set to "null" except attribute "ingredientName", in this way we know
     * at any moment what the user is looking for.
     */
    public Ingredient searchIngredient(String nameSearched) throws SQLException {
        ResultSet result = db.selectIngredientIdName();

        boolean ingredientFound = false;
        Ingredient ingredient = new Ingredient();
        while ((result.next()) && (ingredientFound == false))
        {
            ingredientName = result.getString("name" + Configuration.getInstance().getLanguage());
            String auxiliaryName = result.getString("name" + Configuration.getInstance().getLanguage()).toLowerCase()
                                    .replaceAll("(\\s|')", "")
                                    .replaceAll("(%c3%a1|%c3%a4|%c3%a0|%c3%a2|%c3%81|%c3%84|%c3%80|%c3%82)", "a")
                                    .replaceAll("(%c3%a9|%c3%ab|%c3%a8|%c3%aa|%c3%89|%c3%8b|%c3%88|%c3%8a)", "e")
                                    .replaceAll("(%c3%ac|%c3%ad|%c3%ae|%c3%af|%c3%8c|%c3%8d|%c3%8e|%c3%8f)", "i")
                                    .replaceAll("(%c3%b3|%c3%b6|%c3%b2|%c3%b4|%c3%93|%c3%94|%c3%92|%c3%96)", "o")
                                    .replaceAll("(%c3%99|%c3%9a|%c3%9b|%c3%9c|%c3%b9|%c3%ba|%c3%bb|%c3%bc)", "u");

            if (auxiliaryName.equals(nameSearched))
            {
                ingredientFound = true;
                ingredient.setIngredient(ingredientName);
                ingredient.setId(Integer.valueOf(result.getString("id")));
            }
        }



        if (ingredientFound == true) {
            productName = null;
            barcode = null;
            this.ingredientName = ingredientName;
            return ingredient;
        } else {
            productName = null;
            barcode = null;
            this.ingredientName = nameSearched;
            return null;
        }
    }
}