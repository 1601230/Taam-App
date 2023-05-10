package Core;

import java.sql.*;
import java.util.*;

import static Core.Edible.*;


/**
 * The "Taam App" class is the main module of the project. It is the class responsible for calling all the necessary
 * methods to control the execution flow of the application in order to achieve its main purpose. "Taam App" applies
 * the "singleton" pattern because we are only interested in having one instance of this module, so that each client
 * uses the same instance during all its requests to the server.
 */
public class TaamApp {
    private static TaamApp instance = null;
    private DataBase db = new DataBase();
    public static Searcher searcher = new Searcher();
    public static Product product = new Product();
    public static Ingredient ingredient = new Ingredient();
    public static Result result;
    List<Product> recommendedProductsList = new ArrayList<>();
    public static Visitor visitor;

    /**
     * "Taam App" has a private constructor to create an instance of this class. It is private to prevent uncontrolled
     * instances from being created, as the aim is that only one instance is created and that the same instance is used at
     * all times. From this constructor the connection to the local database is established.
     */
    private TaamApp()
    {
        ConnectDB.getConnection();
    }

    /**
     * This method is used to retrieve the unique instance of the class "Taam App" (in case the instance is not created,
     * it is created using the private constructor).
     */
    public static TaamApp getInstance()
    {
        if (instance == null) {
            instance = new TaamApp();
        }

        return instance;
    }

    public Map<String, Object> getRestrictionsList()
    {
        return Configuration.getInstance().getRestrictionsList();
    }
    public void setRestrictions(String token) {
        if (token != null && !token.isEmpty())
        {
            String[] restrictionsToken = token.split(",");
            List<String> restrictionsList = new ArrayList<>();

            for (String restriction : restrictionsToken)
            {
                restriction = restriction.replaceAll("(^\"|\"$|%5B|%5D|%20|%22|\\s)", "");
                restrictionsList.add(restriction);
            }
            Configuration.getInstance().setUserRestrictionsList(restrictionsList);
        }else {
            Configuration.getInstance().setUserRestrictionsList(null);
        }
    }
    public void setLanguage(String language)
    {
        Configuration.getInstance().setLanguage(language);
    }

    public String textTransformer(String text)
    {
        text = text.replaceAll("(^\"|\"$|%5B|%5D|%22)", "");
        text = text.replace("%20", " ");
        text = text.toLowerCase()
                .replaceAll("(%c3%a1|%c3%a4|%c3%a0|%c3%a2|%c3%81|%c3%84|%c3%80|%c3%82)", "a")
                .replaceAll("(%c3%a9|%c3%ab|%c3%a8|%c3%aa|%c3%89|%c3%8b|%c3%88|%c3%8a)", "e")
                .replaceAll("(%c3%ac|%c3%ad|%c3%ae|%c3%af|%c3%8c|%c3%8d|%c3%8e|%c3%8f)", "i")
                .replaceAll("(%c3%b3|%c3%b6|%c3%b2|%c3%b4|%c3%93|%c3%94|%c3%92|%c3%96)", "o")
                .replaceAll("(%c3%99|%c3%9a|%c3%9b|%c3%9c|%c3%b9|%c3%ba|%c3%bb|%c3%bc)", "u");

        return text;
    }

    /**
     * This method is called from the checkProductBarcode method. The idea of this method is to retrieve the information
     * of a product given its barcode, if the product exists it returns the information of it within a Product instance
     * and if it does not exist it returns a null value.
     */
    public Product checkBarcode(String barcode) throws SQLException {

        if (barcode != null)
        {
            if (barcode.isEmpty())
            {
                return null;
            } else
            {
                barcode = barcode.replaceAll("(^\"|\"$|%5B|%5D|%22|%20)", "");
                return searcher.searchProductByBarcode(barcode);
            }
        }else
        {
            return null;
        }
    }

    /**
     * This method is called from the checkProductIngredientName method. The idea of this method is to retrieve
     * information about a product or an ingredient given its name. The user provides us with a name without specifying
     * whether it is the name of a product or an ingredient. The purpose of this method is to query if there is a product
     * with the given name, and if it exists, return its information. Otherwise, it searches for an ingredient with the
     * specified name. If a product or ingredient exists, it returns a Map variable indicating whether it is a product or
     * an ingredient, along with the retrieved information. If it does not exist, it returns a null value.
     */
    public Map<String, Object> checkName(String name) throws SQLException {
        if(name == null){
            return null;
        }
        String nameSearched = textTransformer(name).replaceAll("(\\s|')", "");

        Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();

        product = searcher.searchProductByName(nameSearched);

        if (product == null)
        {
            ingredient = searcher.searchIngredient(nameSearched);

            if (ingredient != null)
            {
                resultToBeReturnedToFlutter.put("|Type", "Ingredient");
                resultToBeReturnedToFlutter.put("|Element", ingredient);

                return resultToBeReturnedToFlutter;
            }
            else
            {
                return null;
            }
        }
        else
        {
            resultToBeReturnedToFlutter.put("|Type", "Product");
            resultToBeReturnedToFlutter.put("|Element", product);

            return resultToBeReturnedToFlutter;
        }
    }

    /**
     * This method is used to save in the notFound table of the database the information of the product or ingredient
     * that a user has searched for and that does not exist in our database, and the user wishes to add it.
     */
    public void notFound() throws SQLException {
        if (searcher.getBarcode() != null)
        {
            db.insertNotFoundBarcode(searcher.getBarcode());
        }
        else
        {
            db.insertNotFoundName(searcher.getIngredientName());
        }
    }

    /**
     * This method is used to save in the 'incidents' table of the database the observation that the user indicates in
     * case he thinks that a result indicated by the application is incorrect. The objective is that the user can report
     * an issue and that it is saved in the database so that later the administrator can review the case and determine if
     * there is something wrong with the implementation or if there is any incorrect data in the database.
     */
    public void incident(String observation) throws SQLException {
        observation = textTransformer(observation);

        if (searcher.getBarcode() != null)
        {
            db.insertIncidentProduct(observation, searcher.getBarcode());
        }
        else if(searcher.getProductName() != null)
        {
            db.insertIncidentProduct(observation, product.getBarcode());
        }
        else
        {
            db.insertIncidentIngredient(observation, ingredient.getId());
        }
    }

    /**
     * This method is called from the WebServer when it receives a request for a barcode search from the application.
     * This method retrieves the product being searched for, then checks if the product meets the restrictions indicated
     * by the user, and finally returns the information of the product along with whether it is suitable. In case the
     * product does not exist, it returns null.
     */
    public Map<String, Object> checkProductBarcode(String barcode) throws SQLException {
        product = TaamApp.getInstance().checkBarcode(barcode);

        if (product != null && Configuration.getInstance().getUserRestrictionsList() != null) {
            Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();

            List<String> ingredientList = new ArrayList<>();
            for (Ingredient auxiliaryIngredient : product.getProductIngredientsList()) {
                ingredientList.add(auxiliaryIngredient.getIngredient());
            }

            resultToBeReturnedToFlutter.put("|Name", product.getProductName());
            resultToBeReturnedToFlutter.put("|Barcode", product.getBarcode());
            resultToBeReturnedToFlutter.put("|Image", product.getImage());
            resultToBeReturnedToFlutter.put("|Ingredients", ingredientList);

            int resultEdible = 0;
            List<String> nonSuitableIngredientsList = new ArrayList<>();
            List<String> doubtfulIngredientsList = new ArrayList<>();
            List<String> userRestrictionsList = Configuration.getInstance().getUserRestrictionsList();
            for (int counter = 0; counter < userRestrictionsList.size(); counter++) {
                visitor = Configuration.getInstance().createConfiguration(userRestrictionsList.get(counter));
                result = visitor.checkProduct(product.getProductIngredientsList());

                resultToBeReturnedToFlutter.put("|Restriction" + (counter+1), userRestrictionsList.get(counter));
                resultToBeReturnedToFlutter.put("|RestrictionEdible" + (counter+1), result.getResult().toString());

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
                resultToBeReturnedToFlutter.put("|Edible", SUITABLE);
            }
            else
            {
                if (resultEdible == 1)
                {
                    resultToBeReturnedToFlutter.put("|Edible", UNSUITABLE);
                }
                else
                {
                    resultToBeReturnedToFlutter.put("|Edible", DOUBTFUL);
                }

                resultToBeReturnedToFlutter.put("|ListIngredientsUNSUITABLE", nonSuitableIngredientsList);
                resultToBeReturnedToFlutter.put("|ListIngredientsDOUBTFUL", doubtfulIngredientsList);
            }

            return resultToBeReturnedToFlutter;
        }else
        {
            return null;
        }
    }

    /**
     * This method is called from the WebServer when it receives the search request by name from the application. This
     * method retrieves the product or ingredient being searched for, then checks if the product or ingredient meets the
     * restrictions indicated by the user, and finally returns the information about the searched product or ingredient
     * along with its suitability. If the product or ingredient does not exist, it returns null.
     */
    public Map<String, Object> checkProductIngredientName(String name) throws SQLException {
        Map<String, Object> resultToBeReturnedToFlutter = new HashMap<String, Object>();
        Map<String, Object> returnCheckName = new HashMap<String, Object>();
        returnCheckName = checkName(name);

        if (returnCheckName != null)
        {
            if (returnCheckName.get("|Type") == "Product")
            {
                product = (Product) returnCheckName.get("|Element");

                List<String> ingredientList = new ArrayList<>();
                for (Ingredient auxiliaryIngredient : product.getProductIngredientsList())
                {
                    ingredientList.add(auxiliaryIngredient.getIngredient());
                }

                resultToBeReturnedToFlutter.put("|Name", product.getProductName());
                resultToBeReturnedToFlutter.put("|Barcode", product.getBarcode());
                resultToBeReturnedToFlutter.put("|Image", product.getImage());
                resultToBeReturnedToFlutter.put("|Ingredients", ingredientList);

                List<String> restrictions = Configuration.getInstance().getUserRestrictionsList();

                int resultEdible = 0;
                List<String> nonSuitableIngredientsList = new ArrayList<>();
                List<String> doubtfulIngredientsList = new ArrayList<>();
                List<String> userRestrictionsList = Configuration.getInstance().getUserRestrictionsList();
                for (int counter = 0; counter < userRestrictionsList.size(); counter++)
                {
                    visitor = Configuration.getInstance().createConfiguration(restrictions.get(counter));
                    result = visitor.checkProduct(product.productIngredientsList);

                    resultToBeReturnedToFlutter.put("|Restriction" + (counter+1), userRestrictionsList.get(counter));
                    resultToBeReturnedToFlutter.put("|RestrictionEdible" + (counter+1), result.getResult().toString());

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
                    resultToBeReturnedToFlutter.put("|Edible", SUITABLE);
                }
                else
                {
                    if (resultEdible == 1)
                    {
                        resultToBeReturnedToFlutter.put("|Edible", UNSUITABLE);
                    }
                    else
                    {
                        resultToBeReturnedToFlutter.put("|Edible", DOUBTFUL);
                    }

                    resultToBeReturnedToFlutter.put("|ListIngredientsUNSUITABLE", nonSuitableIngredientsList);
                    resultToBeReturnedToFlutter.put("|ListIngredientsDOUBTFUL", doubtfulIngredientsList);
                }
            }
            else
            {
                ingredient = (Ingredient) returnCheckName.get("|Element");

                resultToBeReturnedToFlutter.put("|Name", ingredient.getIngredient());
                resultToBeReturnedToFlutter.put("|Id", ingredient.getId());

                List<String> restrictions = Configuration.getInstance().getUserRestrictionsList();

                int resultEdible = 0;
                List<String> userRestrictionsList = Configuration.getInstance().getUserRestrictionsList();
                for (int counter = 0; counter < userRestrictionsList.size(); counter++)
                {
                    visitor = Configuration.getInstance().createConfiguration(restrictions.get(counter));
                    result = visitor.checkIngredient(ingredient);

                    resultToBeReturnedToFlutter.put("|Restriction" + (counter+1), userRestrictionsList.get(counter));
                    resultToBeReturnedToFlutter.put("|RestrictionEdible" + (counter+1), result.getResult().toString());

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
                    resultToBeReturnedToFlutter.put("|Edible", SUITABLE);
                }
                else if (resultEdible == 1)
                {
                    resultToBeReturnedToFlutter.put("|Edible", UNSUITABLE);
                }
                else
                {
                    resultToBeReturnedToFlutter.put("|Edible", DOUBTFUL);
                }
            }

            return resultToBeReturnedToFlutter;
        }
        else
        {
            return null;
        }
    }

    /**
     * This method is called right after the user indicates their restrictions, the objective of this method is to
     * generate a list with all the products that are suitable for the user according to their restrictions and then
     * return 10 random products to the application to be shown as recommended products while the user indicates which
     * product or ingredient they are interested in searching for.
     */
    public Map<String, Object> recommendedProducts() throws SQLException {
        Map<String, Object> recommendedProductsMap = new HashMap<String, Object>();
        Map<String, Object> auxiliaryMap = new HashMap<String, Object>();
        recommendedProductsList.clear();

        ResultSet result = db.selectProductId();

        while (result.next())
        {
            auxiliaryMap = this.checkProductBarcode(result.getString("id"));
            if (auxiliaryMap.get("|Edible") == SUITABLE)
            {
                Product auxiliaryProduct = new Product();
                auxiliaryProduct.setProductName((String) auxiliaryMap.get("|Name"));
                auxiliaryProduct.setBarcode((String) auxiliaryMap.get("|Barcode"));
                auxiliaryProduct.setImage((String) auxiliaryMap.get("|Image"));

                recommendedProductsList.add(auxiliaryProduct);
            }
        }

        int counter = 0;
        while ((counter < recommendedProductsList.size()) && (counter < 10))
        {
            recommendedProductsMap.put("|Product" + (counter+1),
                    List.of(recommendedProductsList.get(counter).getProductName(), recommendedProductsList.get(counter).getBarcode(),
                            recommendedProductsList.get(counter).getImage()));
            counter = counter + 1;
        }

        return recommendedProductsMap;
    }

    /**
     *When recommended products are displayed to the user, the user can refresh this list to see new recommended products.
     * To achieve this, we have this method whose function is to take 10 random products from the list generated previously
     * by the recommendedProducts method.
     */
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
                recommendedProductsMap.put("|Product" + (counter+1),
                        List.of(recommendedProductsList.get(randomIndex).getProductName(), recommendedProductsList.get(randomIndex).getBarcode(),
                                recommendedProductsList.get(randomIndex).getImage()));
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
                recommendedProductsMap.put("|Product" + (counter+1),
                        List.of(recommendedProductsList.get(randomIndex).getProductName(), recommendedProductsList.get(randomIndex).getBarcode(),
                                recommendedProductsList.get(randomIndex).getImage()));
                counter = counter + 1;
            }
        }

        return recommendedProductsMap;
    }

    /**
     * This method is used to retrieve all the questions from the frequent_questions table and return them to the
     * application, allowing the frequently asked questions displayed on the screen to be dynamic. This method returns
     * the questions according to the language selected by the user in the configuration.
     */
    public Map<String, Object> getFrequentQuestions() throws SQLException {
        Map<String, Object> frequentquestions = new HashMap<>();

        ResultSet result = db.selectQuestions();
        while(result.next())
        {
            String question = result.getString("question_"+Configuration.getInstance().getLanguage());
            String id = result.getString("id");
            frequentquestions.put("|"+ id, question);
        }
        return frequentquestions;
    }

    /**
     * This method serves to return the answer to a specific question when the user clicks on a question in order to
     * know its answer. This method returns the answer according to the language that the user has previously indicated.
     */
    public Map<String, Object> getAnswer(String questionId) throws SQLException {
        Map<String, Object> answer = new HashMap<String, Object>();

        ResultSet result = db.selectAnswer(Integer.parseInt(questionId));
        while (result.next()) {
            String response = result.getString("response_"+Configuration.getInstance().getLanguage());
            answer.put("|Answer", response);
        }

        return answer;
    }

    /**
     * This method is used to save the user's question requests in the database so that the administrator can review and
     * decide which questions can be added to the frequent_questions table.
     */
    public void saveQuestion(String question) throws SQLException {
        question = textTransformer(question);
        db.insertQuestion(question);
    }

    public Map<String, Object> changeRestrictionsLanguage(String[] tokens)
    {
        return Configuration.getInstance().changeRestrictionsLanguage(tokens);
    }
}