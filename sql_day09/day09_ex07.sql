CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS char AS $$
SELECT MIN(array_1) FROM unnest(arr) AS array_1
$$ LANGUAGE SQL;
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);