package Core;

import java.util.ArrayList;
import java.util.List;

public class Configuration {
    private static Configuration instance = null;
    private String language = "spanish";
    private List<String> userRestrictionsList = new ArrayList<>();

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