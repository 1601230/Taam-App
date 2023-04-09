DROP TABLE IF EXISTS public.incidents CASCADE;

DROP TABLE IF EXISTS public.ingredients CASCADE;

DROP TABLE IF EXISTS public.notfound CASCADE; 

DROP TABLE IF EXISTS public.products CASCADE; 

DROP TABLE IF EXISTS public.products_ingredients CASCADE; 


CREATE TABLE IF NOT EXISTS public.incidents
(
    id SERIAL PRIMARY KEY,
    result text,
    observation text,
    product_id text NOT NULL
);

CREATE TABLE IF NOT EXISTS public.ingredients
(
    id SERIAL PRIMARY KEY,
    namespanish text,
    namecatalan text,
    nameenglish text,
    vegan integer,
    vegetarian integer,
    celiac integer,
    lactose integer,
    nuts integer,
    teetotal integer
);

CREATE TABLE IF NOT EXISTS public.notfound
(
    id SERIAL PRIMARY KEY,
    barcode text,
    productname text,
    ingredientname text
);

CREATE TABLE IF NOT EXISTS public.products
(
    id text NOT NULL,
    name text,
    PRIMARY KEY (id) 
);

CREATE TABLE IF NOT EXISTS public.products_ingredients
(
    product_id text NOT NULL,
    ingredient_id integer NOT NULL,
    PRIMARY KEY (product_id, ingredient_id)
);

ALTER TABLE incidents
    ADD CONSTRAINT incidents_products_fk FOREIGN KEY ( product_id )
        REFERENCES products ( id );

ALTER TABLE products_ingredients
    ADD CONSTRAINT ingredients_fk FOREIGN KEY ( ingredient_id )
        REFERENCES ingredients ( id );

ALTER TABLE products_ingredients
    ADD CONSTRAINT products_fk FOREIGN KEY ( product_id )
        REFERENCES products ( id );

/* INSERTs table products */

INSERT INTO public.products(id, name) VALUES ('8410714102129', 'White sugar');

INSERT INTO public.products(id, name) VALUES ('5053990156009', 'Chips Pringels Originals');

INSERT INTO public.products(id, name) VALUES ('5053827206730', 'Kelloggs Corn Flakes');

INSERT INTO public.products(id, name) VALUES ('8480000156112', 'Cereales Avena Crunchy 85% Avena Integral y Bajo Contenido en Azucar - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8412598000010', 'Special beer - Estrella Galicia');

INSERT INTO public.products(id, name) VALUES ('8410184030137', 'White and red quinoa - Brillante');

INSERT INTO public.products(id, name) VALUES ('5013665111610', 'Lightly Salted Low Fat Corn Cakes');

INSERT INTO public.products(id, name) VALUES ('8410076481597', 'Tortilla Nachips Original-Old El Paso');

INSERT INTO public.products(id, name) VALUES ('8057432464032', 'Grissini Breadsticks');

INSERT INTO public.products(id, name) VALUES ('5060490400259', 'Corn Smoked BBQ Crunchy Corn');

INSERT INTO public.products(id, name) VALUES ('3046920029759', 'Dark Chocolate 90% cocoa - Lindt');

INSERT INTO public.products(id, name) VALUES ('5060283760003', 'Proper Corn');

INSERT INTO public.products(id, name) VALUES ('8480000171320', 'Tomate Frito');

INSERT INTO public.products(id, name) VALUES ('8076800376999', 'Lasagne alluovo');

INSERT INTO public.products(id, name) VALUES ('8710411045058', 'Pate darachide');

INSERT INTO public.products(id, name) VALUES ('3228022170175', 'Comte Le Montarlier');

INSERT INTO public.products(id, name) VALUES ('8480000205124', 'Yogur griego natural');

INSERT INTO public.products(id, name) VALUES ('20816445', 'Nuts Royal');

INSERT INTO public.products(id, name) VALUES ('20131968', 'Requeson tipo cottage light');

INSERT INTO public.products(id, name) VALUES ('20034658', 'Salmon ahumado');

INSERT INTO public.products(id, name) VALUES ('8480000183118', 'Filetes de Caballa del Sur en Aceite de Oliva Bajo en sal');

INSERT INTO public.products(id, name) VALUES ('3245414658769', 'Tiramisu - Carrefour');

INSERT INTO public.products(id, name) VALUES ('7613039490266', 'Nesquik - Nestle');

INSERT INTO public.products(id, name) VALUES ('4008400811727', 'Mon cheri');

INSERT INTO public.products(id, name) VALUES ('787692838349', 'White Chocolaty Macadamia');

INSERT INTO public.products(id, name) VALUES ('4025700001962', 'Chocolate blanco - Milka');

INSERT INTO public.products(id, name) VALUES ('8480000120373', 'Chocolate con almendras - Hacendado');

INSERT INTO public.products(id, name) VALUES ('3560070118373', 'Vikoroff vodka');

INSERT INTO public.products(id, name) VALUES ('704039019803', 'Fudge - Jack Daniels');

INSERT INTO public.products(id, name) VALUES ('20150907', 'Arándanos deshidratados - Alesto');

INSERT INTO public.products(id, name) VALUES ('7300400481595', 'Tartine croustillante Authentique - Wasa');

INSERT INTO public.products(id, name) VALUES ('3033491588136', 'HIPRO protéines - Danone');

INSERT INTO public.products(id, name) VALUES ('7300400481588', 'Tostadas crujientes de fibra - Wasa');

INSERT INTO public.products(id, name) VALUES ('20047238', 'Mix de frutos secos al natural - Alesto');

INSERT INTO public.products(id, name) VALUES ('3225350000501', 'Pulco Lemon');

INSERT INTO public.products(id, name) VALUES ('8076802085738', 'Penne rigate - Barilla');

INSERT INTO public.products(id, name) VALUES ('8076809529419', 'Espagueti integral - Barilla');

INSERT INTO public.products(id, name) VALUES ('5411188110835', 'Alpro Almond');

INSERT INTO public.products(id, name) VALUES ('8480000633224', 'Delicias de Pollo - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8715035110106', 'Salsa de soja - Kikkoman');

INSERT INTO public.products(id, name) VALUES ('8423352861402', 'Bebida de avena - ALITEY ');

INSERT INTO public.products(id, name) VALUES ('8480000633231', 'Nuggets de pollo - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8437017032984', 'Nuggets originales - Heura');

INSERT INTO public.products(id, name) VALUES ('8480000561695', 'Pechuga pollo braseada finas lonchas - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8436021411396', 'Burger de pavo y pollo - Mercadona');

INSERT INTO public.products(id, name) VALUES ('8480000809421', 'Tortillas de trigo integrales - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8000430133035', 'Mozarella - Galbani');

INSERT INTO public.products(id, name) VALUES ('8431876038385', 'Turrón trufado con pasas al licor - Carrefour');

INSERT INTO public.products(id, name) VALUES ('13179515', 'Carne picada vacuno');

INSERT INTO public.products(id, name) VALUES ('8480000061423', 'Tortelloni de carne - Hacendado');

INSERT INTO public.products(id, name) VALUES ('3270190192794', 'Naranja sin pulpa - Carrefour');

INSERT INTO public.products(id, name) VALUES ('8480000349613', 'Chía - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8410422111048', 'Allioli - Chovi');

INSERT INTO public.products(id, name) VALUES ('8480000531001', 'Salchicha estilo frankfurt con queso - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8480000152039', 'Piña en su Jugo - Hacendado');

INSERT INTO public.products(id, name) VALUES ('8423352800159', 'Leche De Almendras - Almendrola');

INSERT INTO public.products(id, name) VALUES ('8480000158109', 'Light - Hacendado');

INSERT INTO public.products(id, name) VALUES ('20408923', 'Buttercookies - Sondey');

INSERT INTO public.products(id, name) VALUES ('20413422', 'Anacardos tostados y salados - Alesto');

/* INSERTs table ingredients */

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('azucar blanco', 'sucre blanc', 'white sugar', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('plantas oleaginosas (girasol, maiz)', 'plantes oleaginoses (gira-sol, blat de moro)', 'oil plants (sunflower, corn)', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de arroz', 'farina darros', 'rice flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almidon de trigo', 'mido de blat', 'wheat starch', 0, 0, 0, 2, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de maiz', 'farina de blat de moro', 'maize flour', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('emulsionante e471', 'emulsionant e471', 'emulsifier e471', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('maltodextrina', 'maltodextrina', 'maltodextrin', 0, 0, 0, 0, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sal', 'sal', 'salt', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('extracto de levadura', 'extracte de llevat', 'yeast extract', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('levadura en polvo', 'llevat en pols', 'yeast powder', 0, 0, 2, 1, 2, 2);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('color (annatto)', 'color (annatto)', 'colour (annatto)', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('maiz', 'blat de moro', 'corn', 0, 0, 1, 2, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('azucar', 'sucre', 'sugar', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('malta de cebada', 'malt dordi', 'barley malt', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cereales (avena integral, semola de maiz)', 'cereals (civada integral, semola de blat de moro)', 'cereal(wholemeal oatmeal, maize semolina)', 0, 0, 2, 2, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina integral de avena', 'farina integral de civada', 'wholemeal-oat-flour', 0, 0, 0, 2, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('e306', 'e306', 'e306', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('agua', 'aigua', 'water', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('lupulo', 'llupol', 'hops', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('alcohol', 'alcohol', 'alcohol', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('quinoa blanca', 'quinoa blanca', 'white-quinoa', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('quinoa roja', 'quinoa vermella', 'red-quinoa', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de oliva virgen', 'oli doliva verge', 'virgin-olive-oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('lecitina de girasol', 'lecitina de gira-sol', 'sunflower-lecithin', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sal marina', 'sal marina', 'sea salt', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('granos de maiz enteros', 'grans de blat de moro sencers', 'whole corn kernels', 0, 0, 2, 1, 2, 1);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de girasol alto oleico', 'oli de gira-sol alt oleic', 'high oleic sunflower oil', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina', 'farina', 'flour', 0, 0, 0, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de oliva', 'oli doliva', 'olive oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('extracto de malta de cebada', 'extracte de malt dordi', 'barley malt extract', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sal yodada', 'sal iodada', 'iodised salt', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('levadura', 'llevat', 'yeast', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aromas', 'aromes', 'flavourings', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pimenton', 'pebre roig', 'paprika', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cebolla', 'ceba', 'onion', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('ajo', 'all', 'garlic', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('masa de cacao', 'massa de cacau', 'cocoa mass', 0, 0, 2, 2, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('manteca de cacao', 'mantega de cacau', 'cocoa butter', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacao en polvo bajo en grasas', 'cacau en pols baixa en greixos', 'low fat cocoa powder', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vainilla', 'vainilla', 'vanilla', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('palomitas de maiz', 'crispetes de blat de moro', 'hand popped corn', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de colza', 'oli de colza', 'rapeseed oil', 1, 1, 0, 0, 0, 1);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('tomate', 'tomaquet', 'tomato', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almidon de maiz modificado', 'mido de blat de moro modificat', 'modified corn starch', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('conservante (sorbato potasico)', 'conservant (sorbato potassic)', 'preservative (potassium sorbate)', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semola de trigo duro', 'semola de blat dur', 'durum wheat semolina', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('huevos', 'ous', 'eggs', 1, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacahuetes tostados el 90% de las veces', 'cacauets torrats el 90% de les vegades', 'roasted peanuts 90%', 2, 2, 1, 2, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de girasol', 'oli de gira-sol', 'sunflower oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacahuetes tostados', 'cacauets torrats', 'roasted peanuts', 0, 0, 2, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('grasa vegetal de palma hidrogenada', 'greix vegetal de palma hidrogenada', 'hydrogenated palm vegetable fat', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche cruda', 'llet crua', 'raw milk', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('fermentos lacteos', 'fermentos lactis', 'dairy ferments', 1, 1, 2, 0, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche entera', 'llet sencera', 'whole milk', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('crema', 'crema', 'cream', 1, 0, 2, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche desnatada en polvo', 'llet desnatada en pols', 'skimmed milk powder', 1, 0, 2, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('nueces', 'nous', 'walnuts', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('avellanas', 'avellanes', 'hazelnuts', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('anacardos', 'anacards', 'cashews', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almendras blanqueadas', 'ametlles blanquejades', 'blanched almonds', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cultivos microbianos', 'cultius microbians', 'microbial cultures', 2, 1, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cuajo microbiano', 'quall microbia', 'microbial rennet', 2, 1, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('salmon', 'salmo', 'salmon', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('humo de leña de haya', 'fum de llenya de faig', 'haya wood smoke', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('caballa', 'verat', 'mackerel', 1, 1, 2, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sirope de glucosa', 'xarop de glucosa', 'glucose syrup', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('mascarpone', 'mascarpone', 'mascarpone', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de trigo', 'farina de blat', 'wheat flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vino marsala', 'vi marsala', 'marsala wine', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacao desgrasado natural en polvo', 'cacau desgrasat natural en pols', 'natural defatted cocoa powder', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vitamina-c', 'vitamina-c', 'vitamine-c', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vitamina-d', 'vitamina-d', 'vitamine-d', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aromatizante natural', 'aromatitzant natural', 'natural-flavouring', 2, 2, 2, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('lecitina de soja', 'lecitina de soia', 'soya-lecithin', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('canela', 'canyella', 'cinnamon', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('chocolate', 'xocolata', 'chocolate', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('licor', 'licor', 'licor', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cerezas', 'cireres', 'cherries', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('mezcla de proteinas', 'mescla de proteines', 'protein blend', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('nueces de macadamia', 'nous de macadamia', 'macadamia nuts', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche desnatada en polvo', 'llet desnatada en pols', 'skimmed-milk powder', 1, 0, 2, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('suero dulce en polvo (leche)', 'serum dolç en pols (llet)', 'sweet whey powder (milk)', 0, 1, 0, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('grasa de mantequilla pura', 'greix de mantega pura', 'pure butter fat', 1, 0, 1, 2, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almendras enteras', 'ametlles senceres', 'whole-almonds', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche entera en polvo', 'llet sencera en pols', 'whole-milk-powder', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vodka', 'vodka', 'vodka', 0, 0, 2, 1, 1, 1);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche condensada azucarada y desnatada', 'llet condensada ensucrada i desnatada', 'sweetened and skimmed condensed milk', 1, 0, 1, 0, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de palma', 'oli de palma', 'palm oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('whisky', 'whisky', 'whiskey', 0, 0, 1, 1, 2, 1);

/*90*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('arandanos rojos', 'nabius vermells', 'red cranberries', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('producto integral', 'producte integral', 'wholemeal', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de centeno', 'farina de segol', 'rye flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('oligofructosa', 'oligofructosa', 'oligofructose', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aroma natural de vainilla', 'aroma natural de vainilla', 'natural vanilla flavor', 0, 0, 1, 1, 1, 0);

/*95*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vainilla bourbon en polvo', 'vainilla bourbon en pols', 'bourbon vanilla powder', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de centeno integral', 'farina sencera de segol', 'whole rye flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('salvado', 'sego', 'bran', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('avena', 'civada', 'oatmeal', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semillas de sesamo', 'llavors de sesam', 'sesame seeds', 0, 0, 1, 1, 1, 0);

/*100*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('germen de trigo', 'germen de blat', 'wheat germ', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('jugo concentrado: limón', 'suc concentrat: llimona', 'concentrated juice: lemon', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('jugo concentrado: naranja', 'suc concentrat: taronja', 'concentrated juice: orange', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semola de trigo', 'semola de blat', 'wheat semolina', 0, 0, 0, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almendras', 'ametlles', 'almonds', 0, 0, 1, 1, 0, 0);

/*105*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pechuga de pollo', 'pit de pollastre', 'chicken breast', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('fecula de patata', 'fecula de patata', 'potato starch', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('soja', 'soja', 'soybeans', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne de pollo', 'carn de pollastre', 'chicken meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('proteina de soja', 'proteina de soja', 'soy protein', 0, 0, 1, 1, 1, 0);

/*110*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne de pavo', 'carn de gall dindi', 'turkey meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche pasteurizada', 'llet pasteuritzada', 'pasteurised milk', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pasas', 'passes', 'raisins', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pasta almendra', 'pasta ametlla', 'almond paste', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('alcohol', 'alcohol', 'alcohol', 0, 0, 1, 1, 1, 1);

/*115*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne de vacuno', 'carn de bovi', 'beef meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne estofada', 'carn estofada', 'braised meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('manteca', 'mantega', 'butter', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semillas de chia', 'llavors de chia', 'chia seeds', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite vegetal', 'oli vegetal', 'vegetable oil', 0, 0, 1, 1, 1, 0);

/*120*/
INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('queso fundido', 'formatge fos', 'melted cheese', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pina', 'pinya', 'pineapple', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('zumo de pina', 'suc de pinya', 'pineapple juice', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(namespanish, namecatalan, nameenglish, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de patata', 'farina de patata', 'potato flour', 0, 0, 1, 2, 1, 0);

/* INSERTs table products_ingredients */

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410714102129', 1);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 2);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 3);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 4);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 5);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 6);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 7);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 9);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 10);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053990156009', 11);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053827206730', 12);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053827206730', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053827206730', 14);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5053827206730', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000156112', 15);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000156112', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000156112', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000156112', 16);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000156112', 5);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000156112', 17);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8412598000010', 14);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8412598000010', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8412598000010', 12);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8412598000010', 19);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8412598000010', 20);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410184030137', 21);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410184030137', 22);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410184030137', 23);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410184030137', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410184030137', 24);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410184030137', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5013665111610', 12);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5013665111610', 25);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410076481597', 26);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410076481597', 27);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410076481597', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8057432464032', 28);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8057432464032', 29);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8057432464032', 30);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8057432464032', 31);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8057432464032', 32);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8057432464032', 33);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060490400259', 12);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060490400259', 49);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060490400259', 34);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060490400259', 35);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060490400259', 36);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060490400259', 25);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3046920029759', 37);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3046920029759', 38);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3046920029759', 39);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3046920029759', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3046920029759', 40);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060283760003', 41);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060283760003', 42);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5060283760003', 25);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 43);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 49);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 44);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 35);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 45);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8076800376999', 46);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8076800376999', 47);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8710411045058', 48);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8710411045058', 49);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8710411045058', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8710411045058', 50);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8710411045058', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8710411045058', 51);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3228022170175', 52);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3228022170175', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3228022170175', 53);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000205124', 54);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000205124', 55);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000205124', 56);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000205124', 53);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20816445', 57);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20816445', 58);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20816445', 59);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20816445', 60);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20131968', 54);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20131968', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20131968', 61);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20131968', 62);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20034658', 63);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20034658', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20034658', 64);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000183118', 65);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000183118', 29);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 66);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 67);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 47);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 20);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 69);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 70);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 71);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 72);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 73);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 74);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7613039490266', 75);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4008400811727', 76);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4008400811727', 77);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4008400811727', 78);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4008400811727', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('787692838349', 79);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('787692838349', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('787692838349', 80);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 38);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 56);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 82);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 83);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 74);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('4025700001962', 73);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000120373', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000120373', 84);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000120373', 85);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000120373', 38);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000120373', 37);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000120373', 74);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3560070118373', 86);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 66);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 87);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 88);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 89);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 33);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('704039019803', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20150907', 90);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20150907', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20150907', 49);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481595', 91);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481595', 92);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481595', 32);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481595', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3033491588136', 56);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3033491588136', 93);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3033491588136', 94);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3033491588136', 95);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481588', 96);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481588', 97);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481588', 98);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481588', 99);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481588', 100);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('7300400481588', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20047238', 57);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20047238', 58);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20047238', 59);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20047238', 60);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3225350000501', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3225350000501', 101);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3225350000501', 102);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8076802085738', 103);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8076802085738', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8076809529419', 46);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8076809529419', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5411188110835', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5411188110835', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('5411188110835', 104);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000633224', 105);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000633224', 12);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000633224', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8715035110106', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8715035110106', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8715035110106', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8715035110106', 107);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352861402', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352861402', 98);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000633231', 108);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000633231', 105);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000633231', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8437017032984', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8437017032984', 109);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8437017032984', 3);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000561695', 105);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000561695', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000561695', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000561695', 109);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8436021411396', 110);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8436021411396', 108);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8436021411396', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8436021411396', 109);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000809421', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000809421', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8000430133035', 111);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8000430133035', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876038385', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876038385', 112);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876038385', 38);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876038385', 56);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876038385', 113);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876038385', 114);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('13179515', 115);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('13179515', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000061423', 46);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000061423', 47);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000061423', 68);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000061423', 116);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000061423', 117);
/*
INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3270190192794', 112);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000349613', 118);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 119);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 47);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 36);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 101);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 49);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8410422111048', 45);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000531001', 108);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000531001', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000531001', 120);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000531001', 56);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000152039', 121);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000152039', 122);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352800159', 18);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352800159', 104);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352800159', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352800159', 74);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8423352800159', 25);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000158109', 123);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000158109', 106);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000158109', 49);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000158109', 8);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000158109', 13);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20408923', 12);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20408923', 25);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20408923', 23);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20408923', 24);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20413422', 56);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20413422', 119);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('20413422', 8);
*/
