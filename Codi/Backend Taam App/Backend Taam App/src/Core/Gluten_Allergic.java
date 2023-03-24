package Core;

import java.util.List;

public class Gluten_Allergic implements Visitor{

    @Override
    public Result checkProduct(List<Ingredient> ingredientsList) {
        return null;
    }

    @Override
    public Result checkIngredient(Ingredient ingredient) {
        return null;
    }
}
