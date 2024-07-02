COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок';
COMMENT ON COLUMN person_discounts.id IS 'Идентификатор скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор посетителя';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор ресторана';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка в процентах';