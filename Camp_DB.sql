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
	CREATE TABLE huts (
		cabin		VARCHAR(6),
		year_built	INTEGER,		
		max_occ		INTEGER,
		min_occ		INTEGER,
		village		VARCHAR(6),
		age_group	VARCHAR(6),
		CONSTRAINT huts_pkey PRIMARY KEY (cabin, year_built)
	);
	
	CREATE TABLE cabin (
		cabin		VARCHAR(6),
		session		INTEGER,
		occupants	VARCHAR(7),
		CONSTRAINT cabin_pkey PRIMARY KEY (cabin, session, occupants),
		CONSTRAINT cabinFK FOREIGN KEY (sesh) REFERENCES session (sesh),
		CONSTRAINT cabinFK2 FOREIGN KEY (occupants) REFERENCES bodies (id),
		CONSTRAINT cabinFK3 FOREIGN KEY (cabin) REFERENCES huts(cabin)
	);
-------------------------------------------------------------------------------------------	
	CREATE TABLE bodies (
		sesh		VARCHAR(7),
		id		VARCHAR(7),
		name		VARCHAR(25),
		DOB		DATE,
		n_summers	INTEGER,
		CONSTRAINT bodies_pkey PRIMARY KEY (sesh, id),
		CONSTRAINT bodiesFK FOREIGN KEY (sesh) REFERENCES session (sesh)
	);

	CREATE TABLE counselor (
		id		VARCHAR(7),
		name		VARCHAR(25),
		CONSTRAINT counselor_pkey PRIMARY KEY (id),
		CONSTRAINT counselorFK FOREIGN KEY (id, name) REFERENCES bodies (id, name)
	);
	
	CREATE TABLE camper (
		id		VARCHAR(7),
		name		VARCHAR(25),
		age		INTEGER,
		CONSTRAINT camper_pkey PRIMARY KEY (id),
		CONSTRAINT camperFK FOREIGN KEY (id) REFERENCES bodies (id),
		CONSTRAINT camperFK2 FOREIGN KEY (name) REFERENCES bodies (name)
	);
	
	CREATE TABLE session (
		sesh		VARCHAR(7),
		year		INTEGER,
		chunk		VARCHAR(7),
		begin		DATE,
		end		DATE,
		CONSTRAINT session_pkey PRIMARY KEY (sesh)
	);
------------------------------------------------------------------------------------------	
	CREATE TABLE takes (
		act_num		NUMERIC(2,0),
		id		VARCHAR(7),
		period		INTEGER,
		week		INTEGER,
		year		INTEGER,
		session		INTEGER,
		location	VARCHAR(15),
		inst_id		VARCHAR(7),
		CONSTRAINT takes_pkey PRIMARY KEY (act_num, period, year, session, inst_id, id, location),
		CONSTRAINT takesFK FOREIGN KEY (id) REFERENCES campers (id),
		CONSTRAINT takesFK2 FOREIGN KEY (sesh) REFERENCES session (sesh),
		CONSTRAINT takesFK3 FOREIGN KEY (inst_id) REFERENCES counselor (id)
	);
	
	CREATE TABLE activity (
		act_num		NUMERIC(2,0),
		name		VARCHAR(15),
		minimum		NUMERIC(2,0),
		maximum		NUMERIC(2,0),
		CONSTRAINT activity_pkey PRIMARY KEY (act_num)
	);
	
	CREATE TABLE prereq (
		act_num		NUMERIC(2,0),
		prereq_num	NUMERIC(2,0),
		CONSTRAINT prereq_pkey PRIMARY KEY (act_num, prereq_num),
		CONSTRAINT prereqFK FOREIGN KEY (act_num) REFERENCES activity (act_num),
		CONSTRAINT prereqFK2 FOREIGN KEY (prereq_num) REFERENCES activity (act_num)
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
