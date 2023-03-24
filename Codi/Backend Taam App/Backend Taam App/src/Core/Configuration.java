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

    public static Configuration getInstance()
    {
        if (instance == null) {
            instance = new Configuration();
        }
        return instance;
    }
}
