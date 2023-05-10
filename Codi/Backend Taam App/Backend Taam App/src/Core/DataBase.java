package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * The DataBase class is responsible for having all the necessary methods to carry out all select and insert queries to
 * the database. The objective is to abstract in the rest of the code the way in which the queries to the database are
 * carried out and that these queries are carried out from the same place to make it easier to modify them.
 */
public class DataBase {

    public DataBase()
    {

    }

    public ResultSet selectProductName(String barcode) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        PreparedStatement stmt = conn.prepareStatement("SELECT name, image FROM public.products WHERE id=?");
        stmt.setString(1, barcode);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectProductIngredientsId(String barcode) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        PreparedStatement stmt = conn.prepareStatement("SELECT ingredient_id FROM public.products_ingredients WHERE product_id=?");
        stmt.setString(1, barcode);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectProductIngredientName(Integer ingredient_id) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        PreparedStatement stmt = conn.prepareStatement("SELECT name_" + Configuration.getInstance().getLanguage() + " FROM public.ingredients WHERE id=?");
        stmt.setInt(1, ingredient_id);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectProductIdName() throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "SELECT id, name, image FROM public.products;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectProductId() throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "SELECT id FROM public.products;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectIngredientIdName() throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "SELECT id, name_" + Configuration.getInstance().getLanguage() + " FROM public.ingredients;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectQuestions() throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "SELECT id, question_" + Configuration.getInstance().getLanguage() + " FROM frequent_questions;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public ResultSet selectAnswer(int questionId) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "SELECT response_" + Configuration.getInstance().getLanguage() + " FROM public.frequent_questions WHERE id=?;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, questionId);
        ResultSet result = stmt.executeQuery();

        return result;
    }

    public void insertQuestion(String question) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "INSERT INTO public.question_requests(question_user) VALUES (?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, question);
        stmt.executeUpdate();
    }

    public void insertNotFoundBarcode(String barcode) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "INSERT INTO public.notfound(barcode) VALUES (?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, barcode);
        stmt.executeUpdate();
    }

    public void insertNotFoundName(String name) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "INSERT INTO public.notfound(name) VALUES (?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.executeUpdate();
    }

    public void insertIncidentProduct(String observation, String barcode) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "INSERT INTO public.incidents(observation, product_id) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, observation);
        stmt.setString(2, barcode);
        stmt.executeUpdate();
    }

    public void insertIncidentIngredient(String observation, Integer id) throws SQLException {
        Connection conn = ConnectDB.getConnection();

        String sql = "INSERT INTO public.incidents(observation, ingredient_id) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, observation);
        stmt.setInt(2, id);
        stmt.executeUpdate();
    }
}
