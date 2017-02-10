
CREATE TABLE project
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 project_cd CHAR(24) NOT NULL UNIQUE);
ALTER TABLE project
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE course
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 course_cd CHAR(24) NOT NULL UNIQUE,
 name VARCHAR(255) NOT NULL,
 short_name VARCHAR(255) NOT NULL,
 price INTEGER NOT NULL);
ALTER TABLE course
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE schedule
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 schedule_cd CHAR(24) NOT NULL UNIQUE,
 course_id INTEGER NOT NULL,
 project_id INTEGER NOT NULL,
 price INTEGER NOT NULL,
 capacity INTEGER NOT NULL);
ALTER TABLE schedule
    ADD CONSTRAINT schedule_fk_course_id
    FOREIGN KEY (course_id)
    REFERENCES course(id)
    ON DELETE CASCADE;
ALTER TABLE schedule
    ADD CONSTRAINT schedule_fk_project_id
    FOREIGN KEY (project_id)
    REFERENCES project(id)
    ON DELETE CASCADE;
ALTER TABLE schedule
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE room
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255) NOT NULL UNIQUE,
 address VARCHAR(255) NOT NULL,
 capacity INTEGER NOT NULL);
ALTER TABLE room
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE daily
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 schedule_id INTEGER NOT NULL,
 room_id INTEGER NOT NULL,
 open_time timestamp NOT NULL,
 start_time timestamp NOT NULL,
 end_time timestamp NOT NULL);
ALTER TABLE daily
    ADD CONSTRAINT daily_fk_schedule_id
    FOREIGN KEY (schedule_id)
    REFERENCES schedule(id)
    ON DELETE CASCADE;
ALTER TABLE daily
    ADD CONSTRAINT daily_fk_room_id
    FOREIGN KEY (room_id)
    REFERENCES room(id)
    ON DELETE CASCADE;
ALTER TABLE daily
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE entry
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 entry_cd CHAR(24) NOT NULL UNIQUE,
 schedule_id INTEGER NOT NULL,
 timestamp TIMESTAMP NOT NULL);
ALTER TABLE entry
    ADD CONSTRAINT entry_fk_schedule_id
    FOREIGN KEY (schedule_id)
    REFERENCES schedule(id)
    ON DELETE CASCADE;
ALTER TABLE entry
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE student
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 student_cd CHAR(36) NOT NULL UNIQUE,
 entry_id INTEGER NOT NULL,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 first_name_kana VARCHAR(255) NOT NULL,
 last_name_kana VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL);
ALTER TABLE student
    ADD CONSTRAINT student_fk_entry_id
    FOREIGN KEY (entry_id)
    REFERENCES entry(id)
    ON DELETE CASCADE;
ALTER TABLE student
    ALTER COLUMN id
    RESTART WITH 1000;

CREATE TABLE set_course
(set_id INTEGER NOT NULL,
 course_id INTEGER NOT NULL,
 PRIMARY KEY (set_id, course_id));
ALTER TABLE set_course
    ADD CONSTRAINT set_course_fk_set_id
    FOREIGN KEY (set_id)
    REFERENCES course(id)
    ON DELETE CASCADE;
ALTER TABLE set_course
    ADD CONSTRAINT set_course_fk_course_id
    FOREIGN KEY (course_id)
    REFERENCES course(id)
    ON DELETE CASCADE;

CREATE TABLE set_schedule
(set_id INTEGER NOT NULL,
 schedule_id INTEGER NOT NULL,
 PRIMARY KEY (set_id, schedule_id));
ALTER TABLE set_schedule
    ADD CONSTRAINT set_schedule_fk_set_id
    FOREIGN KEY (set_id)
    REFERENCES schedule(id)
    ON DELETE CASCADE;
ALTER TABLE set_schedule
    ADD CONSTRAINT set_schedule_fk_schedule_id
    FOREIGN KEY (schedule_id)
    REFERENCES schedule(id)
    ON DELETE CASCADE;
