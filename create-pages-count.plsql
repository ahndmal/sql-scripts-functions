create function get_author_id() returns int64 as $$
	begin
		return select floor(random() * 10 + 1);
	end;
$$ LANGUAGE plpgsql;

--- 

do
$do$
declare i int;
begin
	for i in 301..1000 loop
		insert into pages (id, title, body, space_key, author_id, created_at, last_updated, parent_id, spacekey) 
		  values (i, 'page ' || i, 'lorem aaa ' || i, 'DEV', 1, now(), now(), 100, 'DEV');		
	end loop;
end;
$do$;
