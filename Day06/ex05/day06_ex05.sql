  COMMENT ON TABLE person_discounts
  IS 'Information about personal discount for pizzerias visitors';

  COMMENT ON COLUMN person_discounts.id IS 'Discount record ID number';
  COMMENT ON COLUMN person_discounts.person_id IS 'Person ID value';
  COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria ID value';
  COMMENT ON COLUMN person_discounts.discount IS 'Percent discount value in range between 0 and 100. Default value 0';
