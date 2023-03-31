package Core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import static Core.Edible.*;

public class Vegan implements Visitor{

    @Override
    public Result checkProduct(List<Ingredient> ingredientsList) throws SQLException {

        Connection conn = ConnectDB.getConnection();
        Result result = new Result();

        for (Ingredient ingredient : ingredientsList) {
            PreparedStatement stmt = conn.prepareStatement("SELECT vegan FROM public.ingredients WHERE id=?");
            stmt.setInt(1, ingredient.getId());
            ResultSet res = stmt.executeQuery();

            while (res.next()) {
                if (res.getInt("vegan") == 1)
                {
                    result.nonSuitableIngredientsList.add(ingredient);
                } else if (res.getInt("vegan") == 2)
                {
                    result.doubtfulIngredientsList.add(ingredient);
                }
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
        }
        return result;
    }

    @Override
    public Result checkIngredient(Ingredient ingredient) throws SQLException {
        Connection conn = ConnectDB.getConnection();
        Result result = new Result();

        PreparedStatement stmt = conn.prepareStatement("SELECT vegan FROM public.ingredients WHERE id=?");
        stmt.setInt(1, ingredient.getId());
        ResultSet res = stmt.executeQuery();

        while (res.next()) {
            if (res.getInt("vegan") == 1)
            {
                result.nonSuitableIngredientsList.add(ingredient);
            } else if (res.getInt("vegan") == 2)
            {
                result.doubtfulIngredientsList.add(ingredient);
            }
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
