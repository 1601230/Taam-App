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
    public void checkBarcode() throws SQLException {
        Taam_App taam_app = Taam_App.getInstance();
        Product product = new Product();

        //existing barcodes
        product = taam_app.checkBarcode("20034658");
        Assert.assertEquals("Salmon ahumado", product.getProductName());

        product = taam_app.checkBarcode("2003%204%5B658");
        Assert.assertEquals("Salmon ahumado", product.getProductName());

        String large_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac arcu a nisi facilisis suscipit eu vel risus. Nulla blandit nunc et mi mollis euismod. Sed at tellus ut felis varius ultrices. Sed facilisis nulla id est pulvinar pharetra. Vestibulum et velit a velit egestas congue id vitae urna. Fusce ut consectetur massa, ut fringilla sapien. Proin maximus luctus urna, at pellentesque felis pretium in. Duis rhoncus ac est quis molestie. Duis luctus elementum diam non ullamcorper. Nunc vel nibh eget justo maximus dapibus. Curabitur fringilla arcu vitae lacus iaculis consectetur. Duis sollicitudin enim nec lectus sagittis, vel vestibulum elit eleifend.\n" +
                "\n" + "Etiam eget efficitur eros, non elementum mauris. In interdum ipsum sed orci venenatis hendrerit. Vivamus eu lorem vitae ipsum vehicula laoreet vel vel mi. Nullam quis malesuada sapien. Proin vitae ex in enim dictum faucibus quis vel mauris. Nullam nec augue eu risus tristique ornare. Duis dignissim ipsum in ante malesuada dignissim. Aliquam erat volutpat. Quisque laoreet tristique dui sit amet viverra. Suspendisse porta, lorem vel dictum suscipit, velit nulla viverra diam, quis vehicula lectus nibh sed justo.\n" +
                "\n" + "In bibendum nunc non leo feugiat sagittis. In sollicitudin, leo non rhoncus tristique, ex erat rhoncus est, eget malesuada turpis neque in turpis. Curabitur mollis, lorem eu tristique ultricies, tellus augue commodo sapien, a tempor odio augue vel tellus. Ut elementum odio vitae sapien eleifend, sed malesuada metus eleifend. Morbi gravida lorem ut lacus iaculis luctus. Aliquam eget metus nisi. Donec quis mi turpis. Donec rhoncus ex sed mauris maximus, in pharetra sapien elementum. Donec tempor, velit in efficitur ullamcorper, odio dolor pharetra dolor, a interdum magna enim in turpis. Proin efficitur tortor quis enim placerat, at finibus sapien consectetur. Sed ac lobortis eros.\n" +
                "\n" + "Cras efficitur urna vel sapien varius dapibus. Nunc et velit a lorem consequat pellentesque ut vitae tellus. Duis in dolor ut nibh ultrices laoreet. Duis lobortis risus at libero suscipit rhoncus. Nulla vel nisi ut lectus faucibus pellentesque eu a ipsum. Vivamus eget risus a felis finibus facilisis. Nam interdum tincidunt urna, eget malesuada justo elementum sit amet. Suspendisse ac justo vel metus consequat facilisis. Quisque sit amet lacinia est. Sed ac tortor vitae nunc dignissim bibendum. Mauris eu bibendum justo. Etiam vel ante auctor, placerat sapien vitae, varius nibh. Aliquam dictum nisl vel purus suscipit lacinia. Quisque rutrum felis vel arcu scelerisque, in volutpat eros varius. Sed eu dolor non nunc aliquam bland\n";
        product = taam_app.checkBarcode(large_string);
        Assert.assertEquals(null, product);

        //non existing barcode, empty, null...

        product = taam_app.checkBarcode("");
        Assert.assertEquals(null, product);

        product = taam_app.checkBarcode(null);
        Assert.assertEquals(null, product);

        product = taam_app.checkBarcode("200346580");
        Assert.assertEquals(null, product);
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