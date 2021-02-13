

alter TABLE titles DROP CONSTRAINT titles_pkey;


ALTER TABLE titles ADD PRIMARY KEY (emp_no, title, from_date)

-- Then change column name of  your PRIMARY KEY and PRIMARY KEY candidates properly.
--ALTER TABLE <table_name> RENAME COLUMN <primary_key_candidate> TO id;