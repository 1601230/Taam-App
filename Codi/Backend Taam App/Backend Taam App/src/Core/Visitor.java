package Core;

import java.util.List;

public interface Visitor {
    public Result checkProduct(List<Ingredient> ingredientsList);
    public Result checkIngredient(Ingredient ingredient);
}
