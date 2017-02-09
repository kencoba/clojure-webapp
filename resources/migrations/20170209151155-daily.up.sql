
CREATE TABLE project
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 project_id char(24) NOT NULL UNIQUE);


CREATE TABLE course
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 course_id char(24) NOT NULL UNIQUE,
 name VARCHAR(255) NOT NULL,
 short_name VARCHAR(255) NOT NULL,
 price INTEGER NOT NULL);

CREATE TABLE schedule
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 schedule_id char(24) NOT NULL UNIQUE,
 course_id INTEGER NOT NULL,
 project_id INTEGER NOT NULL,
 price INTEGER NOT NULL);
ALTER TABLE schedule
    ADD CONSTRAINT fk_course_id
    FOREIGN KEY (course_id)
    REFERENCES course(id)
    ON DELETE CASCADE;
ALTER TABLE schedule
    ADD CONSTRAINT fk_project_id
    FOREIGN KEY (project_id)
    REFERENCES project(id)
    ON DELETE CASCADE;

CREATE TABLE room
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255),
 address VARCHAR(255),
 capacity INTEGER);

CREATE TABLE daily
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 schedule_id INTEGER NOT NULL,
 room_id INTEGER NOT NULL,
 open_time timestamp NOT NULL,
 start_time timestamp NOT NULL,
 end_time timestamp NOT NULL);
ALTER TABLE daily
    ADD CONSTRAINT fk_schedule_id
    FOREIGN KEY (schedule_id)
    REFERENCES schedule(id)
    ON DELETE CASCADE;
ALTER TABLE daily
    ADD CONSTRAINT fk_room_id
    FOREIGN KEY (room_id)
    REFERENCES room(id)
    ON DELETE CASCADE;

CREATE TABLE entry
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 entry_id char(24) NOT NULL UNIQUE,
 schedule_id INTEGER NOT NULL,
 timestamp TIMESTAMP NOT NULL);
ALTER TABLE entry
    ADD CONSTRAINT fk_schedule_id
    FOREIGN KEY (schedule_id)
    REFERENCES schecule(id)
    ON DELETE CASCADE;

CREATE TABLE student
(id INTEGER PRIMARY KEY AUTO_INCREMENT,
 student_id CHAR(36) NOT NULL UNIQUE,
 entry_id INTEGER NOT NULL,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 first_name_kana VARCHAR(255) NOT NULL,
 last_name_kana VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL);
ALTER TABLE student
    ADD CONSTRAINT fk_entry_id
    FOREIGN KEY (entry_id)
    REFERENCES entry(id)
    ON DELETE CASCADE;
