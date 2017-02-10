INSERT INTO project
(project_cd)
VALUES
('PR01'),
('PR02');

INSERT INTO course
(course_cd, name, short_name, price)
VALUES
('C01', 'UML', 'UML', 30000),
('C02', 'Java', 'Java', 40000);

INSERT INTO schedule
(schedule_cd, course_id, project_id, price, capacity)
VALUES
('SC01', 1000,1000, 30000, 20),
('SC02', 1000,1001, 30000, 20);

INSERT INTO room
(name, address, capacity)
VALUES
('Tr-A', 'Japan', 20),
('Tr-B', 'India', 30);

INSERT INTO daily
(schedule_id, room_id, open_time, start_time, end_time)
VALUES
(1000, 1000, {ts '2017-4-1 9:30:0.0'}, {ts '2017-4-1 10:00:0.0'}, {ts '2017-4-1 17:00:0.0'});

INSERT INTO entry
(entry_cd, schedule_id, timestamp)
VALUES
('EN01', 1000, now());

INSERT INTO student
(student_cd, entry_id, first_name, last_name, first_name_kana, last_name_kana, email)
VALUES
('ST01', 1000, 'A', 'a', 'B', 'b', 'sample@email.com'),
('ST02', 1000, 'C', 'c', 'D', 'd', 'sample2@email.com');
