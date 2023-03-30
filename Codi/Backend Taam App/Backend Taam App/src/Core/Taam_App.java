package Core;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static Core.Edible.*;

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
                resultToBeReturnedToFlutter.put("Type", "Ingredient");
                resultToBeReturnedToFlutter.put("Element", ingredient);

                return resultToBeReturnedToFlutter;
            }
            else
            {
                return null;
            }
        }
        else
        {
            resultToBeReturnedToFlutter.put("Type", "Product");
            resultToBeReturnedToFlutter.put("Element", product);

            return resultToBeReturnedToFlutter;
        }
    }
    public void notFound()
    {

    }

    public Map<String, Object> checkProductIngredientName(String name) throws SQLException {
        Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();
        Map<String, Object> returnCheckName = new HashMap<String, Object>();
        returnCheckName = checkName(name);

        if (returnCheckName != null)
        {
            if (returnCheckName.get("Type") == "Product")
            {
                product = (Product) returnCheckName.get("Element");

                List<String> ingredientList = new ArrayList<>();
                for (Ingredient auxiliaryIngredient : product.getProductIngredientsList())
                {
                    ingredientList.add(auxiliaryIngredient.getIngredient());
                }

                resultToBeReturnedToFlutter.put("Name", product.getProductName());
                resultToBeReturnedToFlutter.put("Barcode", product.getBarcode());
                resultToBeReturnedToFlutter.put("Ingredients", ingredientList);

                List<String> restrictions = Configuration.getInstance().getUserRestrictionsList();

                boolean suitable = true;
                int counter = 0;
                while ((counter < restrictions.size()) && (suitable == true))
                {
                    visitor = Configuration.getInstance().createConfiguration(restrictions.get(counter));
                    result = visitor.checkProduct(product.productIngredientsList);

                    if (result.getResult() != SUITABLE)
                    {
                        suitable = false;
                    }
                    else
                    {
                        counter = counter + 1;
                    }
                }

                resultToBeReturnedToFlutter.put("Edible", result.getResult().toString());
                if (result.getResult() != SUITABLE)
                {
                    resultToBeReturnedToFlutter.put("ListIngredientsDOUBTFUL", result.getDoubtfulIngredientsList());
                    resultToBeReturnedToFlutter.put("ListIngredientsUNSUITABLE", result.getNonSuitableIngredientsList());
                }
            }
            else
            {
                ingredient = (Ingredient) returnCheckName.get("Element");

                resultToBeReturnedToFlutter.put("Name", ingredient.getIngredient());
                resultToBeReturnedToFlutter.put("Id", ingredient.getId());

                List<String> restrictions = Configuration.getInstance().getUserRestrictionsList();

                boolean suitable = true;
                int counter = 0;
                while ((counter < restrictions.size()) && (suitable == true))
                {
                    visitor = Configuration.getInstance().createConfiguration(restrictions.get(counter));
                    result = visitor.checkIngredient(ingredient);

                    if (result.getResult() != SUITABLE)
                    {
                        suitable = false;
                    }
                    else
                    {
                        counter = counter + 1;
                    }
                }

                resultToBeReturnedToFlutter.put("Edible", result.getResult().toString());
            }

            return resultToBeReturnedToFlutter;
        }
        else
        {
            return null;
        }
    }
}
