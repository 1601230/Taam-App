package Core;

import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.Optional;

import static org.junit.Assert.*;

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
    public void searchProductByName() throws SQLException {
        Searcher searcher = new Searcher();
        Product product = new Product();

        product = searcher.searchProductByName(null);
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("    ");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("----");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("nonexistentproduct");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("chipspringelsoriginals,kelloggscornflakes");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("chipspringelsoriginals&&kelloggscornflakes");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("20034658");
        Assert.assertEquals(null, product);

        product = searcher.searchProductByName("chipspringelsoriginals");
        Assert.assertEquals("5053990156009", product.getBarcode());

        product = searcher.searchProductByName("kelloggscornflakes");
        Assert.assertEquals("5053827206730", product.getBarcode());

        product = searcher.searchProductByName("nesquik-nestle");
        Assert.assertEquals("7613039490266", product.getBarcode());
    }

    @Test
    public void searchIngredient() throws SQLException {
        Searcher searcher = new Searcher();
        Ingredient ingredient = new Ingredient();

        ingredient = searcher.searchIngredient(null);
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("    ");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("----");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("nonexistentingredient");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("wheatstarch,whitesugar");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("wheatstarch&&whitesugar");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("1");
        Assert.assertEquals(null, ingredient);

        ingredient = searcher.searchIngredient("wheatstarch");
        Assert.assertEquals(Optional.of(4), Optional.ofNullable(ingredient.getId()));

        ingredient = searcher.searchIngredient("whitesugar");
        Assert.assertEquals(Optional.of(1), Optional.ofNullable(ingredient.getId()));
    }
}