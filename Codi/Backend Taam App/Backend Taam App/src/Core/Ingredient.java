package Core;

public class Ingredient {

    private String ingredient;
    private Integer id;

    Ingredient() {}

    Ingredient(String ingredient, Integer id)
    {
        this.ingredient = ingredient;
        this.id = id;
    }

    public String getIngredient(){
        return ingredient;
    }
}
