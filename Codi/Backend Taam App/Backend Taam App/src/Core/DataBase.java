package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public ResultSet insertQuestion() throws SQLException {
        return null;
    }
}
