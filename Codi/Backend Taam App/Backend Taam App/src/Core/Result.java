package Core;

import java.util.ArrayList;
import java.util.List;

public class Result {
    private Edible result;
    List<Ingredient> nonSuitableIngredientsList = new ArrayList<>();
    List<Ingredient> doubtfulIngredientsList = new ArrayList<>();

    public Edible getResult()
    {
        return result;
    }
    public List<Ingredient> getNonSuitableIngredientsList()
    {
        return nonSuitableIngredientsList;
    }
    public List<Ingredient> getDoubtfulIngredientsList()
    {
        return doubtfulIngredientsList;
    }

    public void setResult(Edible result)
    {
        this.result = result;
    }
}
