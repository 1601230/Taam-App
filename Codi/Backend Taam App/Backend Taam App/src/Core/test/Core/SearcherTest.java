package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;

public class SearcherTest {

    @Test
    public void searchProductByBarcode() throws SQLException {

        Searcher searcher = new Searcher();
        Product product = new Product();

        //existing barcodes
        product = searcher.searchProductByBarcode("20034658");
        Assert.assertEquals("Salmon ahumado", product.getProductName());

        product = searcher.searchProductByBarcode("3046920029759");
        Assert.assertEquals("Dark Chocolate 90% cocoa - Lindt", product.getProductName());

        //non existing barcodes, null, empty line...
        product = searcher.searchProductByBarcode("200346580 '' ");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByBarcode("20034658 ");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByBarcode("");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByBarcode(null);
        Assert.assertEquals(null, product);

        product = searcher.searchProductByBarcode("--");
        Assert.assertEquals(null, product);
    }

    @Test
    public void searchProductByName() {
    }

    @Test
    public void searchIngredient() {
    }
}