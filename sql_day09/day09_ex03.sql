CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER AS
    $trg_person_audit$
BEGIN
    IF
(TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
        VALUES (CURRENT_TIMESTAMP, 'I', NEW.*);
    ELSEIF
(TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit
        VALUES (CURRENT_TIMESTAMP, 'U', OLD.*);
    ELSEIF
(TG_OP = 'DELETE') THEN
        INSERT INTO person_audit
        VALUES (CURRENT_TIMESTAMP, 'D', OLD.*);
END IF;
RETURN NULL;
END;
$trg_person_audit$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_audit
    AFTER INSERT OR
UPDATE OR
DELETE
ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_audit();

DROP TRIGGER trg_person_delete_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_insert_audit ON person;

DROP FUNCTION fnc_trg_person_delete_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_insert_audit();

TRUNCATE person_audit;

INSERT INTO person
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE
FROM person
WHERE id = 10;