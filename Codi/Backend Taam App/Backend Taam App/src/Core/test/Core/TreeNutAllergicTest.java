package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static Core.Edible.*;
import static org.junit.Assert.*;

public class TreeNutAllergicTest {

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
    public void checkProduct() throws SQLException
    {
        TreeNutAllergic tree_nut_allergic = new TreeNutAllergic();
        Result result = new Result();

        result = tree_nut_allergic.checkProduct(null);
        assertEquals(null, result);

        result = tree_nut_allergic.checkProduct(prepareIngredientList(" , 0"));
        assertEquals(null, result);

        result = tree_nut_allergic.checkProduct(prepareIngredientList("corn, 12, sugar, 13, barley malt, 14, salt, 8"));
        assertEquals(SUITABLE, result.getResult());

        //Falta modificar la BD
        /*
        result = tree_nut_allergic.checkProduct(prepareIngredientList("hand popped corn, 41, rapeseed oil, 42, sea salt, 25"));
        assertEquals(SUITABLE, result.getResult());
        */

        result = tree_nut_allergic.checkProduct(prepareIngredientList("protein blend, 79, wheat flour, 68, macadamia nuts, 80"));
        assertEquals(UNSUITABLE, result.getResult());
        assertTrue(equals(prepareIngredientList("macadamia nuts, 80"), result.nonSuitableIngredientsList));

        result = tree_nut_allergic.checkProduct(prepareIngredientList("red cranberries, 90, sugar, 13, sunflower oil, 49"));
        assertEquals(UNSUITABLE, result.getResult());
        assertTrue(equals(prepareIngredientList("red cranberries, 90"), result.nonSuitableIngredientsList));

        result = tree_nut_allergic.checkProduct(prepareIngredientList("whole corn kernels, 26, high oleic sunflower oil, 27, salt, 8"));
        assertEquals(DOUBTFUL, result.getResult());
        assertTrue(equals(prepareIngredientList("whole corn kernels, 26"), result.doubtfulIngredientsList));

        //En el nuevo init dudoso unicamente la vanilla
         /*
        result = tree_nut_allergic.checkProduct(prepareIngredientList("cocoa mass, 37, cocoa butter, 38, low fat cocoa powder, 39, sugar, 13, vanilla, 40"));
        assertEquals(DOUBTFUL, result.getResult());
        assertEquals("cocoa butter", result.doubtfulIngredientsList.get(0).getIngredient());
        assertEquals("vanilla", result.doubtfulIngredientsList.get(1).getIngredient());
        */
    }

    @Test
    public void checkIngredient() throws SQLException {
        TreeNutAllergic tree_nut_allergic = new TreeNutAllergic();
        Result result = new Result();
        Ingredient ingredient = new Ingredient();

        result = tree_nut_allergic.checkIngredient(null);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("   ");
        ingredient.setId(0);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("white sugar");
        ingredient.setId(1);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("wheat starch");
        ingredient.setId(4);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("wholemeal-oat-flour");
        ingredient.setId(16);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("wholemeal-oat-flour, 16"), result.nonSuitableIngredientsList));

        ingredient.setIngredient("hops");
        ingredient.setId(19);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("hops, 19"), result.nonSuitableIngredientsList));

        ingredient.setIngredient("emulsifier e471");
        ingredient.setId(6);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("emulsifier e471, 6"), result.doubtfulIngredientsList));

        ingredient.setIngredient("paprika");
        ingredient.setId(34);
        result = tree_nut_allergic.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertTrue(equals(prepareIngredientList("paprika, 34"), result.doubtfulIngredientsList));
    }
}