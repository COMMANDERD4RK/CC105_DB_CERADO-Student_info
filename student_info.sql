CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    birth_date DATE,
    email VARCHAR(100) UNIQUE,
    year_level INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    units INT NOT NULL
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(100)
);
CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    teacher_id INT NOT NULL,
    semester VARCHAR(20),
    schedule VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO students (first_name, last_name, gender, birth_date, email, year_level)
     VALUES
    ('Juan', 'Dela Cruz', 'Male', '2003-05-10', 'juan@email.com', 2),
    ('Maria', 'Santos', 'Female', '2002-08-21', 'maria@email.com', 3),
    ('Noah', 'Rivera', 'Male', '2002-06-18', 'noah.rivera@email.com', 3),
    ('Emma', 'Torres', 'Female', '2004-09-02', 'emma.torres@email.com', 1),
    ('Daniel', 'Mendoza', 'Male', '2003-01-30', 'daniel.mendoza@email.com', 2);

INSERT INTO courses (course_name, units)
     VALUES
     ('Database Systems', 3),
     ('Programming 1', 4),
     ('Data Structures', 3),
     ('Web Development', 3),
     ('Operating Systems', 3);

INSERT INTO teachers (first_name, last_name, email, department)
     VALUES
     ('Isabella', 'Lopez', 'isabella.lopez@email.com', 'Database System'),
     ('Ethan', 'Reyes', 'ethan.reyes@email.com', 'Programming'),
     ('Olivia', 'Santos', 'olivia.santos@email.com', 'Data Structures'),
     ('Ana', 'Reyes', 'ana.reyes@email.com', 'Web Development'),
     ('Mark', 'Lopez', 'mark.lopez@email.com', 'Operating System');

INSERT INTO classes (course_id, teacher_id, semester, schedule)
    -> VALUES
    -> (3, 2, '1st Sem 2025', 'TTh 3:00–4:30'),
    -> (4, 1, '1st Sem 2025', 'MWF 8:00–9:00'),
    -> (1, 1, '1st Sem 2025', 'MWF 9:00-10:00'),
    -> (2, 2, '1st Sem 2025', 'TTh 1:00-2:30'),
    -> (5, 3, '1st Sem 2025', 'TTh 10:00–11:30');

 DELETE FROM classes
    -> WHERE course_id = 2;

DELETE FROM classes
    -> WHERE course_id = 1;

INSERT INTO classes (course_id, teacher_id, semester, schedule)
    ->  VALUES
    -> (1, 4, '1st Sem 2025', 'MWF 9:00-10:00'),
    ->  (2, 5, '1st Sem 2025', 'TTh 1:00-2:30');

DELETE FROM enrollments
    -> WHERE course_id = 2;

DELETE FROM enrollments
    -> WHERE course_id = 1;

INSERT INTO enrollments (student_id, course_id, semester, grade)
    -> VALUES
    -> (1, 1, '1st Sem 2025', '1.75'),
    -> (2, 2, '1st Sem 2025', '1.50'),
    -> (4, 5, '1st Sem 2025', '1.75'),
    -> (5, 4, '1st Sem 2025', '1.50');

SELECT
    ->     CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ->     s.year_level,
    ->     c.course_name,
    ->     e.grade,
    ->     t.first_name AS teacher_first_name,
    ->     t.last_name AS teacher_last_name,
    ->     t.department,
    ->     cl.semester,
    ->     cl.schedule
    -> FROM students s
    -> JOIN enrollments e ON s.student_id = e.student_id
    -> JOIN courses c ON e.course_id = c.course_id
    -> JOIN classes cl ON c.course_id = cl.course_id
    -> JOIN teachers t ON cl.teacher_id = t.teacher_id


