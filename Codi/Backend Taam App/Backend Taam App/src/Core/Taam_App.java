package Core;

import java.sql.Connection;

public class Taam_App {
    private static Taam_App instance = null;
    private static Connection conn = null;
    private static Configuration configuration;
    public static Searcher searcher;
    public static Product product;
    public static Result result;
    public static Recommendations recommendations;
    public static Visitor visitor;

    private Taam_App()
    {

    }

    public static Taam_App getInstance(Connection connection)
    {
        if (instance == null) {
            instance = new Taam_App();
        }
        conn = connection;
        return instance;
    }
}
