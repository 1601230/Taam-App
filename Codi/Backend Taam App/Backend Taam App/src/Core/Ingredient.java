package Core;

public class Ingredient {
    private String ingredient;
    private Integer id;

    public Ingredient() {

    }
    Ingredient(String ingredient, Integer id)
    {
        this.ingredient = ingredient;
        this.id = id;
    }

    public String getIngredient()
    {
        return ingredient;
    }
    public Integer getId()
    {
        return id;
    }
    public void setIngredient(String ingredient)
    {
        this.ingredient = ingredient;
    }
    public void setId(Integer id)
    {
        this.id = id;
    }
}
