DROP TABLE IF EXISTS public.incidents CASCADE;

DROP TABLE IF EXISTS public.ingredients CASCADE;

DROP TABLE IF EXISTS public.notfound CASCADE; 

DROP TABLE IF EXISTS public.products CASCADE; 

DROP TABLE IF EXISTS public.products_ingredients CASCADE; 

DROP TABLE IF EXISTS public.question_requests CASCADE; 

DROP TABLE IF EXISTS public.frequent_questions CASCADE; 

CREATE TABLE IF NOT EXISTS public.incidents
(
    id SERIAL PRIMARY KEY,           
    observation text,                              
    product_id text,                 
    ingredient_id integer           
);

CREATE TABLE IF NOT EXISTS public.ingredients
(
    id SERIAL PRIMARY KEY,
    name_spanish text,
    name_catalan text,
    name_english text,
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
    name text
);

CREATE TABLE IF NOT EXISTS public.products
(
    id text NOT NULL,
    name text,
    image text,
    PRIMARY KEY (id) 
);

CREATE TABLE IF NOT EXISTS public.products_ingredients
(
    product_id text NOT NULL,
    ingredient_id integer NOT NULL,
    PRIMARY KEY (product_id, ingredient_id)
);

CREATE TABLE IF NOT EXISTS public.question_requests (
    id SERIAL PRIMARY KEY,
    question_user text
);

CREATE TABLE IF NOT EXISTS public.frequent_questions (
    id SERIAL PRIMARY KEY,
    question_spanish text,
    question_catalan text,
    question_english text,
    response_spanish text,
    response_catalan text,
    response_english text
);

ALTER TABLE products_ingredients
    ADD CONSTRAINT ingredients_fk FOREIGN KEY ( ingredient_id )
        REFERENCES ingredients ( id );

ALTER TABLE products_ingredients
    ADD CONSTRAINT products_fk FOREIGN KEY ( product_id )
        REFERENCES products ( id );

/* INSERTs table products */

INSERT INTO public.products(id, name, image) VALUES ('8410714102129', 'White sugar', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8410714102129.jpg?alt=media&token=611b62e9-d22e-4ab7-ae51-64302980ad03');

INSERT INTO public.products(id, name, image) VALUES ('5053990156009', 'Chips Pringels Originals', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F5053990156009.jpg?alt=media&token=e4af47d8-726a-45b8-84ea-6c621ef9ab20');

INSERT INTO public.products(id, name, image) VALUES ('5053827206730', 'Kelloggs Corn Flakes', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F5053827206730.jpg?alt=media&token=484f290f-f935-4ee8-ad33-e389dceb458c');

INSERT INTO public.products(id, name, image) VALUES ('8480000156112', 'Cereales Avena Crunchy - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000156112.jpg?alt=media&token=bfda95c4-fd9b-49c4-b5e0-8bd22679fe73');

INSERT INTO public.products(id, name, image) VALUES ('8412598000010', 'Special beer - Estrella Galicia', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8412598000010.jpg?alt=media&token=730b5380-6ec8-478a-9ff0-d9c562f7c92b');

INSERT INTO public.products(id, name, image) VALUES ('8410184030137', 'White and red quinoa - Brillante', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8410184030137.jpg?alt=media&token=b93e19ae-d424-4645-a599-a36c90cf06ff');

INSERT INTO public.products(id, name, image) VALUES ('5013665111610', 'Lightly Salted Low Fat Corn Cakes', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F5013665111610.jpg?alt=media&token=c1e1d8c6-46c0-4773-a0c6-465b9abd2c02');

INSERT INTO public.products(id, name, image) VALUES ('8410076481597', 'Tortilla Nachips Original-Old El Paso', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8410076481597.jpg?alt=media&token=0ae663d2-b0c6-48d1-b09f-43870ac1e60d');

INSERT INTO public.products(id, name, image) VALUES ('8057432464032', 'Grissini Breadsticks', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8057432464032.jpg?alt=media&token=dcf210c2-c0a7-48e9-97aa-36d83438e8b9');

INSERT INTO public.products(id, name, image) VALUES ('5060490400259', 'Corn Smoked BBQ Crunchy Corn', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F5060490400259.jpg?alt=media&token=947c4919-41b3-49b5-96c6-ad943ab92f5d');

INSERT INTO public.products(id, name, image) VALUES ('3046920029759', 'Dark Chocolate 90 cocoa - Lindt', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3046920029759.jpg?alt=media&token=bbff0ce5-3633-4712-85e7-3bbc5bd2ede4');

INSERT INTO public.products(id, name, image) VALUES ('5060283760003', 'Proper Corn', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F5060283760003.jpg?alt=media&token=e95ed41c-97f9-468f-97ed-f471a028f1b2');

INSERT INTO public.products(id, name, image) VALUES ('8480000171320', 'Tomate Frito', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000171320.jpg?alt=media&token=ce22cfdf-10a0-4aaa-92d8-3550de94593c');

INSERT INTO public.products(id, name, image) VALUES ('8076800376999', 'Lasagne alluovo', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8076800376999.jpg?alt=media&token=03a73877-407c-4d37-b8e1-f12212aeea7a');

INSERT INTO public.products(id, name, image) VALUES ('8710411045058', 'Pate darachide', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8710411045058.jpg?alt=media&token=9933e482-5ffa-4e88-9b12-3e37a563cb1e');

INSERT INTO public.products(id, name, image) VALUES ('3228022170175', 'Comte Le Montarlier', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3228022170175.jpg?alt=media&token=ebda7699-e30e-46dd-85e7-f0416c93aead');

INSERT INTO public.products(id, name, image) VALUES ('8480000205124', 'Yogur griego natural', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000205124.jpg?alt=media&token=a2edba97-8a32-45a9-8dac-ec8ae301b7d5');

INSERT INTO public.products(id, name, image) VALUES ('20816445', 'Nuts Royal', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20816445.jpg?alt=media&token=920a095d-e99d-4bc6-b8b1-d71cade9795a');

INSERT INTO public.products(id, name, image) VALUES ('20131968', 'Requeson tipo cottage light', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20131968.jpg?alt=media&token=96059109-c52d-400a-a487-f824a3793a7a');

INSERT INTO public.products(id, name, image) VALUES ('20034658', 'Salmon ahumado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20034658.jpg?alt=media&token=c4ed8f12-293f-45ab-9d9b-dbedf5190b98');

INSERT INTO public.products(id, name, image) VALUES ('8480000183118', 'Filetes de Caballa del Sur en Aceite de Oliva Bajo en sal', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000183118.jpg?alt=media&token=2d12480d-0894-43b3-a06c-9ff5f5032ec1');

INSERT INTO public.products(id, name, image) VALUES ('3245414658769', 'Tiramisu - Carrefour', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3245414658769.jpg?alt=media&token=754cf689-5e66-404e-8f57-44d887789a7b');

INSERT INTO public.products(id, name, image) VALUES ('7613039490266', 'Nesquik - Nestle', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F7613039490266.jpg?alt=media&token=51dc2542-efcc-48c1-9484-25f68bdf2eb0');

INSERT INTO public.products(id, name, image) VALUES ('4008400811727', 'Mon cheri', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F4008400811727.jpg?alt=media&token=1b07d8b5-fbfc-42d2-817a-b9940f96ce7c');

INSERT INTO public.products(id, name, image) VALUES ('787692838349', 'White Chocolaty Macadamia', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F787692838349.jpg?alt=media&token=53ba7df8-d60c-4475-9d4e-69396c6cc36d');

INSERT INTO public.products(id, name, image) VALUES ('4025700001962', 'Chocolate blanco - Milka', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F4025700001962.jpg?alt=media&token=b7fccad8-889a-4e38-a6a9-31ec71634d9c');

INSERT INTO public.products(id, name, image) VALUES ('8480000120373', 'Chocolate con almendras - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000120373.jpg?alt=media&token=31e677e2-46a4-4a22-a8d9-e7b046290009');

INSERT INTO public.products(id, name, image) VALUES ('3560070118373', 'Vikoroff vodka', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3560070118373.jpg?alt=media&token=23422693-87d1-498c-ab4c-98077e777e63');

INSERT INTO public.products(id, name, image) VALUES ('704039019803', 'Fudge - Jack Daniels', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F704039019803.jpg?alt=media&token=8fa536b4-eb0a-4330-8f45-539b60ce2b02');

INSERT INTO public.products(id, name, image) VALUES ('20150907', 'Arandanos deshidratados - Alesto', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20150907.jpg?alt=media&token=cd440f0f-344a-470b-b406-a1c532e23bbe');

INSERT INTO public.products(id, name, image) VALUES ('7300400481595', 'Tartine croustillante Authentique - Wasa', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F7300400481595.jpg?alt=media&token=ca0f0829-f188-4d18-b5ca-ab20e89d950c');

INSERT INTO public.products(id, name, image) VALUES ('3033491588136', 'HIPRO proteines - Danone', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3033491588136.jpg?alt=media&token=a6d40785-539e-4c1e-a161-c314f1d0fab3');

INSERT INTO public.products(id, name, image) VALUES ('7300400481588', 'Tostadas crujientes de fibra - Wasa', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F7300400481588.jpg?alt=media&token=3ed2db05-60bb-4f17-b556-336e86d2b1d0');

INSERT INTO public.products(id, name, image) VALUES ('20047238', 'Mix de frutos secos al natural - Alesto', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20047238.jpeg?alt=media&token=bcaeb706-3985-4cea-a252-19d581f7c7a1');

INSERT INTO public.products(id, name, image) VALUES ('3225350000501', 'Pulco Lemon', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3225350000501.jpg?alt=media&token=3c7cefe9-3526-4263-98f5-e30e7a01c326');

INSERT INTO public.products(id, name, image) VALUES ('8076802085738', 'Penne rigate - Barilla', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8076802085738.jpg?alt=media&token=cade13d5-708a-4729-a8a6-8cf4f5a30963');

INSERT INTO public.products(id, name, image) VALUES ('8076809529419', 'Espagueti integral - Barilla', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8076809529419.jpg?alt=media&token=a42cd19e-c061-4c33-b3f9-2634acdb5fc1');

INSERT INTO public.products(id, name, image) VALUES ('5411188110835', 'Alpro Almond', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F5411188110835.jpg?alt=media&token=764cb332-c2b0-4159-ae39-731ffaaefad4');

INSERT INTO public.products(id, name, image) VALUES ('8480000633224', 'Delicias de Pollo - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000633224.jpg?alt=media&token=5e9c915e-c8ea-499c-bd75-e5189330a8f1');

INSERT INTO public.products(id, name, image) VALUES ('8715035110106', 'Salsa de soja - Kikkoman', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8715035110106.jpg?alt=media&token=d3f79d42-442f-468a-83e9-d2de32fd86bf');

INSERT INTO public.products(id, name, image) VALUES ('8423352861402', 'Bebida de avena - ALITEY ', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8423352861402.jpg?alt=media&token=a3a1b18c-36c8-4d90-b562-7b21f640fb56');

INSERT INTO public.products(id, name, image) VALUES ('8480000633231', 'Nuggets de pollo - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000633231.jpg?alt=media&token=ada3b4e8-bd89-46a6-bc82-5f85e0ec1be8');

INSERT INTO public.products(id, name, image) VALUES ('8437017032984', 'Nuggets originales - Heura', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8437017032984.jpg?alt=media&token=30c5a86a-abff-428d-9c81-fc5c4289df78');

INSERT INTO public.products(id, name, image) VALUES ('8480000561695', 'Pechuga pollo braseada finas lonchas - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000561695.jpg?alt=media&token=53dd6918-259c-49ac-9e8f-67b4d8c77c09');

INSERT INTO public.products(id, name, image) VALUES ('8436021411396', 'Burger de pavo y pollo - Mercadona', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8436021411396.jpg?alt=media&token=22255074-5715-4f1d-bf49-fc44f643d9e4');

INSERT INTO public.products(id, name, image) VALUES ('8480000809421', 'Tortillas de trigo integrales - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000809421.jpg?alt=media&token=4b364401-015a-4691-953d-3ad8597136c6');

INSERT INTO public.products(id, name, image) VALUES ('8000430133035', 'Mozarella - Galbani', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8000430133035.jpg?alt=media&token=969f3c51-d4da-4a0c-a55b-2b9bc60af313');

INSERT INTO public.products(id, name, image) VALUES ('8431876038385', 'Turron trufado con pasas al licor - Carrefour', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8431876038385.jpg?alt=media&token=565e2898-5b31-450b-9c33-1d837391a058');

INSERT INTO public.products(id, name, image) VALUES ('13179515', 'Carne picada vacuno', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F13179515.jpeg?alt=media&token=8cc13aa0-08cb-402e-92a1-e958858f5334');

INSERT INTO public.products(id, name, image) VALUES ('8480000061423', 'Tortelloni de carne - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000061423.jpg?alt=media&token=59bf3826-ddb6-41ff-9ccd-0f4866772eca');

INSERT INTO public.products(id, name, image) VALUES ('3270190192794', 'Naranja sin pulpa - Carrefour', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F3270190192794.jpg?alt=media&token=f108174d-59ba-4002-9b77-11a4371deb62');

INSERT INTO public.products(id, name, image) VALUES ('8480000349613', 'Chia - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000349613.jpg?alt=media&token=6a0ab639-62f3-4a75-af2c-a6031730054b');

INSERT INTO public.products(id, name, image) VALUES ('8410422111048', 'Allioli - Chovi', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8410422111048.jpg?alt=media&token=3a2f0da6-f4e0-4f6f-ab67-871b40e35913');

INSERT INTO public.products(id, name, image) VALUES ('8480000531001', 'Salchicha estilo frankfurt con queso - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000531001.jpg?alt=media&token=576214a0-d1cf-49aa-b835-5cabbadd688d');

INSERT INTO public.products(id, name, image) VALUES ('8480000152039', 'Piña en su Jugo - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000152039.jpg?alt=media&token=a93cf649-d125-4858-a7c6-ece9c533973c');

INSERT INTO public.products(id, name, image) VALUES ('8423352800159', 'Leche De Almendras - Almendrola', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8423352800159.jpg?alt=media&token=4009ced0-85e1-44f3-a4de-77e7d61b8571');

INSERT INTO public.products(id, name, image) VALUES ('8480000158109', 'Light - Hacendado', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8480000158109.jpg?alt=media&token=14b558aa-f0f7-43cc-ae96-3054965b7d9e');

INSERT INTO public.products(id, name, image) VALUES ('20408923', 'Buttercookies - Sondey', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20408923.jpg?alt=media&token=b566c639-b546-4d4f-bbc5-e11171483b7e');

INSERT INTO public.products(id, name, image) VALUES ('20413422', 'Anacardos tostados y salados - Alesto', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F20413422.jpg?alt=media&token=f643d15f-b5c1-479d-a0ad-603ca1f19542');

INSERT INTO public.products(id, name, image) VALUES ('8431876272086', 'Gamba cocida mediterraneo - Carrefour', 'https://firebasestorage.googleapis.com/v0/b/taam-app.appspot.com/o/Product%20images%2F8431876272086.jpg?alt=media&token=e6d3c6eb-8afd-4759-adbe-0443bd5651f0');


/* INSERTs table ingredients */

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('azucar blanco', 'sucre blanc', 'white sugar', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('plantas oleaginosas', 'plantes oleaginoses', 'oil plants', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de arroz', 'farina darros', 'rice flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almidon de trigo', 'mido de blat', 'wheat starch', 0, 0, 0, 2, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de maiz', 'farina de blat de moro', 'maize flour', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('emulsionante e471', 'emulsionant e471', 'emulsifier e471', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('maltodextrina', 'maltodextrina', 'maltodextrin', 0, 0, 0, 0, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sal', 'sal', 'salt', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('extracto de levadura', 'extracte de llevat', 'yeast extract', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('levadura en polvo', 'llevat en pols', 'yeast powder', 0, 0, 2, 1, 2, 2);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('color (annatto)', 'color (annatto)', 'colour (annatto)', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('maiz', 'blat de moro', 'corn', 0, 0, 1, 2, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('azucar', 'sucre', 'sugar', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('malta de cebada', 'malt dordi', 'barley malt', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cereales (avena integral y semola de maiz)', 'cereals (civada integral i semola de blat de moro)', 'cereal(wholemeal oatmeal and maize semolina)', 0, 0, 2, 2, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina integral de avena', 'farina integral de civada', 'wholemeal-oat-flour', 0, 0, 0, 2, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('e306', 'e306', 'e306', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('agua', 'aigua', 'water', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('lupulo', 'llupol', 'hops', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pimienta', 'pebre', 'pepper', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('quinoa blanca', 'quinoa blanca', 'white-quinoa', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('quinoa roja', 'quinoa vermella', 'red-quinoa', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de oliva virgen', 'oli doliva verge', 'virgin-olive-oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('lecitina de girasol', 'lecitina de gira-sol', 'sunflower-lecithin', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sal marina', 'sal marina', 'sea salt', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('granos de maiz enteros', 'grans de blat de moro sencers', 'whole corn kernels', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de girasol alto oleico', 'oli de gira-sol alt oleic', 'high oleic sunflower oil', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina', 'farina', 'flour', 0, 0, 0, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de oliva', 'oli doliva', 'olive oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('extracto de malta de cebada', 'extracte de malt dordi', 'barley malt extract', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sal yodada', 'sal iodada', 'iodised salt', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('levadura', 'llevat', 'yeast', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aromas', 'aromes', 'flavourings', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pimenton', 'pebre roig', 'paprika', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cebolla', 'ceba', 'onion', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('ajo', 'all', 'garlic', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('masa de cacao', 'massa de cacau', 'cocoa mass', 0, 0, 2, 2, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('manteca de cacao', 'mantega de cacau', 'cocoa butter', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacao en polvo bajo en grasas', 'cacau en pols baixa en greixos', 'low fat cocoa powder', 0, 0, 2, 2, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vainilla', 'vainilla', 'vanilla', 0, 0, 2, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('palomitas de maiz', 'crispetes de blat de moro', 'hand popped corn', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de colza', 'oli de colza', 'rapeseed oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('tomate', 'tomaquet', 'tomato', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almidon de maiz modificado', 'mido de blat de moro modificat', 'modified corn starch', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('conservante (sorbato potasico)', 'conservant (sorbato potassic)', 'preservative (potassium sorbate)', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semola de trigo duro', 'semola de blat dur', 'durum wheat semolina', 0, 0, 0, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('huevos', 'ous', 'eggs', 1, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacahuetes tostados el 90% de las veces', 'cacauets torrats el 90% de les vegades', 'roasted peanuts 90%', 2, 2, 1, 2, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de girasol', 'oli de gira-sol', 'sunflower oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacahuetes tostados', 'cacauets torrats', 'roasted peanuts', 0, 0, 2, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('grasa vegetal de palma hidrogenada', 'greix vegetal de palma hidrogenada', 'hydrogenated palm vegetable fat', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche cruda', 'llet crua', 'raw milk', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('fermentos lacteos', 'fermentos lactis', 'dairy ferments', 1, 0, 2, 0, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche entera', 'llet sencera', 'whole milk', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('crema', 'crema', 'cream', 1, 0, 2, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche desnatada en polvo', 'llet desnatada en pols', 'skimmed milk powder', 1, 0, 2, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('nueces', 'nous', 'walnuts', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('avellanas', 'avellanes', 'hazelnuts', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('anacardos', 'anacards', 'cashews', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almendras blanqueadas', 'ametlles blanquejades', 'blanched almonds', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cultivos microbianos', 'cultius microbians', 'microbial cultures', 2, 1, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cuajo microbiano', 'quall microbia', 'microbial rennet', 2, 1, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('salmon', 'salmo', 'salmon', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('humo de leña de haya', 'fum de llenya de faig', 'haya wood smoke', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('caballa', 'verat', 'mackerel', 1, 1, 2, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('sirope de glucosa', 'xarop de glucosa', 'glucose syrup', 0, 0, 2, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('mascarpone', 'mascarpone', 'mascarpone', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de trigo', 'farina de blat', 'wheat flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vino marsala', 'vi marsala', 'marsala wine', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cacao desgrasado natural en polvo', 'cacau desgrasat natural en pols', 'natural defatted cocoa powder', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vitamina-c', 'vitamina-c', 'vitamine-c', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vitamina-d', 'vitamina-d', 'vitamine-d', 0, 0, 2, 2, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aromatizante natural', 'aromatitzant natural', 'natural-flavouring', 2, 2, 2, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('lecitina de soja', 'lecitina de soia', 'soya-lecithin', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('canela', 'canyella', 'cinnamon', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('chocolate', 'xocolata', 'chocolate', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('licor', 'licor', 'licor', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('cerezas', 'cireres', 'cherries', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('mezcla de proteinas', 'mescla de proteines', 'protein blend', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('nueces de macadamia', 'nous de macadamia', 'macadamia nuts', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche desnatada en polvo', 'llet desnatada en pols', 'skimmed-milk powder', 1, 0, 2, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('suero dulce en polvo (leche)', 'serum dolç en pols (llet)', 'sweet whey powder (milk)', 0, 1, 0, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('grasa de mantequilla pura', 'greix de mantega pura', 'pure butter fat', 1, 0, 1, 2, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almendras enteras', 'ametlles senceres', 'whole-almonds', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche entera en polvo', 'llet sencera en pols', 'whole-milk-powder', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vodka', 'vodka', 'vodka', 0, 0, 2, 1, 1, 1);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche condensada azucarada y desnatada', 'llet condensada ensucrada i desnatada', 'sweetened and skimmed condensed milk', 1, 0, 1, 0, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite de palma', 'oli de palma', 'palm oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('whisky', 'whisky', 'whiskey', 0, 0, 1, 1, 2, 1);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('arandanos rojos', 'nabius vermells', 'red cranberries', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('producto integral', 'producte integral', 'wholemeal', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de centeno', 'farina de segol', 'rye flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('oligofructosa', 'oligofructosa', 'oligofructose', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aroma natural de vainilla', 'aroma natural de vainilla', 'natural vanilla flavor', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('vainilla bourbon en polvo', 'vainilla bourbon en pols', 'bourbon vanilla powder', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de centeno integral', 'farina sencera de segol', 'whole rye flour', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('salvado', 'sego', 'bran', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('avena', 'civada', 'oatmeal', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semillas de sesamo', 'llavors de sesam', 'sesame seeds', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('germen de trigo', 'germen de blat', 'wheat germ', 0, 0, 0, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('jugo concentrado: limon', 'suc concentrat: llimona', 'concentrated juice: lemon', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('jugo concentrado: naranja', 'suc concentrat: taronja', 'concentrated juice: orange', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semola de trigo', 'semola de blat', 'wheat semolina', 0, 0, 0, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('almendras', 'ametlles', 'almonds', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pechuga de pollo', 'pit de pollastre', 'chicken breast', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('fecula de patata', 'fecula de patata', 'potato starch', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('soja', 'soja', 'soybeans', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne de pollo', 'carn de pollastre', 'chicken meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('proteina de soja', 'proteina de soja', 'soy protein', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne de pavo', 'carn de gall dindi', 'turkey meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('leche pasteurizada', 'llet pasteuritzada', 'pasteurised milk', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pasas', 'passes', 'raisins', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pasta almendra', 'pasta ametlla', 'almond paste', 0, 0, 1, 1, 0, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('alcohol', 'alcohol', 'alcohol', 0, 0, 1, 1, 1, 1);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne de vacuno', 'carn de bovi', 'beef meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('carne estofada', 'carn estofada', 'braised meat', 1, 1, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('manteca', 'mantega', 'butter', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('semillas de chia', 'llavors de chia', 'chia seeds', 0, 0, 1, 1, 2, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('aceite vegetal', 'oli vegetal', 'vegetable oil', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('queso fundido', 'formatge fos', 'melted cheese', 1, 0, 1, 0, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('pina', 'pinya', 'pineapple', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('zumo de piña', 'suc de pinya', 'pineapple juice', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('harina de patata', 'farina de patata', 'potato flour', 0, 0, 1, 1, 1, 0);

INSERT INTO public.ingredients(name_spanish, name_catalan, name_english, vegan, vegetarian, celiac, lactose, nuts, teetotal) VALUES ('gamba blanca', 'gamba blanca', 'white shrimp', 1, 1, 1, 1, 1, 0);

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

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8412598000010', 114);

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

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8480000171320', 36);

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

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('3245414658769', 114);

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

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876272086', 124);

INSERT INTO public.products_ingredients(product_id, ingredient_id) VALUES ('8431876272086', 8);

/* INSERTs table frequent_questions */

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) 
VALUES (
    '¿Como usuario puedo recomendar la agregación de un producto que no aparece en la aplicación?', 
    'Com a usuari puc recomanar l''agregació d''un producte que no apareix en l''aplicació?', 
    'As a user, can I recommend the addition of a product that does not appear in the application?', 
    'Si. Cuando introduzca un producto (desde cualquiera de los dos buscadores o el escaneo de código de barras) y este no está en nuestras bases de datos se os mostrara por una pantalla  un aviso y un botón "Reportar Producto". Debe presionar el botón para solicitar el producto.', 
    'Si. Quan introdueixi un producte (des de qualsevol dels dos cercadors o l''escaneig de codi de barres) i aquest no estigui a les nostres bases de dades se us mostrarà per una pantalla un avís i un botó "Informar sobre producte". Ha de prémer el botó per sol·licitar el producte.', 
    'Yes. When you enter a product (from either of the two search engines or barcode scanning) and it is not in our databases, you will be shown a notice and a "Report Product" button on the screen. You must press the button to request the product.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Que significa que un ingrediente es dudoso?', 
    'Què significa que un ingredient sigui dubtós?', 
    'What does it mean when an ingredient is dubious?', 
    'La presencia de un ingrediente dudoso puede significar dos cosas. En primer lugar, puede ser que el ingrediente en general no contenga sustancias que violen la restricción alimentaria, pero como este ingrediente no ha sido lo suficientemente investigado o no ha arrojado resultados estables y seguros en investigaciones sobre su contenido de la sustancia, se considera que puede contener esta sustancia restrictiva. En segundo lugar, puede ser que el alimento se produzca en una fábrica que procesa otros alimentos que contienen una sustancia que no cumple la restricción y, por lo tanto, existe una probabilidad de que esta sustancia haya caído o se haya mezclado con este alimento.', 
    'La presència d''un ingredient dubtós pot significar dues coses. En primer lloc, pot ser que l''ingredient en general no contingui substàncies que violin la restricció alimentària, però com que aquest ingredient no ha estat prou investigat o no ha donat resultats estables i segurs en investigacions sobre el seu contingut de la substància, es considera que pot contenir aquesta substància restrictiva. En segon lloc, pot ser que l''aliment es produeixi en una fàbrica que processa altres aliments que contenen una substància que no compleix la restricció i, per tant, existeix una probabilitat que aquesta substància hagi caigut o s''hagi barrejat amb aquest aliment.', 
    'The presence of a questionable ingredient can mean two things. Firstly, that the ingredient in general does not contain substances that violate the dietary restriction, but since this ingredient has not been sufficiently investigated or has not yielded stable and secure results in research on its content of the substance, it is considered that it may contain this restrictive substance. Secondly, it may be that the food is produced in a factory that processes other foods that contain a substance that does not comply with the restriction, and therefore there is a probability that this substance has fallen or been mixed with this food.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Puedo consumir un producto que contiene ingredientes dudosos respecto a mis restricciones?', 
    'Puc consumir un producte que conté ingredients dubtosos respecte a les meves restriccions?', 
    'Can I consume a product that contains ingredients that are dubious with regard to my restrictions?', 
    'No es recomendable consumir un producto que contenga ingredientes que no cumplan con vuestras restricciones alimentarias. El consumo de este producto es responsabilidad exclusiva del consumidor y dependerá del grado de sensibilidad o alergia que tenga a dicho ingrediente, pudiendo provocar reacciones negativas en su organismo.', 
    'No és recomanable consumir un producte que contingui ingredients que no compleixin les vostres restriccions alimentàries. El consum d''aquest producte és responsabilitat exclusiva del consumidor i depèn del grau de sensibilitat o al·lèrgia que tingui a aquest ingredient, podent provocar reaccions negatives en el seu organisme.', 
    'It is not advisable to consume a product that contains ingredients that do not comply with your dietary restrictions. The consumption of this product is the sole responsibility of the consumer and will depend on the degree of sensitivity or allergy they have to that ingredient, which can cause negative reactions in their body.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    'Tengo restricciones alimentarias. ¿Esta aplicación puede ajustarse a ellas?', 
    'Tinc restriccions alimentàries. Aquesta aplicació pot adaptar-se a elles?', 
    'I have dietary restrictions. Can this app accommodate them?', 
    'Sí, la aplicación ha sido creada precisamente para este propósito. Desde el icono de ajustes ubicado en la esquina superior de la pantalla principal, puede configurar sus restricciones alimentarias para que la aplicación pueda recomendarle alimentos adecuados a sus necesidades y mostrarle qué ingredientes en los productos que busque son los que hacen que el producto sea apto o no apto para usted.', 
    'Sí, l''aplicació ha estat creada precisament per a aquesta finalitat. Des de la icona d''ajustos situada a la cantonada superior de la pantalla principal, pot configurar les seves restriccions alimentàries perquè l''aplicació pugui recomanar-li aliments adequats a les seves necessitats i mostrar-li quins ingredients en els productes que busqui són els que fan que el producte sigui apte o no apte per a vostè.', 
    'Yes, the application has been created precisely for this purpose. From the settings icon located in the upper corner of the main screen, you can configure your dietary restrictions so that the application can recommend appropriate foods to meet your needs and show you which ingredients in the products you search for make the product suitable or unsuitable for you.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Cómo puedo configurar mis restricciones alimentarias?', 
    'Com puc configurar les meves restriccions alimentàries?', 
    'How can I set up my dietary restrictions?', 
    'Desde la pantalla principal, al presionar el icono de ajustes ubicado en la esquina superior derecha, tendrá acceso a la configuración de sus restricciones alimentarias.', 
    'Des de la pantalla principal, en prémer la icona d''ajustos situada a la cantonada superior dreta, tindrà accés a la configuració de les seves restriccions alimentàries.', 
    'From the main screen, by pressing the settings icon located in the upper-right corner, you will have access to the configuration of your dietary restrictions.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Cómo puedo saber si un producto es apto para mis restricciones alimentarias?', 
    'Com puc saber si un producte és apte per a les meves restriccions alimentàries?', 
    'How can I tell if a product is suitable for my dietary restrictions?', 
    'Puede verificar si un producto es adecuado para sus restricciones revisando los ingredientes del mismo. En la parte derecha de la tabla de ingredientes, proporcionamos información sobre si el ingrediente es apto, no apto o dudoso con respecto a sus restricciones. Además, en la pantalla principal de la aplicación, se le recomendarán únicamente productos que sean adecuados según sus restricciones.', 
    'Pot comprovar si un producte és adequat per a les seves restriccions revisant els ingredients del mateix. A la part dreta de la taula d''ingredients, proporcionem informació sobre si l''ingredient és apte, no apte o dubtós amb respecte a les seves restriccions. A més, en la pantalla principal de l''aplicació, se li recomanaran únicament productes que siguin adequats segons les seves restriccions.', 
    'You can determine whether a product is suitable for your restrictions by checking its ingredients. On the right-hand side of the ingredient table, we provide information on whether the ingredient is suitable, unsuitable, or dubious with respect to your restrictions. Additionally, on the main screen of the application, we will recommend only products that are suitable according to your restrictions.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    'Una vez definidas mis restricciones alimentarias, ¿puedo volver a configurarlas?', 
    'Un cop definides les meves restriccions alimentàries, puc tornar a configurar-les?', 
    'Once my dietary restrictions are defined, can I reconfigure them?', 
    'Sí. Puede modificar sus restricciones alimentarias cuantas veces lo desee. La aplicación se actualizará automáticamente para adaptarse a sus nuevas necesidades.', 
    'Sí. Pot modificar les seves restriccions alimentàries tantes vegades com desitgi. L''aplicació s''actualitzarà automàticament per adaptar-se a les seves noves necessitats.', 
    'Yes. You can modify your dietary restrictions as many times as you wish. The application will update automatically to adapt to your new needs.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Cómo puedo reportar un error o problema en la aplicación?',
    'Com puc informar d''un error o problema a l''aplicació?',
    'How can I report a bug or issue in the app?',
    'En esta aplicación, diferenciamos entre dos tipos de errores. Si el error es que un producto no existe, se puede informar en el momento en que se busca el producto. La aplicación indicará que este no existe y, entonces, se mostrará un botón para reportar. Este botón enviará una notificación a los administradores para que añadan este producto a Taam App. En caso de que el error esté relacionado con el resultado de una comprobación, donde el usuario crea que es incorrecto (por ejemplo, si la aplicación indica un producto como apto y el usuario piensa lo contrario), hay un botón en la parte inferior de la pantalla donde se muestran los detalles del producto. Este botón permite enviar una incidencia a los administradores para que revisen el resultado.',
    'En aquesta aplicació, diferenciem entre dos tipus d''errors. Si l"error és que un producte no existeix, es pot informar en el moment en què es busca el producte. L"aplicació indicarà que aquest no existeix i, aleshores, es mostrarà un botó per reportar. Aquest botó enviarà un avís als administradors perquè afegeixin aquest producte a Taam App. En cas que l"error estigui relacionat amb el resultat d"una comprovació, on l"usuari cregui que és incorrecte (per exemple, si l"aplicació indica un producte com a apte i l"usuari pensa el contrari), hi ha un botó a la part inferior de la pantalla on es mostren els detalls del producte. Aquest botó permet enviar una incidència als administradors perquè revisin el resultat.',
    'In this application, we differentiate between two types of errors. If the error is that a product does not exist, it can be reported at the moment the product is searched for. The application will indicate that it does not exist, and then a button to report it will be shown. This button will send a notification to the administrators to add the product to Taam App. If the error is related to the result of a check, where the user believes it is incorrect (for example, if the application indicates a product as suitable and the user thinks otherwise), there is a button at the bottom of the screen showing the product details. This button allows sending an incident report to the administrators for review.'
);

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Puedo cambiar el idioma de la aplicación?',    
    'Puc canviar l''idioma de l''aplicació?',
    'Can I change the language of the app?',
    'Sí, la aplicación Taam App está disponible (actualmente) en tres idiomas diferentes: español, catalán e inglés. Para cambiar el idioma, es necesario acceder a la pantalla de configuración (para acceder a esta pantalla, se debe hacer clic en el engranaje que se encuentra en la parte superior derecha de la pantalla). Una vez en esta pantalla, se encontrará un menú desplegable para seleccionar el idioma deseado. A través de este menú desplegable, se puede seleccionar el idioma de preferencia y toda la aplicación se mostrará en ese idioma.',
    'Sí, l"aplicació Taam App es troba disponible (actualment) en tres idiomes diferents: espanyol, català i anglès. Per canviar l"idioma, és necessari accedir a la pantalla de configuració (per accedir a aquesta pantalla, cal clicar a l"engranatge que es troba a la part superior dreta de la pantalla). Un cop en aquesta pantalla, es trobarà un desplegable per seleccionar l"idioma desitjat. A través d"aquest desplegable, es pot seleccionar l"idioma de preferència i tota l"aplicació es mostrarà en aquest idioma.',
    'Yes, the Taam App is available (currently) in three different languages: Spanish, Catalan, and English. To change the language, you need to access the settings screen (to access this screen, you must click on the gear icon located at the top right of the screen). Once on this screen, you will find a drop-down menu to select the desired language. Through this drop-down menu, you can select the preferred language and the entire application will be displayed in that language.'
);
    
INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿La aplicación ofrece información nutricional de los productos?',
    'L''aplicació ofereix informació nutricional dels productes?',
    'Does the app provide nutritional information for products?',
    'Nuestra aplicación no proporciona información nutricional, pero ofrece una lista completa de ingredientes de los productos, lo que proporciona a los usuarios una comprensión detallada de la composición de los productos.',
    'La nostra aplicació no proporciona informació nutricional, però ofereix una llista completa d"ingredients dels productes, la qual proporciona als usuaris una comprensió detallada de la composició dels productes.',
    'Our application does not provide nutritional information, but it does offer a complete list of ingredients for products, which provides users with a detailed understanding of the composition of the products.'
);
    
INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Puedo buscar productos por marca o fabricante?',
    'Puc cercar productes per marca o fabricant?',
    'Can I search for products by brand or manufacturer?',
    'Actualmente, la aplicación Taam App no dispone de la funcionalidad de búsqueda de productos por marca o fabricante. Solo ofrece la opción de buscarlos a través del código de barras (introduciéndolo manualmente o escaneándolo) o por nombre',
    'Actualment, l"aplicació Taam App no disposa de la funcionalitat de cerca de productes per marca o fabricant. Només ofereix l"opció de buscar-los a través del codi de barres (introduint-lo manualment o escanejant-lo) o pel nom.',
    'Currently, the Taam App does not have the functionality to search for products by brand or manufacturer. It only offers the option to search for them through the barcode (by manually entering it or scanning it) or by name.'
);    

INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Como puedo enviar una petición de pregunta?',
    'Com puc enviar una sol·licitud de pregunta?',
    'How can I submit a question request?',
    'Para enviar una pregunta, debes acceder a la pantalla de preguntas frecuentes, donde encontrarás la opción de enviar una pregunta. Al hacer clic en esta opción, se abrirá una ventana en la que podrás redactar tu consulta y enviarla. Tu mensaje será atendido por uno de los administradores y, si es necesario, se agregará a la sección de preguntas frecuentes con la respuesta correspondiente.',
    'Per enviar una pregunta has d"accedir a la pantalla de preguntes freqüents, on trobaràs l"opció enviar dubte. En fer clic en aquesta opció, se t"obrirà una finestra on podràs redactar la teva consulta i enviar-la. El teu missatge serà atès per un dels administradors i, si s"escau, s"afegirà a la secció de preguntes freqüents amb la resposta.',
    'To send a question, you must access the frequently asked questions screen, where you will find the option to send a question. When you click on this option, a window will open where you can write your query and send it. Your message will be attended by one of the administrators, and if necessary, it will be added to the frequently asked questions section with the corresponding answer.'
);
    
INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Cómo puedo ver los ingredientes de un producto?',
    'Com puc veure els ingredients d''un producte?',
    'How can I see the ingredients of a product?',
    'En el momento en que buscas un producto o haces clic en un producto recomendado, se abrirá una pantalla donde se mostrarán detalles de este, como si es adecuado según tus restricciones. En la misma pantalla podrás ver la lista de ingredientes del producto, que se mostrará justo debajo de la imagen del mismo.',
    'En el moment en què busques un producte o cliques en un producte recomanat, se t"obrirà una pantalla on es mostraran detalls d"aquest, com ara si és apte segons les teves restriccions. A la mateixa pantalla podràs veure la llista d"ingredients del producte, la qual es mostrarà just a sota de la imatge del mateix.',
    'When you search for a product or click on a recommended product, a screen will open displaying details about it, such as whether it is suitable according to your restrictions. On the same screen, you will be able to see the list of product ingredients, which will be displayed just below its image.'
); 
    
INSERT INTO public.frequent_questions(question_spanish, question_catalan, question_english, response_spanish, response_catalan, response_english) VALUES (
    '¿Puedo buscar productos por el código de barras?',
    'Puc cercar productes pel codi de barres?',
    'Can I search for products by barcode?',
    'Sí, puedes buscar productos por su código de barras. Desde la pantalla inicial de la aplicación, que se muestra después de indicar tus preferencias, tienes la opción de buscar un producto introduciendo manualmente su código de barras o escaneándolo. Además, también puedes buscar un producto por su nombre.',
    'Sí, pots cercar productes pel seu codi de barres. Des de la pantalla inicial de l"aplicació, que es mostra després d"indicar les teves preferències, tens la opció de cercar un producte introduint manualment el seu codi de barres o escanejant-lo. A més, també pots cercar un producte pel seu nom.',
    'Yes, you can search for products by their barcode. From the initial screen of the application, which is displayed after indicating your preferences, you have the option to search for a product by manually entering its barcode or scanning it. In addition, you can also search for a product by its name.'
);

/* Other - for testing */

INSERT INTO public.question_requests(question_user) VALUES ('¿Como puedo avisar sobre un producto que he encontrado con restricciones incorrectas?');
