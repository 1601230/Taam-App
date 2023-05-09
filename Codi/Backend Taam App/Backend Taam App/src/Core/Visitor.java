package Core;

import java.sql.SQLException;
import java.util.List;

/**
 * This class allows us to implement the Visitor pattern, and all classes that represent a restriction inherit from this
 * class.
 */
public interface Visitor {
    /**
     * This method is abstract because it must be implemented by the restrictions that inherit from the Visitor class.
     * The idea of this method is to check the ingredients of a product and then indicate if the product is suitable
     * according to the restriction.
     */
    public Result checkProduct(List<Ingredient> ingredientsList) throws SQLException;
    /**
     * This method is abstract because it must be implemented by the restrictions that inherit from the Visitor class.
     * The idea of this method is to check the ingredient that the user is interested in and then indicate if the
     * ingredient is suitable according to the restriction.
     */
    public Result checkIngredient(Ingredient ingredient) throws SQLException;
}
