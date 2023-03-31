package Core;

import java.sql.SQLException;
import java.util.List;

public interface Visitor {
    public Result checkProduct(List<Ingredient> ingredientsList) throws SQLException;
    public Result checkIngredient(Ingredient ingredient) throws SQLException;
}
