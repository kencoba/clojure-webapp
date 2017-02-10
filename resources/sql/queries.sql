-- :name save-message! :! :n
-- :doc creates a new message using the name, messages, and timestamp keys
INSERT INTO guestbook
(name, message, timestamp)
VALUES (:name, :message, :timestamp)

-- :name get-messages :? :*
-- :doc selects all available messages
SELECT * FROM guestbook

-- :name create-project! :! :n
-- :doc creates a new project record
INSERT INTO project
(project_cd)
VALUES (:project_cd)

-- :name create-course! :! :n
-- :doc creates a new course record
INSERT INTO course
(course_cd, name, short_name, price)
VALUES (:course_cd, :name, :short_name, :price)

-- :name create-schedule! :! :n
-- :doc creates a new schedule record
INSERT INTO schedule
(schedule_cd, course_id, project_id, price, capacity)
VALUES (:schedule_cd, :course_id, :project_id, :price, :capacity)

-- :name create-room! :! :n
-- :doc creates a new room record
INSERT INTO room
(name, address, capacity)
VALUES (:name, :address, :capacity)

-- :name create-daily! :! :n
-- :doc creates a new daily record
INSERT INTO daily
(schedule_id, room_id, open_time, start_time, end_time)
VALUES (:schedule_id, :room_id, :open_time, :start_time, :end_time)

-- :name create-entry! :! :n
-- :doc creates a new entry record
INSERT INTO entry
(entry_cd, schedule_id, timestamp)
VALUES (:entry_cd, :schedule_id, :timestamp)

-- :name create-student! :! :n
-- :doc creates a new student record
INSERT INTO student
(student_cd, entry_id, first_name, last_name, first_name_kana, last_name_kana, email)
VALUES (:student_cd, :entry_id, :first_name, :last_name, :first_name_kana, :last_name_kana, :email)

-- :name create-set-course! :! :n
-- :doc creates a new set_course record
INSERT INTO set_course
(set_id, course_id)
VALUES (:set_id, :course_id)

-- :name create-set-schedule! :! :n
-- :doc creates a new set_schedule record
INSERT INTO set_schedule
(set_id, schedule_id)
VALUES (:set_id, :schedule_id)

-- :name get-students :? :*
-- :doc selects students infomation. if schedule is a set-schedule, then select all students on sub schedules.
SELECT schedule.id, schedule.schedule_cd, schedule.capacity, student.student_cd
FROM schedule
INNER JOIN entry
    ON schedule.id = entry.schedule_id
INNER JOIN student
    ON entry.id = student.entry_id
WHERE
   schedule.schedule_cd = :schedule_cd
UNION
SELECT sub_sch.id, sub_sch.schedule_cd, sub_sch.capacity, student.student_cd
FROM set_schedule
INNER JOIN schedule AS set_sch
    ON set_schedule.set_id = set_sch.id
INNER JOIN schedule AS sub_sch
    ON set_schedule.schedule_id = sub_sch.id
INNER JOIN entry
    ON set_schedule.schedule_id = entry.schedule_id
INNER JOIN student
    ON entry.id = student.entry_id
WHERE
    set_sch.schedule_cd = :schedule_cd
