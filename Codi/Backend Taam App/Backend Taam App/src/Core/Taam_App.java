package Core;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The "Taam App" class is the main module of the project. It is the class responsible for calling all the necessary
 * methods to control the execution flow of the application in order to achieve its main purpose. "Taam App" applies
 * the "singleton" pattern because we are only interested in having one instance of this module, so that each client
 * uses the same instance during all its requests to the server.
 */
public class Taam_App {
    private static Taam_App instance = null;
    public static Searcher searcher = new Searcher();
    public static Product product = new Product();
    public static Ingredient ingredient = new Ingredient();
    public static Result result;
    public static Recommendations recommendations;
    public static Visitor visitor;

    /**
     * "Taam App" has a private constructor to create an instance of this class. It is private to prevent uncontrolled
     * instances from being created, as the aim is that only one instance is created and that the same instance is used at
     * all times. at all times. From this constructor the connection to the local database is established.
     */
    private Taam_App()
    {
        ConnectDB.getConnection();
    }

    /**
     * This method is used to retrieve the unique instance of the class "Taam App" (in case the instance is not created,
     * it is created using the private constructor).
     */
    public static Taam_App getInstance()
    {
        if (instance == null) {
            instance = new Taam_App();
        }

        return instance;
    }
    public Searcher getSearcher()
    {
        return searcher;
    }

    public void setVisitor(Visitor visitor)
    {
        this.visitor = visitor;
    }

    public void setRestrictions(String token)
    {
        String[] restrictionsToken = token.split(", ");
        List<String> restrictionsList = new ArrayList<>();

        for (String restriction : restrictionsToken)
        {
            restriction = restriction.replaceAll("(^\"|\"$|%5B|%5D|%20)", "");
            restrictionsList.add(restriction);
        }

        Configuration.getInstance().setUserRestrictionsList(restrictionsList);
    }

    public void setLanguage(String language)
    {
        Configuration.getInstance().setLanguage(language);
    }

    public Product checkBarcode(String barcode)
    {
        return null;
    }
    public Map<String, Object> checkName(String name) throws SQLException {
        name = name.replaceAll("(^\"|\"$|%5B|%5D|%22)", "");
        name = name.replace("%20", " ");

        Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();

        product = searcher.searchProductByName(name);

        if (product == null)
        {
            ingredient = searcher.searchIngredient(name);

            if (ingredient != null)
            {
                resultToBeReturnedToFlutter.put("Name", ingredient.getIngredient());
                resultToBeReturnedToFlutter.put("Id", ingredient.getId());

                return resultToBeReturnedToFlutter;
            }
            else
            {
                return null;
            }
        }
        else
        {
            List<String> ingredientList = new ArrayList<>();
            for (Ingredient auxiliaryIngredient : product.getProductIngredientsList())
            {
                ingredientList.add(auxiliaryIngredient.getIngredient());
            }

            resultToBeReturnedToFlutter.put("Name", product.getProductName());
            resultToBeReturnedToFlutter.put("Barcode", product.getBarcode());
            resultToBeReturnedToFlutter.put("Ingredients", ingredientList);

            return resultToBeReturnedToFlutter;
        }
    }
    public void notFound()
    {

    }
}
