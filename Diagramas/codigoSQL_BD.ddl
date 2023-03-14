-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2023-03-14 16:55:13 CET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE incidents CASCADE CONSTRAINTS;

DROP TABLE ingredients CASCADE CONSTRAINTS;

DROP TABLE notfound CASCADE CONSTRAINTS;

DROP TABLE products CASCADE CONSTRAINTS;

DROP TABLE products_ingredients CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE incidents (
    id          INTEGER NOT NULL,
    result      CLOB,
    observation CLOB,
    product_id  INTEGER NOT NULL
);

ALTER TABLE incidents ADD CONSTRAINT incidents_pk PRIMARY KEY ( id );

CREATE TABLE ingredients (
    id          INTEGER NOT NULL,
    namespanish CLOB,
    namecatalan CLOB,
    nameenglish CLOB,
    vegan       CHAR(1),
    vegetarian  CHAR(1),
    celiac      CHAR(1) NOT NULL,
    lactose     CHAR(1),
    nuts        CHAR(1),
    teetotal    CHAR(1)
);

ALTER TABLE ingredients ADD CONSTRAINT ingredients_pk PRIMARY KEY ( id );

CREATE TABLE notfound (
    id          INTEGER NOT NULL,
    barcode     INTEGER,
    productname CLOB
);

ALTER TABLE notfound ADD CONSTRAINT notfound_pk PRIMARY KEY ( id );

CREATE TABLE products (
    id   INTEGER NOT NULL,
    name CLOB
);

ALTER TABLE products ADD CONSTRAINT products_pk PRIMARY KEY ( id );

CREATE TABLE products_ingredients (
    product_id    INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL
);

ALTER TABLE products_ingredients ADD CONSTRAINT products_ingredients_pk PRIMARY KEY ( product_id,
                                                                                      ingredient_id );

ALTER TABLE incidents
    ADD CONSTRAINT incidents_products_fk FOREIGN KEY ( product_id )
        REFERENCES products ( id );

ALTER TABLE products_ingredients
    ADD CONSTRAINT ingredients_fk FOREIGN KEY ( ingredient_id )
        REFERENCES ingredients ( id );

ALTER TABLE products_ingredients
    ADD CONSTRAINT products_fk FOREIGN KEY ( product_id )
        REFERENCES products ( id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
