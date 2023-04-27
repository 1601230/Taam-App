package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

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

        result = taam_app.checkName("Comté Le Montarlier");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("3228022170175", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("comte le montarlier");
        Assert.assertEquals("Product", result.get("|Type"));
        Assert.assertEquals("3228022170175", ((Product) result.get("|Element")).getBarcode());

        result = taam_app.checkName("Corn");
        Assert.assertEquals("Ingredient", result.get("|Type"));
        Assert.assertEquals(Optional.of(12), ((Ingredient) result.get("|Element")).getId());

        result = taam_app.checkName("Wholeèäl-oât-flouR");
        Assert.assertEquals("Ingredient", result.get("|Type"));
        Assert.assertEquals(Optional.of(16), ((Ingredient) result.get("|Element")).getId());

        result = taam_app.checkName("roasted Peanuts 90%");
        Assert.assertEquals("Ingredient", result.get("|Type"));
        Assert.assertEquals(Optional.of(48), ((Ingredient) result.get("|Element")).getId());
    }

    @Test
    public void checkProductBarcode() {
    }

    @Test
    public void checkProductIngredientName() {
    }

    @Test
    public void recommendedProducts() {
    }

    @Test
    public void refreshRecommendedProducts() {
    }
}