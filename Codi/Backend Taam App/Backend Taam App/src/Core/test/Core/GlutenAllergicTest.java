package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.*;

import static Core.Edible.*;
import static org.junit.Assert.*;



public class GlutenAllergicTest {

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
        GlutenAllergic gluten_allergic = new GlutenAllergic();
        Result result = new Result();

        //suitable ingredientList
        result = gluten_allergic.checkProduct(prepareIngredientList("sal, 8, salmon, 63, humo de leña de haya, 64"));
        assertEquals(SUITABLE, result.getResult());

        //non-suitable ingredientList, null, empty...
        result = gluten_allergic.checkProduct(null);
        assertEquals(null, result);

        List<Ingredient> ingredientlist = new ArrayList<>();
        result = gluten_allergic.checkProduct(ingredientlist);
        assertEquals(null, result);

        result = gluten_allergic.checkProduct(prepareIngredientList("maiz, 44, azucar, 13, malta de cebada, 14, sal, 8"));
        assertEquals(UNSUITABLE, result.getResult());
        assertTrue(equals(prepareIngredientList("malta de cebada, 14"), result.nonSuitableIngredientsList));

        result = gluten_allergic.checkProduct(prepareIngredientList("granos de maiz enteros, 26, aceite de girasol alto oleico, 27, sal, 8"));
        assertEquals(DOUBTFUL, result.getResult());
        assertTrue(equals(prepareIngredientList("granos de maiz enteros, 26, aceite de girasol alto oleico, 27"), result.doubtfulIngredientsList));

        result = gluten_allergic.checkProduct(prepareIngredientList("palomitas de maiz, 41, aceite de colza, 42, sal marina, 25"));
        assertEquals(DOUBTFUL, result.getResult());
        assertTrue(equals(prepareIngredientList("palomitas de maiz, 41"), result.doubtfulIngredientsList));
        assertTrue(result.nonSuitableIngredientsList.isEmpty());
    }

    @Test
    public void checkIngredient() throws SQLException {
        GlutenAllergic gluten_allergic = new GlutenAllergic();
        Result result = new Result();
        Ingredient ingredient = new Ingredient();

        result = gluten_allergic.checkIngredient(null);
        Assert.assertEquals(null, result);

        result = gluten_allergic.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("");
        ingredient.setId(0);
        result = gluten_allergic.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("maize flour");
        ingredient.setId(1);
        result = gluten_allergic.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("harina de arroz");
        ingredient.setId(3);
        result = gluten_allergic.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        assertTrue(equals(prepareIngredientList("harina de arroz, 3"), result.nonSuitableIngredientsList));

        ingredient.setIngredient("extracto de levadura");
        ingredient.setId(9);
        result = gluten_allergic.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        assertTrue(equals(prepareIngredientList("extracto de levadura, 9"), result.doubtfulIngredientsList));
    }
}