package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static Core.Edible.*;
import static Core.Edible.DOUBTFUL;
import static org.junit.Assert.*;

public class TeetotalTest {

    public List<Ingredient> prepareIngredientList(String ingredients)
    {
        List<Ingredient> result = new ArrayList<>();
        String[] array = ingredients.split(", ");
        List<String> ingredientsList = Arrays.asList(array);

        for (int counter = 0; counter < ingredientsList.size(); counter = counter + 2)
        {
            Ingredient ingredient = new Ingredient();
            ingredient.setIngredient(ingredientsList.get(counter));
            ingredient.setId(Integer.valueOf(ingredientsList.get(counter + 1)));

            result.add(ingredient);
        }

        return result;
    }

    @Test
    public void checkProduct() throws SQLException {
        Teetotal teetotal = new Teetotal();
        Result result = new Result();

        result = teetotal.checkProduct(null);
        assertEquals(null, result);

        result = teetotal.checkProduct(prepareIngredientList(" , 0"));
        assertEquals(null, result);

        result = teetotal.checkProduct(prepareIngredientList("corn, 12, sea salt, 25"));
        assertEquals(SUITABLE, result.getResult());

        result = teetotal.checkProduct(prepareIngredientList("walnuts, 57, hazelnuts, 58, cashews, 59, blanched almonds, 60"));
        assertEquals(SUITABLE, result.getResult());

        result = teetotal.checkProduct(prepareIngredientList("barley malt, 14, water, 18, corn, 12, hops, 19, alcohol, 114"));
        assertEquals(UNSUITABLE, result.getResult());
        assertEquals(prepareIngredientList("alcohol, 114"), result.nonSuitableIngredientsList);

        result = teetotal.checkProduct(prepareIngredientList("chocolate, 76, licor, 77, cherries, 78, sugar, 13"));
        assertEquals(UNSUITABLE, result.getResult());
        assertEquals(prepareIngredientList("licor, 77"), result.nonSuitableIngredientsList);
    }

    @Test
    public void checkIngredient() throws SQLException {
        Teetotal teetotal = new Teetotal();
        Result result = new Result();
        Ingredient ingredient = new Ingredient();

        result = teetotal.checkIngredient(null);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("   ");
        ingredient.setId(0);
        result = teetotal.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("hazelnuts");
        ingredient.setId(58);
        result = teetotal.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("durum wheat semolina");
        ingredient.setId(46);
        result = teetotal.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("bourbon vanilla powder");
        ingredient.setId(95);
        result = teetotal.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals(prepareIngredientList("bourbon vanilla powder, 95"), result.nonSuitableIngredientsList);

        ingredient.setIngredient("whiskey");
        ingredient.setId(89);
        result = teetotal.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals(prepareIngredientList("whiskey, 89"), result.nonSuitableIngredientsList);
    }
}