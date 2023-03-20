CREATE DATABASE "TaamAppDB"
    WITH
    OWNER = taamapp
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE IF NOT EXISTS public.incidents
(
    id integer NOT NULL,
    result text,
    observation text,
    product_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.ingredients
(
    id integer NOT NULL,
    namespanish text,
    namecatalan text,
    nameenglish text,
    vegan boolean,
    vegetarian boolean,
    celiac boolean,
    lactose boolean,
    nuts boolean,
    teetotal boolean,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.notfound
(
    id integer NOT NULL,
    barcode integer,
    productname text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.products
(
    id integer NOT NULL,
    ingredient_id integer NOT NULL,
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
