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

  END