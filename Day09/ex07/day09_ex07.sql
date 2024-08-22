create or replace function func_minimum(VARIADIC arr NUMERIC[])
returns NUMERIC as $$
   begin
        return (SELECT MIN(i) FROM unnest(arr) i);
   end;
$$ language plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);