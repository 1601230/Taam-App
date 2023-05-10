package Core;

import java.util.ArrayList;
import java.util.List;

/**
 * The Result class is used to store the information obtained after checking the product or ingredient specified by the
 * user. After performing the checks, a lot of information is generated such as whether the product is suitable/not
 * suitable/doubtful, which ingredients make the product unsuitable (if it is unsuitable), and which ingredients make
 * the product doubtful (if it is doubtful). The idea is to store all this information in a single instance and then
 * access this information with getters.
 */
public class Result {
    private Edible result;
    List<Ingredient> nonSuitableIngredientsList = new ArrayList<>();
    List<Ingredient> doubtfulIngredientsList = new ArrayList<>();

    public Edible getResult(){
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


