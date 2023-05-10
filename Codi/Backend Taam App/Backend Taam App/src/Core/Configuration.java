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

    /**
     * This method is used to return the instance of the restriction specified by the parameter. This method applies
     * the factory pattern, in this way an instance can be returned based on a string indicated by parameter.
     */
    public Visitor createConfiguration(String configuration)
    {
        if (configuration != null)
        {
            configuration = configuration.replaceAll("(^\"|\"$|%5B|%5D|%20|%22|\\s)", "").toLowerCase();
            switch (configuration){
                case "vegan": return new Vegan();
                case "vegetarian": return new Vegetarian();
                case "allergictogluten": return new GlutenAllergic();
                case "allergictolactose": return new LactoseAllergic();
                case "allergictonuts": return new TreeNutAllergic();
                case "teetotal": return new Teetotal();
                default: return null;
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