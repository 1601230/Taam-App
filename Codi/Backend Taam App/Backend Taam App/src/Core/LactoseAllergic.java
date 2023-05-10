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

/**
 * The LactoseAllergic class is responsible for indicating whether a given product or ingredient is suitable for a person
 * allergic to lactose. This class applies the visitor pattern because the idea is to inherit the two methods that need
 * to be implemented from the Visitor class, so that a variable of type Visitor can be called regardless of what type of
 * restriction it is, making the code dynamic with respect to the restrictions that are added or removed.
 */
public class LactoseAllergic implements Visitor{

    @Override
    public Result checkProduct(List<Ingredient> ingredientsList) throws SQLException {

        if(ingredientsList == null){
            return null;

        }
        Connection conn = ConnectDB.getConnection();
        Result result = new Result();

        boolean ingredientFound = false;

        for (Ingredient ingredient : ingredientsList) {
            PreparedStatement stmt = conn.prepareStatement("SELECT lactose FROM public.ingredients WHERE id=?");
            stmt.setInt(1, ingredient.getId());
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                if (res.getInt("lactose") == 0)
                {
                    result.nonSuitableIngredientsList.add(ingredient);
                } else if (res.getInt("lactose") == 2)
                {
                    result.doubtfulIngredientsList.add(ingredient);
                }
                ingredientFound = true;
            }
        }

        if(ingredientFound == false){
            return null;
        }
        if (!result.nonSuitableIngredientsList.isEmpty())
        {
            result.setResult(UNSUITABLE);
        }else if (!result.doubtfulIngredientsList.isEmpty())
        {
            result.setResult(DOUBTFUL);
        }else
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

        Connection conn = ConnectDB.getConnection();
        Result result = new Result();

        PreparedStatement stmt = conn.prepareStatement("SELECT lactose FROM public.ingredients WHERE id=?");
        stmt.setInt(1, ingredient.getId());
        ResultSet res = stmt.executeQuery();

        boolean ingredientFound = false;

        while (res.next()) {
            if (res.getInt("lactose") == 0)
            {
                result.nonSuitableIngredientsList.add(ingredient);
            } else if (res.getInt("lactose") == 2)
            {
                result.doubtfulIngredientsList.add(ingredient);
            }
            ingredientFound = true;
        }

        if(ingredientFound == false){
            return null;
        }
        if (!result.nonSuitableIngredientsList.isEmpty())
        {
            result.setResult(UNSUITABLE);
        }else if (!result.doubtfulIngredientsList.isEmpty())
        {
            result.setResult(DOUBTFUL);
        }else
        {
            result.setResult(SUITABLE);
        }

        return result;
    }
}
