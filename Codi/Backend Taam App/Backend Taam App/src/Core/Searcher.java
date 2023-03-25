package Core;

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
    public Product searchProductByName(String productName)
    {
        this.productName = productName;
        barcode = null;
        ingredientName = null;
        return null;
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
    public Ingredient searchIngredient(String ingredientName)
    {
        productName = null;
        barcode = null;
        ingredientName = this.ingredientName;
        return null;
    }
}
