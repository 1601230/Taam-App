package Core;

import java.util.*;

/**
 * The Configuration class is an entity that stores all the information related to the configuration indicated by the
 * user, such as language or restrictions. This class implements the singleton pattern because we want there to be only
 * a single instance, and that this instance is accessible from anywhere in our program so that we know in which language
 * the user expects to receive the information or what restrictions the user has indicated when performing checks
 */
public class Configuration {
    private static Configuration instance = null;
    private String language = "english";
    private List<String> userRestrictionsList = new ArrayList<>();
    private List<String> restrictionsSpanishList = new ArrayList<>(Arrays.asList("Vegano", "Vegetariano", "Alérgico al gluten",
                                                                         "Alérgico a la lactosa", "Alérgico a los frutos secos", "Abstemio"));
    private List<String> restrictionsCatalanList = new ArrayList<>(Arrays.asList("Vegà", "Vegetarià", "Al·lèrgic al gluten",
                                                                         "Al·lèrgic a la lactosa", "Al·lèrgic a la fruita seca", "Abstemi"));
    private List<String> restrictionsEnglishList = new ArrayList<>(Arrays.asList("Vegan", "Vegetarian", "Allergic to gluten",
                                                                         "Allergic to lactose", "Allergic to nuts", "Teetotal"));

    /**
     * "Configuration" has a private constructor to create an instance of this class. It is private to prevent uncontrolled
     * instances from being created, as the aim is that only one instance is created and that the same instance is used at
     * all times.
     */
    private Configuration()
    {

    }

    /**
     * This method is used to retrieve the unique instance of the class "Configuration" (in case the instance is not
     * created, it is created using the private constructor).
     */
    public static Configuration getInstance()
    {
        if (instance == null) {
            instance = new Configuration();
        }
        return instance;
    }

    public String textTransformer(String text)
    {
        text = text.replaceAll("(^\"|\"$|%5B|%5D|%20|%22|%C2%B7|\\s)", "");
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
     * This method is used to return the instance of the restriction specified by the parameter. This method applies
     * the factory pattern, in this way an instance can be returned based on a string indicated by parameter.
     */
    public Visitor createConfiguration(String configuration)
    {
        if (configuration != null)
        {
            configuration = textTransformer(configuration);
            switch (configuration){
                case "vegan":
                case "vega":
                case "vegano":
                    return new Vegan();
                case "vegetarian":
                case "vegaria":
                case "vegetariano":
                    return new Vegetarian();
                case "allergictogluten":
                case "allergicalgluten":
                case "alergicoalgluten":
                    return new GlutenAllergic();
                case "allergictolactose":
                case "allergicalalactosa":
                case "alergicoalalactosa":
                    return new LactoseAllergic();
                case "allergictonuts":
                case "allergicalafruitaseca":
                case "alergicoalosfrutossecos":
                    return new TreeNutAllergic();
                case "teetotal":
                case "abstemi":
                case "abstemio":
                    return new Teetotal();
                default:
                    return null;
            }
        }else
        {
            return null;
        }
    }

    /**
     * This method is used to return the list of restrictions to the application in the language indicated by the user,
     * in this way we ensure that the list of restrictions shown to the user is dynamic according to the restrictions
     * implemented on the server.
     */
    public Map<String, Object> getRestrictionsList()
    {
        Map<String, Object> restrictionsList = new HashMap<String, Object>();

        switch (language){
            case "spanish":
                restrictionsList.put("|Restrictions List", restrictionsSpanishList);
                break;
            case "catalan":
                restrictionsList.put("|Restrictions List", restrictionsCatalanList);
                break;
            case "english":
                restrictionsList.put("|Restrictions List", restrictionsEnglishList);
                break;
            default:
                return null;
        }

        return restrictionsList;
    }

    public List<String> getUserRestrictionsList()
    {
        return userRestrictionsList;
    }

    public void setUserRestrictionsList(List<String> userRestrictionsList)
    {
        this.userRestrictionsList = userRestrictionsList;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language)
    {
        this.language = language;
    }
}