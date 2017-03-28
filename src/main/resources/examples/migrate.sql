--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: src/main/resources/liquibase/changelog/mysql-changelog-master.xml
--  Ran at: 29/03/17 0.01
--  Against: system@localhost@jdbc:mysql://127.0.0.1:3306/liquibasedb?createDatabaseIfNotExist=true
--  Liquibase version: 3.5.3
--  *********************************************************************

--  Lock Database
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'toshiba-lavoro (192.168.56.1)', LOCKGRANTED = '2017-03-29 00:01:51.510' WHERE ID = 1 AND LOCKED = 0;

--  Changeset src/main/resources/liquibase/changelog/1_1/1_1_changelog.xml::1_1_v_customer_invoce_tracks::diego
CREATE OR REPLACE VIEW v_customer_invoce_track AS select c.CustomerId, i.InvoiceId, il.TrackId
            from Customer c join Invoice i on (c.CustomerId = i.CustomerId)
            join InvoiceLine il on (i.InvoiceId = il.InvoiceId);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1_1_v_customer_invoce_tracks', 'diego', 'src/main/resources/liquibase/changelog/1_1/1_1_changelog.xml', NOW(), 6, '7:a6b8fb7a022842d43b8db447919e1c88', 'createView viewName=v_customer_invoce_track', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_1/1_1_changelog.xml::1.1::diego
INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('1.1', 'diego', 'src/main/resources/liquibase/changelog/1_1/1_1_changelog.xml', NOW(), 7, '7:44457298c64b709b521891c82d8cb9b3', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080', '1.1');

--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170130002415::diego
CREATE TABLE Country (id INT NOT NULL, name VARCHAR(20) NOT NULL, CONSTRAINT PK_COUNTRY PRIMARY KEY (id), CONSTRAINT unq_country_name UNIQUE (name));

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('20170130002415', 'diego', 'src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml', NOW(), 8, '7:015bdde26b936c78e73f49ef5e475f50', 'createTable tableName=Country', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170130000254::diego
CREATE TABLE City (id INT NOT NULL, name VARCHAR(20) NOT NULL, state VARCHAR(10) NULL, CONSTRAINT PK_CITY PRIMARY KEY (id), CONSTRAINT unq_city_name UNIQUE (name));

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('20170130000254', 'diego', 'src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml', NOW(), 9, '7:02956e8ead282a7b31ae3c8f68b2328a', 'createTable tableName=City', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::20170206_add_country_id_to_city::diego
ALTER TABLE City ADD country_id INT NULL;

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('20170206_add_country_id_to_city', 'diego', 'src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml', NOW(), 10, '7:dc3df78ebda574ceec032a607c23813b', 'addColumn tableName=City', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::201702062256_add_fk_city_country::diego
ALTER TABLE City ADD CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES Country (id);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702062256_add_fk_city_country', 'diego', 'src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml', NOW(), 11, '7:e59623e27096041adb1aedc5d6e15e61', 'addForeignKeyConstraint baseTableName=City, constraintName=fk_city_country, referencedTableName=Country', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml::1.2::diego
INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('1.2', 'diego', 'src/main/resources/liquibase/changelog/1_2/1_2_changelog.xml', NOW(), 12, '7:e6e2007d1f17f85dfcde137f5b0c8557', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080', '1.2');

--  Changeset src/main/resources/liquibase/changelog/1_2_1/1_2_1_changelog.xml::201702062225_insert_data_Country::diego
--  WARNING The following SQL may change each run and therefore is possibly incorrect and/or invalid:
INSERT INTO Country (id, name) VALUES (1, 'Argentina'),(2, 'Australia'),(3, 'Austria'),(4, 'Belgium'),(5, 'Brazil'),(6, 'Canada'),(7, 'Chile'),(8, 'Czech Republic'),(9, 'Denmark'),(10, 'Finland'),(11, 'France'),(12, 'Germany'),(13, 'Hungary'),(14, 'India'),(15, 'Ireland'),(16, 'Italy'),(17, 'Netherlands'),(18, 'Norway'),(19, 'Poland'),(20, 'Portugal'),(21, 'Spain'),(22, 'Sweden'),(23, 'United Kingdom'),(24, 'USA');

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702062225_insert_data_Country', 'diego', 'src/main/resources/liquibase/changelog/1_2_1/1_2_1_changelog.xml', NOW(), 13, '7:1f763c3a8190b64d7149ea959005793e', 'loadData tableName=Country', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_2_1/1_2_1_changelog.xml::20170206_insert_data_City::diego
--  WARNING The following SQL may change each run and therefore is possibly incorrect and/or invalid:
INSERT INTO City (id, name, state, country_id) VALUES (1, 'Amsterdam', 'VV', 17),(2, 'Bangalore', '', 14),(3, 'Berlin', '', 12),(4, 'Bordeaux', '', 11),(5, 'Boston', 'MA', 24),(6, 'Brasília', 'DF', 5),(7, 'Brussels', '', 4),(8, 'Budapest', '', 13),(9, 'Buenos Aires', '', 1),(10, 'Chicago', 'IL', 24),(11, 'Copenhagen', '', 9),(12, 'Cupertino', 'CA', 24),(13, 'Delhi', '', 14),(14, 'Dijon', '', 11),(15, 'Dublin', 'Dublin', 15),(16, 'Edinburgh ', '', 23),(17, 'Edmonton', 'AB', 6),(18, 'Fort Worth', 'TX', 24),(19, 'Frankfurt', '', 12),(20, 'Halifax', 'NS', 6),(21, 'Helsinki', '', 10),(22, 'Lisbon', '', 20),(23, 'London', '', 23),(24, 'Lyon', '', 11),(25, 'Madison', 'WI', 24),(26, 'Madrid', '', 21),(27, 'Montréal', 'QC', 6),(28, 'Mountain View', 'CA', 24),(29, 'New York', 'NY', 24),(30, 'Orlando', 'FL', 24),(31, 'Oslo', '', 18),(32, 'Ottawa', 'ON', 6),(33, 'Paris', '', 11),(34, 'Porto', '', 20),(35, 'Prague', '', 8),(36, 'Redmond', 'WA', 24),(37, 'Reno', 'NV', 24),(38, 'Rio de Janeiro', 'RJ', 5),(39, 'Rome', 'RM', 16),(40, 'Salt Lake City', 'UT', 24),(41, 'Santiago', '', 7),(42, 'São José dos Campos', 'SP', 5),(43, 'São Paulo', 'SP', 5),(44, 'Sidney', 'NSW', 2),(45, 'Stockholm', '', 22),(46, 'Stuttgart', '', 12),(47, 'Toronto', 'ON', 6),(48, 'Tucson', 'AZ', 24),(49, 'Vancouver', 'BC', 6),(50, 'Vienne', '', 3),(51, 'Warsaw', '', 19);

INSERT INTO City (id, name, state, country_id) VALUES (52, 'Winnipeg', 'MB', 6),(53, 'Yellowknife', 'NT', 6);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('20170206_insert_data_City', 'diego', 'src/main/resources/liquibase/changelog/1_2_1/1_2_1_changelog.xml', NOW(), 14, '7:9a5a44694ce1458f7dc45ee54014bb66', 'loadData tableName=City', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_2_1/1_2_1_changelog.xml::1.2.1::diego
INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('1.2.1', 'diego', 'src/main/resources/liquibase/changelog/1_2_1/1_2_1_changelog.xml', NOW(), 15, '7:8626c1d4b9f6dcfd35f582f25ea0c051', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080', '1.2.1');

--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::20170211_v_customer_city_country::diego
CREATE OR REPLACE VIEW v_customer_city_country AS select  cu.*,ci.id as id_city, ci.name as city_name, ci.state as city_state, co.name as country_name
            from Customer cu join City ci on (cu.City like ci.name)
            join Country co on (ci.country_id = co.id);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('20170211_v_customer_city_country', 'diego', 'src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml', NOW(), 16, '7:fa5a70f1f58432eb79925049f3bceda4', 'createView viewName=v_customer_city_country', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::20170209_add_city_id_to_customer::diego
ALTER TABLE Customer ADD city_id INT NULL;

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('20170209_add_city_id_to_customer', 'diego', 'src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml', NOW(), 17, '7:748a34a42f75278adda8aae4c2254d72', 'addColumn tableName=Customer', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::201702111550_01_p_generate_city_id::diego
DROP PROCEDURE IF EXISTS `p_generate_city_id`;

CREATE PROCEDURE `p_generate_city_id`()
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
  SQL SECURITY DEFINER
  COMMENT ''
  BEGIN

    DECLARE v_finished INTEGER DEFAULT 0;
    DECLARE cu_id INTEGER DEFAULT 0;
    DECLARE cursor_customer_id CURSOR FOR SELECT CustomerId
                                          FROM Customer;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

    DROP TEMPORARY TABLE IF EXISTS tmp_t;

    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_t
      ENGINE = MEMORY
    AS (SELECT *
        FROM v_customer_city_country);

    OPEN cursor_customer_id;

    get_customers: LOOP

      FETCH cursor_customer_id
      INTO cu_id;
      IF v_finished = 1
      THEN
        LEAVE get_customers;
      END IF;

      SELECT cu_id;

      -- build email list
      UPDATE `Customer`
      SET `city_id` = (SELECT v.id_city
                       FROM tmp_t v
                       WHERE v.CustomerId = cu_id)
      WHERE `CustomerId` = cu_id;

    END LOOP get_customers;

    CLOSE cursor_customer_id;

  END;

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702111550_01_p_generate_city_id', 'diego', 'src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml', NOW(), 18, '7:f1468279b0f5cc0051e3a09dfcf59e49', 'sql; createProcedure', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::201702121706_launch_p_generate_city_id::diego
CALL `p_generate_city_id`();

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702121706_launch_p_generate_city_id', 'diego', 'src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml', NOW(), 19, '7:821ee3b3a3ae302daf886666708ac077', 'sql', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::201702121706_v_customer_city_country_update::diego
CREATE OR REPLACE VIEW v_customer_city_country AS select  cu.*,ci.id as id_city, ci.name as city_name, ci.state as city_state, co.name as country_name
            from Customer cu join City ci on (cu.city_id like ci.id)
            join Country co on (ci.country_id = co.id);

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702121706_v_customer_city_country_update', 'diego', 'src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml', NOW(), 20, '7:17802aa37ac1acc588dc7bbcb3111294', 'createView viewName=v_customer_city_country', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml::1.3::diego
INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('1.3', 'diego', 'src/main/resources/liquibase/changelog/1_3/1_3_changelog.xml', NOW(), 21, '7:ce55380c5e0f95eeb44780b2f731f044', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080', '1.3');

--  Changeset src/main/resources/liquibase/changelog/1_4/1_4_changelog.xml::201702121720_add_column_vat_to_invoice::diego
ALTER TABLE Invoice ADD vat INT DEFAULT 22 NULL;

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702121720_add_column_vat_to_invoice', 'diego', 'src/main/resources/liquibase/changelog/1_4/1_4_changelog.xml', NOW(), 22, '7:1aec0491bdc0834fdee2ffe945d32c8a', 'addColumn tableName=Invoice', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_4/1_4_changelog.xml::1.4::diego
INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('1.4', 'diego', 'src/main/resources/liquibase/changelog/1_4/1_4_changelog.xml', NOW(), 23, '7:11aa5503ad41524ae33b30744b39cc50', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080', '1.4');

--  Changeset src/main/resources/liquibase/changelog/1_5/1_5_changelog.xml::201702201918_tbl_mysql::diego
CREATE TABLE MyMysql (id INT NOT NULL, CONSTRAINT PK_MYMYSQL PRIMARY KEY (id));

INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('201702201918_tbl_mysql', 'diego', 'src/main/resources/liquibase/changelog/1_5/1_5_changelog.xml', NOW(), 24, '7:cb4e29fc60244ed4559722456df6d371', 'createTable tableName=MyMysql', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080');

--  Changeset src/main/resources/liquibase/changelog/1_5/1_5_changelog.xml::1.5::diego
INSERT INTO DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('1.5', 'diego', 'src/main/resources/liquibase/changelog/1_5/1_5_changelog.xml', NOW(), 25, '7:69143a5b7a405690000f62c0af38aaba', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.3', '0738514080', '1.5');

--  Release Database Lock
UPDATE DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

