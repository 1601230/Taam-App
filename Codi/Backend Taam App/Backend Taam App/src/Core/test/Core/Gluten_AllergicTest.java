package Core;

import org.junit.Test;

import java.sql.SQLException;
import java.util.*;

import static org.junit.Assert.*;



public class Gluten_AllergicTest {

    public List<Ingredient> setUp(String test)
    {
        Map<Integer,String> ingredients = new HashMap<>();
        List<Ingredient> ingredientsList = new ArrayList<Ingredient>();

        switch (test){

            case "existent":
                    ingredients.put(8, "sal");
                    ingredients.put(63, "salmon");
                    ingredients.put(64, "humo de leña de haya");

                for (Map.Entry<Integer, String> entry : ingredients.entrySet()) {
                    ingredientsList.add(new Ingredient(entry.getValue(), entry.getKey()));
                }
                break;
        }
        return ingredientsList;
    }

    @Test
    public void checkProduct() throws SQLException {
        Gluten_Allergic gluten_allergic = new Gluten_Allergic();
        Result result = new Result();

        //existent ingredientList
        List<Ingredient> ingredientsList = setUp("existent");
        result = gluten_allergic.checkProduct(ingredientsList);

        //fer assert


    }

    @Test
    public void checkIngredient() {
    }
}