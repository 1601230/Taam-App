package Core;

import java.util.*;

public class Configuration {
    private static Configuration instance = null;
    private String language = "spanish";
    private List<String> userRestrictionsList = new ArrayList<>();

    List<String> restrictionsSpanishList = new ArrayList<>(Arrays.asList("Vegano", "Vegetariano", "Alérgico al gluten",
                                                                         "Alérgico a la lactosa", "Alérgico a los frutos secos", "Abstemio"));
    List<String> restrictionsCatalanList = new ArrayList<>(Arrays.asList("Vegà", "Vegetarià", "Al·lèrgic al gluten",
                                                                         "Al·lèrgic a la lactosa", "Al·lèrgic a la fruita seca", "Abstemi"));
    List<String> restrictionsEnglishList = new ArrayList<>(Arrays.asList("Vegan", "Vegetarian", "Allergic to gluten",
                                                                         "Allergic to lactose", "Allergic to nuts", "Teetotal"));

    private Configuration()
    {

    }
    public Visitor createConfiguration(String configuration)
    {
        switch (configuration){
            case "vegan": return new Vegan();
            case "vegetarian": return new Vegetarian();
            case "gluten": return new Gluten_Allergic();
            case "lactose": return new Lactose_Allergic();
            case "treenut": return new Tree_Nut_Allergic();
            case "teetotal": return new Teetotal();
            default: return null;
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