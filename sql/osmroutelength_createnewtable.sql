create table kn_ways_new ();
select addgeometrycolumn('kn_ways_new', 'the_geom', 4326, 'LINESTRING', 2);
alter table kn_ways_new add column length double precision;
insert into kn_ways_new (the_geom, length) select the_geom, length from kn_ways;
create index the_geom_idx1 on kn_ways_new using gist(the_geom);
*** After every index creation run the VACCUM and ANALYZE for that table (maintenance) from pgAdmin3***
alter table kn_ways_new add column z_id BIGSERIAL;