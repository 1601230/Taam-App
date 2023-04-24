package Core.MockClasses;

import Core.DataBase;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Mock_DataBase extends DataBase{

    public Mock_DataBase()
    {

    }

    public ResultSet selectProductName(String barcode)
    {
        return null;
    }

    public ResultSet selectProductIngredientsId(String barcode)
    {
        return null;
    }

    public ResultSet selectProductIngredientName(Integer ingredient_id)
    {
        return null;
    }

    public ResultSet selectProductIdName()
    {
        return null;
    }

    public ResultSet selectIngredientIdName()
    {
        return null;
    }
}
