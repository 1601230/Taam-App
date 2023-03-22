package Core;

import java.sql.*;

public class ConnectDB {
    private static ConnectDB instance = null;
    private static Connection conn = null;
    private final String url = "jdbc:postgresql://localhost:5432/TaamAppDB";
    private final String user = "taamapp";
    private final String password = "taamapp";

    private ConnectDB() {
        try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        if (instance == null) {
            instance = new ConnectDB();
        }
        return conn;
    }
}

