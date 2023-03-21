CREATE TABLE IF NOT EXISTS public.incidents
(
    id SERIAL PRIMARY KEY,
    result text,
    observation text,
    product_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.ingredients
(
    id SERIAL PRIMARY KEY,
    namespanish text,
    namecatalan text,
    nameenglish text,
    vegan boolean,
    vegetarian boolean,
    celiac boolean,
    lactose boolean,
    nuts boolean,
    teetotal boolean
);

CREATE TABLE IF NOT EXISTS public.notfound
(
    id SERIAL PRIMARY KEY,
    barcode integer,
    productname text
);

CREATE TABLE IF NOT EXISTS public.products
(
    id text NOT NULL,
    name text,
    PRIMARY KEY (id) 
);

CREATE TABLE IF NOT EXISTS public.products_ingredients
(
    product_id integer NOT NULL,
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