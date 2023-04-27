CREATE TABLE people (
 id int PRIMARY KEY,
 first_name varchar,
 last_name varchar,
 birthday date,
 amount real 
);
CREATE TABLE people_log (
 person_id int REFERENCES people(id),
 operation_date timestamp,
 sum real 
);
INSERT INTO people VALUES 
(1, 'Liza','Evtikhova','20.06.2001', 500), 
(2, 'Daniil','Sivokonev','12.01.2000',-900), 
(3, 'Dasha','Kuznetsova','05.12.2003', 100000), 
(4, 'Arina','Lazareva','15.10.2002',1200), 
(5, 'Victor','Zhirnov','25.02.2001',-5000);
INSERT INTO people_log VALUES 
(1, '12.09.2022 20:12', 20000),
(1, '01.01.2017 13:10',-5000),
(2, '05.12.2020 17:20', -10000), 
(2, '05.02.2018 17:20',18000),
(3, '01.01.2020 11:40',-7000),
(3, '11.11.2021 15:20',-2900),
(4, '07.12.2019 12:20', -90), 
(4, '12.02.2021 13:50', 800), 
(5, '05.05.2022 15:10',34090), 
(5, '05.01.2022 15:10',-3000),
(5, '30.12.2022 16:10',-1700);
CREATE OR REPLACE PROCEDURE statement_of_acount(d_begin timestamp, d_end 
timestamp) AS $$
DECLARE
 attrs record;
BEGIN
FOR attrs IN (SELECT operation_date, sum from people_log where 
operation_date <= d_end and operation_date >= d_begin)
 LOOP
 raise info '% %', attrs.operation_date, attrs.sum;
 END LOOP;
 raise info '% % %', (SELECT count(*) from people_log where 
operation_date <= d_end and operation_date >= d_begin),
 (SELECT sum(sum) from people_log where operation_date <= d_end and 
operation_date >= d_begin and sum >0),
 (SELECT sum(sum) from people_log where operation_date <= d_end and 
operation_date >= d_begin and sum <0);
END
$$ LANGUAGE plpgsql;
call statement_of_acount('01.01.2019 00:00:0.0', '01.11.2022 00:00:0.0'); 
CREATE OR REPLACE PROCEDURE account_operation(p_id integer, sum_to_change 
real) AS $$
BEGIN
 UPDATE people SET amount = amount + sum_to_change where id = p_id;
 INSERT INTO people_log VALUES (p_id, current_timestamp, sum_to_change);
END
$$ LANGUAGE plpgsql;
call account_operation(2, 90000); 
select * from people_log;
select * from people