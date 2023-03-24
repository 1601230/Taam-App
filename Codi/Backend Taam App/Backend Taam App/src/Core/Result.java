package Core;

import java.util.ArrayList;
import java.util.List;

public class Result {
    private boolean successfulSearch;
    private Edible result;
    List<Ingredient> nonSuitableIngredientsList = new ArrayList<>();
    List<Ingredient> doubtfulIngredientsList = new ArrayList<>();
}
