--"Brad-s-Future-Camp-Program"
--Program for assigning project periods at camp

CREATE DATABASE "CampActivities_DB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
------------------------------------------------------------------------
------------------------------------------------------------------------
--Create tables for each activity
	CREATE TABLE counselor (
		id		VARCHAR(7),
		year		INTEGER,
		SESSION		INTEGER,
		CONSTRAINT counselor_pkey PRIMARY KEY (id, year, session)
	);
	
		CREATE TABLE cabin (
		cabin		VARCHAR(6),
		year		INTEGER,
		session		INTEGER,
		occupants	VARCHAR(7),
		CONSTRAINT classroom_pkey PRIMARY KEY (cabin, year, session, occupants)
	);
	
		CREATE TABLE activity (
		act_num		NUMERIC(2,0),
		minimum		NUMERIC(2,0),
		maximum		NUMERIC(2,0),
		CONSTRAINT classroom_pkey PRIMARY KEY (act_num)
	);
	
		CREATE TABLE camper (
		id		VARCHAR(7),
		name		VARCHAR(25),
		DOB		DATE,
		n_summers	INTEGER,
		CONSTRAINT classroom_pkey PRIMARY KEY (id)
	);
	
		CREATE TABLE session (
		year		INTEGER,
		session		INTEGER,
		id		VARCHAR(7)
		CONSTRAINT classroom_pkey PRIMARY KEY (year, session, id)
	);
	
		CREATE TABLE takes (
		act_num		NUMERIC(2,0),
		id		VARCHAR(7),
		period		INTEGER,
		week		INTEGER,
		year		INTEGER,
		session		INTEGER,
		location	VARCHAR(15),
		inst_id		VARCHAR(7),
		CONSTRAINT classroom_pkey PRIMARY KEY (act_num, period, year, session, inst_id, id, location)
	);
	
		CREATE TABLE huts (
		cabin		VARCHAR(6),
		max_occ		INTEGER,
		min_occ		INTEGER,
		village		VARCHAR(6),
		age_group	VARCHAR(6),
		year_built	INTEGER,
		CONSTRAINT classroom_pkey PRIMARY KEY (cabin, year_built)
	);
	
		CREATE TABLE prereq (
		act_num		NUMERIC(2,0),
		prereq_num	NUMERIC(2,0),
		CONSTRAINT classroom_pkey PRIMARY KEY (act_num, prereq_num)
	);
	
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--INSERT INTO activity VALUES ('<activityname> - <level>', 'min', 'max')

INSERT INTO activity VALUES ('Archery - Beginner', '5', '15')
INSERT INTO activity VALUES ('Archery - Intermediate', '5', '15')
INSERT INTO activity VALUES ('Archery - Advanced', '3', '15')

INSERT INTO activity VALUES ('ArtsNCrafts - Beginner', '5', '10')
INSERT INTO activity VALUES ('ArtsNCrafts - Intermediate', '5', '10')
INSERT INTO activity VALUES ('ArtsNCrafts - Advanced', '3', '10')

INSERT INTO activity VALUES ('ArtsNCrafts - Beginner', '5', '10')
INSERT INTO activity VALUES ('ArtsNCrafts - Intermediate', '5', '10')
INSERT INTO activity VALUES ('ArtsNCrafts - Advanced', '3', '10')
