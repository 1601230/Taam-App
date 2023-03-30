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

    public void Searcher()
    {
    }

    /**
     * This is the search engine for a product by name. This method allows the user to search in the database for the
     * ingredients of a product by its name.
     * Attributes "barcode" and "ingredientName" are set to "null" except attribute "productName", in this way we know
     * at any moment what the user is looking for.
     */
    public Product searchProductByName(String productName) throws SQLException {
        Connection conn = ConnectDB.getConnection();
        String sql = "SELECT id FROM public.products WHERE name = ?;";
        PreparedStatement stringSTMT = conn.prepareStatement(sql);
        stringSTMT.setString(1, productName);
        ResultSet result = stringSTMT.executeQuery();

        boolean productFound = false;
        Product product = new Product();
        while (result.next()) {
            product.setProductName(productName);
            product.setBarcode(result.getString("id"));
            productFound = true;
        }

        if (productFound == true)
        {
            sql = "SELECT ingredient_id FROM public.products_ingredients WHERE product_id = ?;";
            stringSTMT = conn.prepareStatement(sql);
            stringSTMT.setString(1, product.getBarcode());
            result = stringSTMT.executeQuery();

            List<Integer> ingredientIdList = new ArrayList<>();
            while (result.next()) {
                int integerId = Integer.parseInt(result.getString("ingredient_id"));
                ingredientIdList.add(integerId);
            }

            for ( int ingredientID : ingredientIdList)
            {
                sql = "SELECT name" + Configuration.getInstance().getLanguage() + " FROM public.ingredients WHERE id = ?;";
                PreparedStatement integerSTMT = conn.prepareStatement(sql);
                integerSTMT.setInt(1, ingredientID);
                result = integerSTMT.executeQuery();

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
            this.productName = productName;
            barcode = null;
            ingredientName = null;
            return null;
        }
    }

    /**
     * This is the search engine for a product by barcode. This method allows the user to search in the database for the
     * ingredients of a product by its barcode.
     * Attributes "productName" and "ingredientName" are set to "null" except attribute "barcode", in this way we know
     * at any moment what the user is looking for.
     */
    public Product searchProductByBarcode(String barcode) throws SQLException {

        productName = null;
        this.barcode = barcode;
        ingredientName = null;

        boolean productFound = false;
        Connection conn = ConnectDB.getConnection();

        PreparedStatement stmt1 = conn.prepareStatement("SELECT name FROM public.products WHERE id=?");
        stmt1.setString(1, barcode);
        ResultSet result1 = stmt1.executeQuery();

        Product product = new Product();

        while (result1.next()) {
            productFound = true;
            product.setProductName(result1.getString("name"));
            product.setBarcode(barcode);
        }

        if (productFound) {
            PreparedStatement stmt2 = conn.prepareStatement("SELECT ingredient_id FROM public.products_ingredients WHERE product_id=?");
            stmt2.setString(1, barcode);
            ResultSet result2 = stmt2.executeQuery();

            while (result2.next()) {
                Integer ingredient_id = result2.getInt("ingredient_id");
                PreparedStatement stmt3 = conn.prepareStatement("SELECT name" + Configuration.getInstance().getLanguage() + " FROM public.ingredients WHERE id=?");
                stmt3.setInt(1, ingredient_id);
                ResultSet result3 = stmt3.executeQuery();

                while (result3.next()) {
                    String ingredientName = result3.getString("name" + Configuration.getInstance().getLanguage());
                    Ingredient ingredient = new Ingredient(ingredientName, ingredient_id);

                    product.productIngredientsList.add(ingredient);
                }
            }

            return product;

        }else {
            return null;
        }
    }

    /**
     * This is the search engine for a ingredient by name. This method allows the user to know if an ingredient is in
     * the database.
     * Attributes "productName" and "barcode" are set to "null" except attribute "ingredientName", in this way we know
     * at any moment what the user is looking for.
     */
    public Ingredient searchIngredient(String ingredientName) throws SQLException {
        Connection conn = ConnectDB.getConnection();
        String sql = "SELECT id FROM public.ingredients WHERE name" + Configuration.getInstance().getLanguage() + " = ?;";
        PreparedStatement stringSTMT = conn.prepareStatement(sql);
        stringSTMT.setString(1, ingredientName);
        ResultSet result = stringSTMT.executeQuery();

        boolean ingredientFound = false;
        Ingredient ingredient = new Ingredient();
        while (result.next()) {
            ingredient.setId(Integer.valueOf(result.getString("id")));
            ingredient.setIngredient(ingredientName);
            ingredientFound = true;
        }

        productName = null;
        barcode = null;
        this.ingredientName = ingredientName;

        if (ingredientFound == true) {
            return ingredient;
        } else {
            return null;
        }
    }
}
