package Core;

import java.sql.*;

/**
 * The ConnectDB class is responsible for establishing the connection with the locally implemented database, which
 * allows us to execute queries to the database with the goal of retrieving information such as product ingredients.
 * This class implements the singleton pattern to ensure that there is only one instance of this class and that the
 * connection is made only once, as well as allowing requests to the database to be sent from any location in the
 * program.
 */
public class ConnectDB {
    private static ConnectDB instance = null;
    private static Connection conn = null;
    private final String url = "jdbc:postgresql://localhost:5432/TaamAppDB";
    private final String user = "taamapp";
    private final String password = "taamapp";

    /**
     * "ConnectDB" has a private constructor to create an instance of this class. It is private to prevent uncontrolled
     * instances from being created, as the aim is that only one instance is created and that the same instance is used at
     * all times. In this constructor, the connection to the database is established and this connection is saved in a
     * variable 'conn' so that later we can retrieve the connection and perform queries to the DB.
     */
    private ConnectDB() {
        try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * This method is used to retrieve the unique instance of the class "ConnectDB" (in case the instance is not
     * created, it is created using the private constructor).
     */
    public static Connection getConnection() {
        if (instance == null) {
            instance = new ConnectDB();
        }
        return conn;
    }
}

