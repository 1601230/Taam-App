package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static Core.Edible.*;
import static org.junit.Assert.*;

public class VeganTest {

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
        Vegan vegan = new Vegan();
        Result result = new Result();

        result = vegan.checkProduct(null);
        Assert.assertEquals(null, result);

        result = vegan.checkProduct(prepareIngredientList(" , 0"));
        Assert.assertEquals(null, result);

        result = vegan.checkProduct(prepareIngredientList("white sugar, 1"));
        Assert.assertEquals(SUITABLE, result.getResult());

        result = vegan.checkProduct(prepareIngredientList("corn, 12, sugar, 13, barley malt, 14, salt, 8"));
        Assert.assertEquals(SUITABLE, result.getResult());

        result = vegan.checkProduct(prepareIngredientList("durum wheat semolina, 46, eggs, 47"));
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals("eggs", result.nonSuitableIngredientsList.get(0).getIngredient());

        result = vegan.checkProduct(prepareIngredientList("raw milk, 52, salt, 8, dairy ferments, 53"));
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals("raw milk", result.nonSuitableIngredientsList.get(0).getIngredient());
        Assert.assertEquals("dairy ferments", result.nonSuitableIngredientsList.get(1).getIngredient());

        result = vegan.checkProduct(prepareIngredientList("whole milk, 54, salt, 8, microbial cultures, 61, microbial rennet, 62"));
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals("whole milk", result.nonSuitableIngredientsList.get(0).getIngredient());
        Assert.assertEquals("microbial cultures", result.doubtfulIngredientsList.get(0).getIngredient());
        Assert.assertEquals("microbial rennet", result.doubtfulIngredientsList.get(1).getIngredient());

        result = vegan.checkProduct(prepareIngredientList("sugar, 13, natural defatted cocoa powder, 70, salt, 8, vitamine-c, 71, vitamine-d, 72, natural-flavouring, 73, soya-lecithin, 74, cinnamon, 75"));
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertEquals("natural-flavouring", result.doubtfulIngredientsList.get(0).getIngredient());
    }

    @Test
    public void checkIngredient() throws SQLException {
        Vegan vegan = new Vegan();
        Result result = new Result();
        Ingredient ingredient = new Ingredient();

        result = vegan.checkIngredient(null);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("   ");
        ingredient.setId(0);
        result = vegan.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("white sugar");
        ingredient.setId(1);
        result = vegan.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("virgin-olive-oil");
        ingredient.setId(23);
        result = vegan.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("skimmed-milk powder");
        ingredient.setId(81);
        result = vegan.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals("skimmed-milk powder", result.nonSuitableIngredientsList.get(0).getIngredient());

        ingredient.setIngredient("sweetened and skimmed condensed milk");
        ingredient.setId(87);
        result = vegan.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals("sweetened and skimmed condensed milk", result.nonSuitableIngredientsList.get(0).getIngredient());

        ingredient.setIngredient("roasted peanuts 90%");
        ingredient.setId(48);
        result = vegan.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertEquals("roasted peanuts 90%", result.doubtfulIngredientsList.get(0).getIngredient());
    }
}