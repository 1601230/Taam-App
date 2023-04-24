package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.*;

public class SearcherTest {

    @Test
    public void searchProductByBarcode() {
    }

    @Test
    public void searchProductByName() throws SQLException {
        Searcher searcher = new Searcher();
        Product product = new Product();

        product = searcher.searchProductByName(null);
        Assert.assertEquals(product, null);

        product = searcher.searchProductByName("");
        Assert.assertEquals(product, null);

        product = searcher.searchProductByName("    ");
        Assert.assertEquals(product, null);

        product = searcher.searchProductByName("Nonexistent name");
        Assert.assertEquals(product, null);

        product = searcher.searchProductByName("20034658");
        Assert.assertEquals(product, null);

        product = searcher.searchProductByName("Chips Pringels Originals");
        Assert.assertEquals(product.getBarcode(), "5053990156009");

        product = searcher.searchProductByName("chipspringelsoriginals");
        Assert.assertEquals(product.getBarcode(), "5053990156009");

        product = searcher.searchProductByName("Kellogg's Corn Flakes");
        Assert.assertEquals(product.getBarcode(), "5053827206730");

        product = searcher.searchProductByName("kelloggs corn flakes");
        Assert.assertEquals(product.getBarcode(), "5053827206730");

        product = searcher.searchProductByName("Nesquik - Nestlé");
        Assert.assertEquals(product.getBarcode(), "7613039490266");

        product = searcher.searchProductByName("nesquik - nestle");
        Assert.assertEquals(product.getBarcode(), "7613039490266");
    }

    @Test
    public void searchIngredient()
    {
    }
}