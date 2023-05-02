package Core;

import java.util.*;

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

    private Configuration()
    {

    }
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

    public static Configuration getInstance()
    {
        if (instance == null) {
            instance = new Configuration();
        }
        return instance;
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