package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

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
    List<Product> recommendedProductsList = new ArrayList<>();
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
        String[] restrictionsToken = token.split(",");
        List<String> restrictionsList = new ArrayList<>();

        for (String restriction : restrictionsToken)
        {
            restriction = restriction.replaceAll("(^\"|\"$|%5B|%5D|%20|%22|\\s)", "");
            restrictionsList.add(restriction);
        }

        Configuration.getInstance().setUserRestrictionsList(restrictionsList);
    }
    public void setLanguage(String language)
    {
        Configuration.getInstance().setLanguage(language);
    }


    public Product checkBarcode(String barcode) throws SQLException {

        if (barcode.isEmpty())
        {
            return null;
        } else
        {
            barcode = barcode.replaceAll("(^\"|\"$|%5B|%5D|%22|%20)", "");
            return searcher.searchProductByBarcode(barcode);
        }
    }
    public Map<String, Object> checkName(String name) throws SQLException {
        name = name.replaceAll("(^\"|\"$|%5B|%5D|%22)", "");
        name = name.replace("%20", " ");

        String nameSearched = name.toLowerCase()
                                .replaceAll("(\\s|')", "")
                                .replaceAll("(%c3%a1|%c3%a4|%c3%a0|%c3%a2|%c3%81|%c3%84|%c3%80|%c3%82)", "a")
                                .replaceAll("(%c3%a9|%c3%ab|%c3%a8|%c3%aa|%c3%89|%c3%8b|%c3%88|%c3%8a)", "e")
                                .replaceAll("(%c3%ac|%c3%ad|%c3%ae|%c3%af|%c3%8c|%c3%8d|%c3%8e|%c3%8f)", "i")
                                .replaceAll("(%c3%b3|%c3%b6|%c3%b2|%c3%b4|%c3%93|%c3%94|%c3%92|%c3%96)", "o")
                                .replaceAll("(%c3%99|%c3%9a|%c3%9b|%c3%9c|%c3%b9|%c3%ba|%c3%bb|%c3%bc)", "u");

        Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();

        product = searcher.searchProductByName(nameSearched);

        if (product == null)
        {
            ingredient = searcher.searchIngredient(nameSearched);

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
    public void notFound() throws SQLException {
        Connection conn = ConnectDB.getConnection();

        if (searcher.getBarcode() != null)
        {
            String sql = "INSERT INTO public.notfound(barcode) VALUES (?)";
            PreparedStatement stringSTMT = conn.prepareStatement(sql);
            stringSTMT.setString(1, searcher.getBarcode());
            stringSTMT.executeUpdate();
        }
        else
        {
            String sql = "INSERT INTO public.notfound(name) VALUES (?)";
            PreparedStatement stringSTMT = conn.prepareStatement(sql);
            stringSTMT.setString(1, searcher.getProductName());
            stringSTMT.executeUpdate();
        }
    }

    public void incident(String observation) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        observation = observation.replaceAll("(^\"|\"$|%5B|%5D|%22)", "");
        observation = observation.replace("%20", " ");

        observation = observation.toLowerCase()
                .replaceAll("(%c3%a1|%c3%a4|%c3%a0|%c3%a2|%c3%81|%c3%84|%c3%80|%c3%82)", "a")
                .replaceAll("(%c3%a9|%c3%ab|%c3%a8|%c3%aa|%c3%89|%c3%8b|%c3%88|%c3%8a)", "e")
                .replaceAll("(%c3%ac|%c3%ad|%c3%ae|%c3%af|%c3%8c|%c3%8d|%c3%8e|%c3%8f)", "i")
                .replaceAll("(%c3%b3|%c3%b6|%c3%b2|%c3%b4|%c3%93|%c3%94|%c3%92|%c3%96)", "o")
                .replaceAll("(%c3%99|%c3%9a|%c3%9b|%c3%9c|%c3%b9|%c3%ba|%c3%bb|%c3%bc)", "u");

        if (searcher.getBarcode() != null)
        {
            String sql = "INSERT INTO public.incidents(observation, type_element, product_id) VALUES (?, ?, ?)";
            PreparedStatement stringSTMT = conn.prepareStatement(sql);
            stringSTMT.setString(1, observation);
            stringSTMT.setString(2, "product");
            stringSTMT.setString(3, searcher.getBarcode());
            stringSTMT.executeUpdate();
        }
        else if(searcher.getProductName() != null)
        {
            String sql = "INSERT INTO public.incidents(observation, type_element, product_id) VALUES (?, ?, ?)";
            PreparedStatement stringSTMT = conn.prepareStatement(sql);
            stringSTMT.setString(1, observation);
            stringSTMT.setString(2, "product");
            stringSTMT.setString(3, product.getBarcode());
            stringSTMT.executeUpdate();
        }
        else
        {
            String sql = "INSERT INTO public.incidents(observation, type_element, product_id) VALUES (?, ?, ?)";
            PreparedStatement stringSTMT = conn.prepareStatement(sql);
            stringSTMT.setString(1, observation);
            stringSTMT.setString(2, "ingredient");
            stringSTMT.setString(3, String.valueOf(ingredient.getId()));
            stringSTMT.executeUpdate();
        }
    }

    public Map<String, Object> checkProductBarcode(String barcode) throws SQLException {
        product = Taam_App.getInstance().checkBarcode(barcode);

        if (product != null) {
            Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();

            List<String> ingredientList = new ArrayList<>();
            for (Ingredient auxiliaryIngredient : product.getProductIngredientsList()) {
                ingredientList.add(auxiliaryIngredient.getIngredient());
            }

            resultToBeReturnedToFlutter.put("Name", product.getProductName());
            resultToBeReturnedToFlutter.put("Barcode", product.getBarcode());
            resultToBeReturnedToFlutter.put("Ingredients", ingredientList);

            int resultEdible = 0;
            List<String> nonSuitableIngredientsList = new ArrayList<>();
            List<String> doubtfulIngredientsList = new ArrayList<>();
            List<String> userRestrictionsList = Configuration.getInstance().getUserRestrictionsList();
            for (int counter = 0; counter < userRestrictionsList.size(); counter++) {
                visitor = Configuration.getInstance().createConfiguration(userRestrictionsList.get(counter));
                result = visitor.checkProduct(product.getProductIngredientsList());

                resultToBeReturnedToFlutter.put("Restriction" + (counter+1), userRestrictionsList.get(counter));
                resultToBeReturnedToFlutter.put("RestrictionEdible" + (counter+1), result.getResult().toString());

                if (result.getResult() != SUITABLE)
                {
                    for (Ingredient auxiliaryIngredient : result.getNonSuitableIngredientsList())
                    {
                        if (!nonSuitableIngredientsList.contains(auxiliaryIngredient.getIngredient()))
                        {
                            nonSuitableIngredientsList.add(auxiliaryIngredient.getIngredient());
                        }
                    }

                    for (Ingredient auxiliaryIngredient : result.getDoubtfulIngredientsList())
                    {
                        if (!doubtfulIngredientsList.contains(auxiliaryIngredient.getIngredient()))
                        {
                            doubtfulIngredientsList.add(auxiliaryIngredient.getIngredient());
                        }
                    }
                }

                if ((resultEdible != 1) && (result.getResult() == UNSUITABLE))
                {
                    resultEdible = 1;
                }
                else if ((resultEdible != 1) && (result.getResult() == DOUBTFUL))
                {
                    resultEdible = 2;
                }
            }

            if (resultEdible == 0)
            {
                resultToBeReturnedToFlutter.put("Edible", SUITABLE);
            }
            else
            {
                if (resultEdible == 1)
                {
                    resultToBeReturnedToFlutter.put("Edible", UNSUITABLE);
                }
                else
                {
                    resultToBeReturnedToFlutter.put("Edible", DOUBTFUL);
                }

                resultToBeReturnedToFlutter.put("ListIngredientsUNSUITABLE", nonSuitableIngredientsList);
                resultToBeReturnedToFlutter.put("ListIngredientsDOUBTFUL", doubtfulIngredientsList);
            }

            return resultToBeReturnedToFlutter;

        }else
        {
            return null;
        }
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

                int resultEdible = 0;
                List<String> nonSuitableIngredientsList = new ArrayList<>();
                List<String> doubtfulIngredientsList = new ArrayList<>();
                List<String> userRestrictionsList = Configuration.getInstance().getUserRestrictionsList();
                for (int counter = 0; counter < userRestrictionsList.size(); counter++)
                {
                    visitor = Configuration.getInstance().createConfiguration(restrictions.get(counter));
                    result = visitor.checkProduct(product.productIngredientsList);

                    resultToBeReturnedToFlutter.put("Restriction" + (counter+1), userRestrictionsList.get(counter));
                    resultToBeReturnedToFlutter.put("RestrictionEdible" + (counter+1), result.getResult().toString());

                    if (result.getResult() != SUITABLE)
                    {
                        for (Ingredient auxiliaryIngredient : result.getNonSuitableIngredientsList())
                        {
                            if (!nonSuitableIngredientsList.contains(auxiliaryIngredient.getIngredient()))
                            {
                                nonSuitableIngredientsList.add(auxiliaryIngredient.getIngredient());
                            }
                        }

                        for (Ingredient auxiliaryIngredient : result.getDoubtfulIngredientsList())
                        {
                            if (!doubtfulIngredientsList.contains(auxiliaryIngredient.getIngredient()))
                            {
                                doubtfulIngredientsList.add(auxiliaryIngredient.getIngredient());
                            }
                        }
                    }

                    if ((resultEdible != 1) && (result.getResult() == UNSUITABLE))
                    {
                        resultEdible = 1;
                    }
                    else if ((resultEdible != 1) && (result.getResult() == DOUBTFUL))
                    {
                        resultEdible = 2;
                    }
                }

                if (resultEdible == 0)
                {
                    resultToBeReturnedToFlutter.put("Edible", SUITABLE);
                }
                else
                {
                    if (resultEdible == 1)
                    {
                        resultToBeReturnedToFlutter.put("Edible", UNSUITABLE);
                    }
                    else
                    {
                        resultToBeReturnedToFlutter.put("Edible", DOUBTFUL);
                    }

                    resultToBeReturnedToFlutter.put("ListIngredientsUNSUITABLE", nonSuitableIngredientsList);
                    resultToBeReturnedToFlutter.put("ListIngredientsDOUBTFUL", doubtfulIngredientsList);
                }
            }
            else
            {
                ingredient = (Ingredient) returnCheckName.get("Element");

                resultToBeReturnedToFlutter.put("Name", ingredient.getIngredient());
                resultToBeReturnedToFlutter.put("Id", ingredient.getId());

                List<String> restrictions = Configuration.getInstance().getUserRestrictionsList();

                int resultEdible = 0;
                List<String> userRestrictionsList = Configuration.getInstance().getUserRestrictionsList();
                for (int counter = 0; counter < userRestrictionsList.size(); counter++)
                {
                    visitor = Configuration.getInstance().createConfiguration(restrictions.get(counter));
                    result = visitor.checkIngredient(ingredient);

                    resultToBeReturnedToFlutter.put("Restriction" + (counter+1), userRestrictionsList.get(counter));
                    resultToBeReturnedToFlutter.put("RestrictionEdible" + (counter+1), result.getResult().toString());

                    if ((resultEdible != 1) && (result.getResult() == UNSUITABLE))
                    {
                        resultEdible = 1;
                    }
                    else if ((resultEdible != 1) && (result.getResult() == DOUBTFUL))
                    {
                        resultEdible = 2;
                    }
                }

                if (resultEdible == 0)
                {
                    resultToBeReturnedToFlutter.put("Edible", SUITABLE);
                }
                else if (resultEdible == 1)
                {
                    resultToBeReturnedToFlutter.put("Edible", UNSUITABLE);
                }
                else
                {
                    resultToBeReturnedToFlutter.put("Edible", DOUBTFUL);
                }
            }

            return resultToBeReturnedToFlutter;
        }
        else
        {
            return null;
        }
    }

    public Map<String, Object> recommendedProducts() throws SQLException {
        Map<String, Object> recommendedProductsMap = new HashMap<String, Object>();
        Map<String, Object> auxiliaryMap = new HashMap<String, Object>();
        recommendedProductsList.clear();

        Connection conn = ConnectDB.getConnection();
        String sql = "SELECT id FROM public.products;";
        PreparedStatement stringSTMT = conn.prepareStatement(sql);
        ResultSet result = stringSTMT.executeQuery();

        while (result.next())
        {
            auxiliaryMap = this.checkProductBarcode(result.getString("id"));
            if (auxiliaryMap.get("Edible") == SUITABLE)
            {
                Product auxiliaryProduct = new Product();
                auxiliaryProduct.setProductName((String) auxiliaryMap.get("Name"));
                auxiliaryProduct.setBarcode((String) auxiliaryMap.get("Barcode"));

                recommendedProductsList.add(auxiliaryProduct);
            }
        }

        int counter = 0;
        while ((counter < recommendedProductsList.size()) && (counter < 10))
        {
            //recommendedProductsMap.put("Product" + (counter+1), recommendedProductsList.get(counter));
            recommendedProductsMap.put("Product" + (counter+1), recommendedProductsList.get(counter).getProductName());
            counter = counter + 1;
        }

        return recommendedProductsMap;
    }
    public Map<String, Object> refreshRecommendedProducts()
    {
        Map<String, Object> recommendedProductsMap = new HashMap<String, Object>();
        Random random = new Random();
        List<Integer> indexList = new ArrayList<>();
        int randomIndex;

        if (recommendedProductsList.size() < 10)
        {
            for (int counter = 0; counter < recommendedProductsList.size(); counter++)
            {
                randomIndex = random.nextInt(recommendedProductsList.size());
                while (indexList.contains(randomIndex))
                {
                    randomIndex = random.nextInt(recommendedProductsList.size());
                }
                indexList.add(randomIndex);
                //recommendedProductsMap.put("Product" + (counter+1), recommendedProductsList.get(randomIndex));
                recommendedProductsMap.put("Product" + (counter+1), recommendedProductsList.get(randomIndex).getProductName());
            }
        }
        else
        {
            int counter = 0;
            while (counter < 10)
            {
                randomIndex = random.nextInt(recommendedProductsList.size());
                while (indexList.contains(randomIndex))
                {
                    randomIndex = random.nextInt(recommendedProductsList.size());
                }
                indexList.add(randomIndex);
                //recommendedProductsMap.put("Product" + (counter+1), recommendedProductsList.get(randomIndex));
                recommendedProductsMap.put("Product" + (counter+1), recommendedProductsList.get(counter).getProductName());
                counter = counter + 1;
            }
        }

        return recommendedProductsMap;
    }
}