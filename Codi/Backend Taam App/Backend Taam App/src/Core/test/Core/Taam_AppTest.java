package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;

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
    public void checkName() {
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