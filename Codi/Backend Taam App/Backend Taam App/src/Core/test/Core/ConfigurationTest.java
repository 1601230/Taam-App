package Core;

import org.junit.Assert;
import org.junit.Test;

import static org.junit.Assert.*;

public class ConfigurationTest {

    @Test
    public void createConfiguration() {
        Configuration configuration = Configuration.getInstance();
        Visitor visitor;

        //existent configurations
        visitor = configuration.createConfiguration("vegan");
        Assert.assertTrue(visitor instanceof Vegan);

        visitor = configuration.createConfiguration(" Ve g an %22  ");
        Assert.assertTrue(visitor instanceof Vegan);

        visitor = configuration.createConfiguration("allergictolactose");
        Assert.assertTrue(visitor instanceof Lactose_Allergic);

        visitor = configuration.createConfiguration("allergic%20to%5Blactose  ");
        Assert.assertTrue(visitor instanceof Lactose_Allergic);

        //non existent configurations
        visitor = configuration.createConfiguration("");
        Assert.assertEquals(null, visitor);

        visitor = configuration.createConfiguration("Vegann");
        Assert.assertEquals(null, visitor);

        visitor = configuration.createConfiguration(null);
        Assert.assertEquals(null, visitor);

    }
}