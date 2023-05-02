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

public class LactoseAllergicTest {

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
        Lactose_Allergic lactose_allergic = new Lactose_Allergic();
        Result result = new Result();

        result = lactose_allergic.checkProduct(null);
        assertEquals(null, result);

        result = lactose_allergic.checkProduct(prepareIngredientList(" , 0"));
        assertEquals(null, result);

        result = lactose_allergic.checkProduct(prepareIngredientList("durum wheat semolina, 46, eggs, 47"));
        assertEquals(SUITABLE, result.getResult());

        result = lactose_allergic.checkProduct(prepareIngredientList("water, 18, sugar, 13, almonds, 104"));
        assertEquals(SUITABLE, result.getResult());

        result = lactose_allergic.checkProduct(prepareIngredientList("raw milk, 52, salt, 8, dairy ferments, 53"));
        assertEquals(UNSUITABLE, result.getResult());
        assertEquals(prepareIngredientList("raw milk, 52, dairy ferments, 53"), result.nonSuitableIngredientsList);

        result = lactose_allergic.checkProduct(prepareIngredientList("pasteurised milk, 111, salt, 8"));
        assertEquals(UNSUITABLE, result.getResult());
        assertEquals(prepareIngredientList("pasteurised milk, 111"), result.nonSuitableIngredientsList);

        result = lactose_allergic.checkProduct(prepareIngredientList("cocoa mass, 37, cocoa butter, 38, low fat cocoa powder, 39, sugar, 13, vanilla, 40"));
        assertEquals(DOUBTFUL, result.getResult());
        assertEquals(prepareIngredientList("cocoa mass, 37, cocoa butter, 38, low fat cocoa powder, 39"), result.doubtfulIngredientsList);

        result = lactose_allergic.checkProduct(prepareIngredientList("corn, 12, sugar, 13, barley malt, 14, salt, 8"));
        assertEquals(DOUBTFUL, result.getResult());
        assertEquals(prepareIngredientList("corn, 12"), result.doubtfulIngredientsList);
    }

    @Test
    public void checkIngredient() throws SQLException {
        Lactose_Allergic lactose_allergic = new Lactose_Allergic();
        Result result = new Result();
        Ingredient ingredient = new Ingredient();

        result = lactose_allergic.checkIngredient(null);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("   ");
        ingredient.setId(0);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(null, result);

        ingredient.setIngredient("maize flour");
        ingredient.setId(5);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("vodka");
        ingredient.setId(86);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(SUITABLE, result.getResult());

        ingredient.setIngredient("butter");
        ingredient.setId(117);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals(prepareIngredientList("butter, 117"), result.nonSuitableIngredientsList);

        ingredient.setIngredient("melted cheese");
        ingredient.setId(120);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(UNSUITABLE, result.getResult());
        Assert.assertEquals(prepareIngredientList("melted cheese, 120"), result.nonSuitableIngredientsList);

        ingredient.setIngredient("wheat starch");
        ingredient.setId(4);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertEquals(prepareIngredientList("wheat starch, 4"), result.doubtfulIngredientsList);

        ingredient.setIngredient("pure butter fat");
        ingredient.setId(83);
        result = lactose_allergic.checkIngredient(ingredient);
        Assert.assertEquals(DOUBTFUL, result.getResult());
        Assert.assertEquals(prepareIngredientList("pure butter fat, 83"), result.doubtfulIngredientsList);
    }
}