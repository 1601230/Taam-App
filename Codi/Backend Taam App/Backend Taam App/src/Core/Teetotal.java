package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static Core.Edible.*;

/**
 * Meaning of the values associated with the ingredients in the database:
 * 0: SUITABLE
 * 1: UNSUITABLE
 * 2: DOUBTFUL
 */

/**
 * The Teetotal class is responsible for indicating whether a given product or ingredient is suitable for a person who
 * doesn't drink alcohol and doesn't eat products or ingredients made with it or its derivatives. This class applies the
 * visitor pattern because the idea is to inherit the two methods that need to be implemented from the Visitor class, so
 * that a variable of type Visitor can be called regardless of what type of restriction it is, making the code dynamic
 * with respect to the restrictions that are added or removed.
 */
public class Teetotal implements Visitor{

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
            String sql = "SELECT teetotal FROM public.ingredients WHERE id=?;";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, ingredient.getId());
            ResultSet resultOfTheConsultation = stmt.executeQuery();

            while (resultOfTheConsultation.next())
            {
                if (resultOfTheConsultation.getInt("teetotal") == 1)
                {
                    result.nonSuitableIngredientsList.add(ingredient);
                }
                else if (resultOfTheConsultation.getInt("teetotal") == 2)
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

        String sql = "SELECT teetotal FROM public.ingredients WHERE id=?;";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, ingredient.getId());
        ResultSet resultOfTheConsultation = stmt.executeQuery();

        boolean ingredientFound = false;

        while (resultOfTheConsultation.next())
        {
            if (resultOfTheConsultation.getInt("teetotal") == 1)
            {
                result.nonSuitableIngredientsList.add(ingredient);
            }
            else if (resultOfTheConsultation.getInt("teetotal") == 2)
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
