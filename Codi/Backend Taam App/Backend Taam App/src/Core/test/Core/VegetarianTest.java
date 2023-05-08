package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static Core.Edible.*;
import static org.junit.Assert.*;

public class VegetarianTest {

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

    public boolean equals(List<Ingredient> expected, List<Ingredient> returned)
    {
        if(expected.size() == returned.size())
        {
            for(int i = 0; i < expected.size(); i++)
            {
                if(expected.get(i).getId() != returned.get(i).getId() || !expected.get(i).getIngredient().equals(returned.get(i).getIngredient()))
                {
                    return false;
                }
            }
            return true;
        }else
        {
            return false;
        }
    }

    @Test
    public void checkProduct() throws SQLException {
        Vegetarian vegetarian = new Vegetarian();
        Result result = new Result();

        result = vegetarian.checkProduct(null);
        Assert.assertEquals(null, result);

        result = vegetarian.checkProduct(prepareIngredientList(" , 0"));
        Assert.assertEquals(null, result);

        result = vegetarian.checkProduct(prepareIngredientList("white sugar, 1"));
        Assert.assertEquals(SUITABLE, result.getResult());

        result = vegetarian.checkProduct(prepareIngredientList("durum wheat semolina, 46, eggs, 47"));
        Assert.assertEquals(SUITABLE, result.getResult());

        result = vegetarian.checkProduct(prepareIngredientList("salmon, 63, salt, 8, haya wood smoke, 64"));
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("salmon, 63"), result.nonSuitableIngredientsList));

        result = vegetarian.checkProduct(prepareIngredientList("mackerel, 65, olive oil, 29"));
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("mackerel, 65"), result.nonSuitableIngredientsList));

        result = vegetarian.checkProduct(prepareIngredientList("sugar, 13, natural defatted cocoa powder, 70, salt, 8, vitamine-c, 71, vitamine-d, 72, natural-flavouring, 73, soya-lecithin, 74, cinnamon, 75"));
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("natural-flavouring, 73"), result.doubtfulIngredientsList));
    }

    @Test
    public void checkIngredient() throws SQLException {
        Vegetarian vegetarian = new Vegetarian();
        Result result = new Result();
        Ingredient ingredient = new Ingredient();

        result = vegetarian.checkIngredient(null);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("   ");
        ingredient.setId(0);
        result = vegetarian.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("white sugar");
        ingredient.setId(1);
        result = vegetarian.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("eggs");
        ingredient.setId(47);
        result = vegetarian.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("chicken breast");
        ingredient.setId(105);
        result = vegetarian.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("chicken breast, 105"), result.nonSuitableIngredientsList));

        ingredient.setIngredient("beef meat");
        ingredient.setId(115);
        result = vegetarian.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("beef meat, 115"), result.nonSuitableIngredientsList));

        ingredient.setIngredient("natural-flavouring");
        ingredient.setId(73);
        result = vegetarian.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("natural-flavouring, 73"), result.doubtfulIngredientsList));
    }
}