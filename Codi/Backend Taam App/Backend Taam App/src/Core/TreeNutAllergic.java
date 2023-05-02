package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static Core.Edible.*;

/**
 * Meaning of the values associated with the ingredients in the database:
 * 0: UNSUITABLE
 * 1: SUITABLE
 * 2: DOUBTFUL
 */

public class TreeNutAllergic implements Visitor{

    @Override
    public Result checkProduct(List<Ingredient> ingredientsList) throws SQLException {
        if(ingredientsList == null){
            return null;
        }

        Result result = new Result();
        Connection conn = ConnectDB.getConnection();

        boolean ingredientFound = false;
        for (Ingredient ingredient : ingredientsList)
        {
            String sql = "SELECT nuts FROM public.ingredients WHERE id=?;";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, ingredient.getId());
            ResultSet resultOfTheConsultation = stmt.executeQuery();

            while (resultOfTheConsultation.next())
            {
                if (resultOfTheConsultation.getInt("nuts") == 0)
                {
                    result.nonSuitableIngredientsList.add(ingredient);
                }
                else if (resultOfTheConsultation.getInt("nuts") == 2)
                {
                    result.doubtfulIngredientsList.add(ingredient);
                }
                ingredientFound = true;
            }
        }

        if(ingredientFound == false){
            return null;
        }
        if (result.nonSuitableIngredientsList.size() != 0)
        {
            result.setResult(UNSUITABLE);
        }
        else if (result.doubtfulIngredientsList.size() != 0)
        {
            result.setResult(DOUBTFUL);
        }
        else
        {
            result.setResult(SUITABLE);
        }

        return result;
    }

    @Override
    public Result checkIngredient(Ingredient ingredient) throws SQLException {

        if(ingredient == null){
            return null;
        }

        Result result = new Result();
        Connection conn = ConnectDB.getConnection();

        String sql = "SELECT nuts FROM public.ingredients WHERE id=?;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, ingredient.getId());
        ResultSet resultOfTheConsultation = stmt.executeQuery();

        boolean ingredientFound = false;

        while (resultOfTheConsultation.next())
        {
            if (resultOfTheConsultation.getInt("nuts") == 0)
            {
                result.nonSuitableIngredientsList.add(ingredient);
            }
            else if (resultOfTheConsultation.getInt("nuts") == 2)
            {
                result.doubtfulIngredientsList.add(ingredient);
            }

            ingredientFound = true;
        }

        if(ingredientFound == false){
            return null;
        }
        if (result.nonSuitableIngredientsList.size() != 0)
        {
            result.setResult(UNSUITABLE);
        }
        else if (result.doubtfulIngredientsList.size() != 0)
        {
            result.setResult(DOUBTFUL);
        }
        else
        {
            result.setResult(SUITABLE);
        }

        return result;
    }
}
