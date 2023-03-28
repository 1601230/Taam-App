package Core;

import java.util.ArrayList;
import java.util.List;

public class Configuration {
    private static Configuration instance = null;
    private String language = "spanish";
    private List<Restriction> userRestrictionsList = new ArrayList<>();

    private Configuration()
    {

    }
    public Visitor createConfiguration(String configuration)
    {
         switch (configuration){ // queda pendent mirar si aqui ficat un possible Restriction r.getResticcio()
             case "Vegan": return new Vegan();
             case "Vegetarian": return new Vegetarian();
             case "Gluten Allergic": return new Gluten_Allergic();
             case "Lactose Allergic": return new Lactose_Allergic();
             case "Tree Nut Allergic": return new Tree_Nut_Allergic();
             case "Teetotal": return new Teetotal();
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
}
