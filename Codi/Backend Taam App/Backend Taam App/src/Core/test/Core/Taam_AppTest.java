package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import static Core.Edible.*;
import static org.junit.Assert.*;

public class Taam_AppTest {

    @Test
    public void checkBarcode() {
        Taam_App taam_app = Taam_App.getInstance();


    }

    @Test
    public void checkName() throws SQLException {
        Taam_App taam_app = Taam_App.getInstance();
        Map<String, Object> result = new HashMap<String, Object>();

        result = taam_app.checkName(null);
        Assert.assertEquals(null, result);

        result = taam_app.checkName("");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("    ");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("------");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("&^_ ~$@· {}//<print>");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("Non existing name");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("5053990156009");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("Chips Pringels Originals");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("5053990156009", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("chips pringels originals");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("5053990156009", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("Kellogg's Corn Flakes");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("5053827206730", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("kelloggs corn flakes");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("5053827206730", ((Product) result.get("|Element")).getBarcode());

        //Adaptamos el nombre del producto a lo que recibimos del navegador
        result = taam_app.checkName("Comt%C3%A9 Le Montarlier");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("3228022170175", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("comte le montarlier");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("3228022170175", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("Corn");
        Assert.assertEquals("Ingredient", result.get("|Type"));
        Assert.assertEquals(Optional.of(12), Optional.ofNullable(((Ingredient) result.get("|Element")).getId()));

        result = taam_app.checkName("Wholeèäl-oât-flouR");
        Assert.assertEquals(null, result);

        result = taam_app.checkName("roasted Peanuts 90%");
        Assert.assertEquals("Ingredient", result.get("|Type"));
        Assert.assertEquals(Optional.of(48), Optional.ofNullable(((Ingredient) result.get("|Element")).getId()));
    }

    @Test
    public void checkProductBarcode() {
    }

    @Test
    public void checkProductIngredientName() throws SQLException {
        Taam_App taam_app = Taam_App.getInstance();
        Map<String, Object> result = new HashMap<String, Object>();

        result = taam_app.checkProductIngredientName(null);
        Assert.assertEquals(null, result);

        result = taam_app.checkProductIngredientName("");
        Assert.assertEquals(null, result);

        taam_app.setRestrictions("");
        result = taam_app.checkProductIngredientName("    ");
        Assert.assertEquals(null, result);

        result = taam_app.checkProductIngredientName("&^_ ~$@· {}//<print>");
        Assert.assertEquals(null, result);

        taam_app.setRestrictions("vegan");
        result = taam_app.checkProductIngredientName("salmon ahumado");
        Assert.assertEquals(UNSUITABLE, result.get("|Edible"));
        Assert.assertEquals("20034658", result.get("|Barcode"));

        taam_app.setRestrictions("allergictogluten");
        result = taam_app.checkProductIngredientName("Filetes de Caballa del Sur en Aceite de Oliva Bajo en sal");
        Assert.assertEquals(DOUBTFUL, result.get("|Edible"));
        Assert.assertEquals("8480000183118", result.get("|Barcode"));

        taam_app.setRestrictions("vegetarian");
        result = taam_app.checkProductIngredientName("filetes de caballa del sur en aceite de oliva bajo en sal");
        Assert.assertEquals(UNSUITABLE, result.get("|Edible"));
        Assert.assertEquals("8480000183118", result.get("|Barcode"));

        /*
        Esperando a merge de BD, para corrección de errores
        --
        taam_app.setRestrictions("teetotal");
        result = taam_app.checkProductIngredientName("alcohol");
        Assert.assertEquals(UNSUITABLE, result.get("|Edible"));
        Assert.assertEquals(114, result.get("|Id"));
        */
        taam_app.setRestrictions("allergictolactose");
        result = taam_app.checkProductIngredientName("natural defatted cocoa powder");
        Assert.assertEquals(SUITABLE, result.get("|Edible"));
        Assert.assertEquals(70, result.get("|Id"));

        taam_app.setRestrictions("allergictonuts");
        result = taam_app.checkProductIngredientName("Natural defatted cocoa powder");
        Assert.assertEquals(SUITABLE, result.get("|Edible"));
        Assert.assertEquals(70, result.get("|Id"));
    }
}