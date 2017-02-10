INSERT INTO project
(project_cd)
VALUES
('PR01');

INSERT INTO course
(course_cd, name, short_name, price)
VALUES
('C01', 'Introduction of Clojure', 'IC', 30000),
('C02', 'Practical Clojure', 'PC', 40000),
('C03', 'Magic of Clojure', 'MC', 40000),
('C04', 'Clojure set course', 'CC', 100000);

INSERT INTO set_course
(set_id,course_id)
VALUES
(1003, 1000),
(1003, 1001),
(1003, 1002);

INSERT INTO schedule
(schedule_cd, course_id, project_id, price, capacity)
VALUES
('SC00', 1000,1000, 30000, 20),
('SC01', 1001,1000, 40000, 20),
('SC02', 1002,1000, 40000, 20),
('SC03', 1003,1000, 100000, 20);

INSERT INTO set_schedule
(set_id, schedule_id)
VALUES
(1003, 1000),
(1003, 1001),
(1003, 1002);

INSERT INTO room
(name, address, capacity)
VALUES
('Tr-A', 'Japan', 20),
('Tr-B', 'India', 30);

INSERT INTO daily
(schedule_id, room_id, open_time, start_time, end_time)
VALUES
(1000, 1000, {ts '2017-4-1 9:30:0.0'}, {ts '2017-4-1 10:00:0.0'}, {ts '2017-4-1 17:00:0.0'}),
(1001, 1000, {ts '2017-4-2 9:30:0.0'}, {ts '2017-4-2 10:00:0.0'}, {ts '2017-4-2 17:00:0.0'}),
(1002, 1000, {ts '2017-4-3 9:30:0.0'}, {ts '2017-4-3 10:00:0.0'}, {ts '2017-4-3 17:00:0.0'});

INSERT INTO entry
(entry_cd, schedule_id, timestamp)
VALUES
('EN01', 1000, now()),
('EN02', 1001, now()),
('EN03', 1002, now()),
('EN04', 1003, now());

INSERT INTO student
(student_cd, entry_id, first_name, last_name, first_name_kana, last_name_kana, email)
VALUES
('ST01', 1000, 'A1', 'a', 'B', 'b', 'sample@email.com'),
('ST02', 1001, 'A2', 'a', 'B', 'b', 'sample@email.com'),
('ST03', 1002, 'A3', 'a', 'B', 'b', 'sample@email.com'),
('ST04', 1003, 'A4', 'a', 'B', 'b', 'sample@email.com'),
('ST05', 1003, 'C5', 'c', 'D', 'd', 'sample2@email.com');
