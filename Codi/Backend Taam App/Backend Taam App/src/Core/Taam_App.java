package Core;

public class Taam_App {
    private static Taam_App instance = null;

    private Taam_App()
    {

    }

    public static Taam_App getInstance()
    {
        if (instance == null) {
            instance = new Taam_App();
        }
        return instance;
    }
}
