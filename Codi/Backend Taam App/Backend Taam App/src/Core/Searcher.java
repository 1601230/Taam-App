package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * The "Searcher" class is the one that allows to query a product (by its name or by its barcode) and an ingredient
 * (by its name) in the database and retrieve its information. The information retrieved with the methods of this class
 * are the ones that allow later to check if it is suitable for the user according to his preferences.
 */
public class Searcher {
    private String productName;
    private Integer barcode;
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
    public Product searchProductByBarcode(Integer barcode)
    {
        productName = null;
        this.barcode = barcode;
        ingredientName = null;
        return null;
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

        if (ingredientFound == true)
        {
            productName = null;
            barcode = null;
            this.ingredientName = ingredientName;
            return ingredient;
        }
        else
        {
            productName = null;
            barcode = null;
            this.ingredientName = ingredientName;
            return null;
        }
    }
}
