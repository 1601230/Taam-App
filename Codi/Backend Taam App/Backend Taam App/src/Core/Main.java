package Core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) throws SQLException {
        Connection conn = ConnectDB.getConnection();
        Taam_App taam_app = Taam_App.getInstance(conn);
    }
}