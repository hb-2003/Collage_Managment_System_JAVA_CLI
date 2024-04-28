 //departments
CREATE TABLE departments (
    id INT(5) AUTO_INCREMENT,
    department_name VARCHAR(100),
    PRIMARY KEY (id)
);
create table instructor(
    id int(5) AUTO_INCREMENT,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id int(5),
    email VARCHAR(100),
    age int(3),
    qualification VARCHAR(100),
    college_name VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    joining_date DATE,
    
    instructor_type ENUM('professor','HOD','lecturer','lab assistant','librarian','accountant','clerk','peon','other'),
    status ENUM('active', 'deactive', 'resigned', 'retired', 'suspended', 'expelled', 'transfered'),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- //instructor table password and username add column
ALTER TABLE instructor ADD COLUMN username VARCHAR(100);
ALTER TABLE instructor ADD COLUMN password VARCHAR(255);
//default value set in password 

-+----------+
-- |  1 | John       | Doe          | Smith     |             1 | john.doe@example.com |   35 | Ph.D. in Computer Science | ABC College        | 9258514856   | 123 Main St, City, Country     | 2023-01-15   | professor       | active | NULL     | NULL     |
-- |  2 | meet       | parakashbhai | bhalala   |             1 | meet@example.com     |   40 | Ph.D. in Computer Science | University of XYZ  | +9876543210  | 456 Park Avenue, City, Country | 2020-03-15   | professor       | active | NULL     | NULL     |
-- |  6 | darshan    | kumar        | patel     |             3 |  darsh@mgmail.com    |   22 | MCA                       | Gujarat University | 9876543210   | 123 main street,city,country   | 2020-03-15   | professor       | active | NULL     | NULL     |
-- |  7 | krishna    | ashokbbhai   | dobariya  |             1 | krishna@gmail.com    |   25 | MBA                       | ddu                | 1254788956   | 123 main street,city,country   | 2020-03-15   | professor       | active | NULL     | NULL     |
-- |  8 | harsh      | kumar        | patel     |             3 | harsh@gmail.com      |   22 | MBA                       | Gujarat University | 9876543210   | 123 main street,city,country   | 2020-03-15   | professor       | active | NULL     | NULL     |
update instructor set username='john',password='john' where id=1;
update instructor set username='meet',password='meet' where id=2;
update instructor set username='darshan',password='darshan' where id=6;
update instructor set username='krishna',password='krishna' where id=7;
update instructor set username='harsh',password='harsh' where id=8;
+----+------------+--------------+-----------+---------------+----------------------+------+---------------------------+--------------------+--------------+--------------------------------+--------------+-----------------+--------+----------+----------+
| id | first_name | middle_name  | last_name | department_id | email                | age  | qualification             | college_name       | phone_number | address                        | joining_date | instructor_type | status | username | password |
+----+------------+--------------+-----------+---------------+----------------------+------+---------------------------+--------------------+--------------+--------------------------------+--------------+-----------------+--------+----------+----------+
|  1 | John       | Doe          | Smith     |             1 | john.doe@example.com |   35 | Ph.D. in Computer Science | ABC College        | 9258514856   | 123 Main St, City, Country     | 2023-01-15   | professor       | active | john     | john     |
|  2 | meet       | parakashbhai | bhalala   |             1 | meet@example.com     |   40 | Ph.D. in Computer Science | University of XYZ  | +9876543210  | 456 Park Avenue, City, Country | 2020-03-15   | professor       | active | meet     | meet     |
|  6 | darshan    | kumar        | patel     |             3 |  darsh@mgmail.com    |   22 | MCA                       | Gujarat University | 9876543210   | 123 main street,city,country   | 2020-03-15   | professor       | active | darshan  | darshan  |
|  7 | krishna    | ashokbbhai   | dobariya  |             1 | krishna@gmail.com    |   25 | MBA                       | ddu                | 1254788956   | 123 main street,city,country   | 2020-03-15   | professor       | active | krishna  | krishna  |
|  8 | harsh      | kumar        | patel     |             3 | harsh@gmail.com      |   22 | MBA                       | Gujarat University | 9876543210   | 123 main street,city,country   | 2020-03-15   | professor       | active | harsh    | harsh    |
+----+------------+--------------+-----------+---------------+----------------------+------+---------------------------+--------------------+--------------+--------------------------------+--------------+-----------------+--------+----------+----------+

------+-----+---------+----------------+
| Field           | Type                                                                                               | Null | Key | Default | Extra          |
+-----------------+----------------------------------------------------------------------------------------------------+------+-----+---------+----------------+
| id              | int                                                                                                | NO   | PRI | NULL    | auto_increment |
| first_name      | varchar(50)                                                                                        | YES  |     | NULL    |                |
| middle_name     | varchar(50)                                                                                        | YES  |     | NULL    |                |
| last_name       | varchar(50)                                                                                        | YES  |     | NULL    |                |
| department_id   | int                                                                                                | YES  | MUL | NULL    |                |
| email           | varchar(100)                                                                                       | YES  |     | NULL    |                |
| age             | int                                                                                                | YES  |     | NULL    |                |
| qualification   | varchar(100)                                                                                       | YES  |     | NULL    |                |
| college_name    | varchar(100)                                                                                       | YES  |     | NULL    |                |
| phone_number    | varchar(15)                                                                                        | YES  |     | NULL    |                |
| address         | varchar(255)                                                                                       | YES  |     | NULL    |                |
| joining_date    | date                                                                                               | YES  |     | NULL    |                |
| instructor_type | enum('professor','HOD','lecturer','lab assistant','librarian','accountant','clerk','peon','other') | YES  |     | NULL    |                |
| status          | enum('active','deactive','resigned','retired','suspended','expelled','transfered')                 | YES  |     | NULL    |                |
| username        | varchar(100)                                                                                       | YES  |     | NULL    |                |
| password        | varchar(255)                                                                                       | YES  |     | NULL    |                |
+-----------------+----------------------------------------------------------------------------------------------------+------+-----+---------+----------------+
16 rows in set (0.20 sec)
]
insert into instructor values('meet','meet','meet',1,'email@gmail.com',33,'fwefwef','wdggberfg','2345678987','defxefx','2024-05-25','professor','active','meet','meet');
INSERT INTO instructor (first_name, middle_name, last_name, department_id, email, age, qualification, college_name, phone_number, address, joining_date, instructor_type, status, username, password) 
VALUES ('Meet', NULL, 'Bhalala', 1, 'meet@example.com', 25, 'B.Tech', 'ABC College', '1234567890', '123 Street, City', '2024-04-30', 'lecturer', 'active', 'meet123', 'password123');

CREATE TABLE admin (
    id INT(5) AUTO_INCREMENT,
    instructor_id INT(5),
    username VARCHAR(100),
    password VARCHAR(255),
    department_id INT(5),
    PRIMARY KEY (id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(id),
    FOREIGN KEY (department_id) REFERENCES departments(id)

);
    -> ;
+----+---------------+-------+----------+---------------+
| id | instructor_id | username | password | department_id |
+----+---------------+-------+----------+---------------+
|  2 |             1 |    mca   | mca      |             1 |
|  4 |             8 |   mba    | mba      |             3 |
+----+---------------+-------+----------+---------------+


INSERT INTO admin (instructor_id, username, password, department_id) VALUES (1, 'mca', 'mca', 1);
INSERT INTO admin (instructor_id, username, password, department_id) VALUES (8, 'mba', 'mba', 3);
-- Inserting a department into the "departments" table
INSERT INTO departments (department_name) VALUES ('MCA');

-- Inserting a record into the "admin" table with a department ID corresponding to an existing department
INSERT INTO admin (name, username, password, department_id) 
VALUES ('Hardik', 'MCA', 'MCA', 1);


CREATE TABLE student (
    id INT(5) AUTO_INCREMENT,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    addresses VARCHAR(255),
    department_id INT(5),
    batch_year INT(4),
    admission_type ENUM('SFI', 'GIA'),
    admission_date DATE,
    status ENUM('active', 'deactive', 'passout', 'dropout', 'suspended', 'expelled', 'transfered','detained'),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
); 
ALTER TABLE student ADD COLUMN username VARCHAR(100);
ALTER TABLE student ADD COLUMN password VARCHAR(255);

| id | first_name | middle_name  | last_name | department_id | email                | age  | qualification             | college_name       | phone_number | address                        | joining_date | instructor_type | status | username | password |
+----+------------+--------------+-----------+---------------+----------------------+------+---------------------------+--------------------+--------------+--------------------------------+--------------+-----------------+--------+----------+----------+
|  1 | John       | Doe          | Smith     |             1 | john.doe@example.com |   35 | Ph.D. in Computer Science | ABC College        | 9258514856   | 123 Main St, City, Country     | 2023-01-15   | professor       | active | john     | john     |
|  2 | meet       | parakashbhai | bhalala   |             1 | meet@example.com     |   40 | Ph.D. in Computer Science | University of XYZ  | +9876543210  | 456 Park Avenue, City, Country | 2020-03-15   | professor       | active | meet     | meet     |
|  6 | darshan    | kumar        | patel     |             3 |  darsh@mgmail.com    |   22 | MCA                       | Gujarat University | 9876543210   | 123 main street,city,country   | 2020-03-15   | professor       | active | darshan  | darshan  |
|  7 | krishna    | ashokbbhai   | dobariya  |             1 | krishna@gmail.com    |   25 | MBA                       | ddu                | 1254788956   | 123 main street,city,country   | 2020-03-15   | professor       | active | krishna  | krishna  |
|  8 | harsh      | kumar        | patel     |             3 | harsh@gmail.com      |   22 | MBA                       | Gujarat University | 9876543210   | 123 main street,city,country   | 2020-03-15   | professor       | active | harsh    | harsh    |
|  9 | meet       | meet         | meet      |             1 | cefe@gmail.com       |   33 | fwefwef                   | wdggberfg          | 2345678987   | defxefx                        | 2024-05-25   | professor       | active | NULL     | NULL     |
+----+------------+--------------+-----------+---------------+----------------------+------+---------------------------+--------------------+--------------+--------------------------------+--------------+-----------------+--------+----------+----------+

insert into student values(9,'meet','meet','meet','2024-05-25','Male','meey@gmail.com','2345678987','defxefx',1,2024,'SFI','2024-05-25','active','meet','meet');

update student set username='hardik',password='hardik' where id=1;
update student set username='meet', password='meet' where id=2;
update student set username='hardik', password='hardik' where id=3;

//instructor

INSERT INTO instructor (first_name, middle_name, last_name, department_id, email, age, qualification, college_name, phone_number, address, joining_date, instructor_type, status) 
VALUES ('John', 'Doe', 'Smith', 1, 'john.doe@example.com', 35, 'Ph.D. in Computer Science', 'ABC College', '9258514856', '123 Main St, City, Country', '2023-01-15', 'professor', 'active','meet','meet');



-- semester subjects
CREATE TABLE semester_subjects (
    id INT(5) AUTO_INCREMENT,
    semester_id INT(5),
    department_id INT(5),
    subject_name VARCHAR(100),
    subject_code VARCHAR(10),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

//attendance
CREATE TABLE attendance (
    id INT(5) AUTO_INCREMENT,
    student_id INT(5),
    department_id INT(5),
    semester_id INT(5),
    subject_id INT(5),
    date DATE,
    status ENUM('1', '0'),
    PRIMARY KEY (id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id),
    FOREIGN KEY (subject_id) REFERENCES semester_subjects(id)
);

-- semesters
CREATE TABLE semesters (
    id INT(5) AUTO_INCREMENT,
    course_id INT(5),
    total_semesters INT(2),
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);    

-- semester_courses
CREATE TABLE courece_subjects (
    id INT(5) AUTO_INCREMENT,
    semester_id INT(5),
    course_id INT(5),
    subject_name VARCHAR(100),
    group_subject ENUM('core', 'elective'),
    elective_group int(5),
    PRIMARY KEY (id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);


-- semester_students
CREATE TABLE semester_students (
    semester_id INT(5),
    student_id INT(5),
    PRIMARY KEY (semester_id, student_id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

//courece subjects semester wise
CREATE TABLE semester_subjects (
    id INT(5) AUTO_INCREMENT,
    semester_id INT(5),
    course_id INT(5),
    subject_name VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
+----+-------------+---------------+---------------+--------------+
| id | semester_id | department_id | subject_name  | subject_code |
+----+-------------+---------------+---------------+--------------+
|  1 |           1 |             1 | webdesing     | 121          |
|  2 |           2 |             1 | datastructers | 202          |
|  3 |           3 |             1 | python        | 301          |
+----+-------------+---------------+---------------+--------------+
add semester 1 sunject  and sem 1 in coll 5 subject_codet this is alredy record in semester_subjects table
anter a new record in semester_subjects table

INSERT INTO semester_subjects (semester_id, department_id, subject_name, subject_code) VALUES ( 1,1, 'mysql', '104'),(1,1,"c",'101'),(1,1,'java','102'),(1,1,"swift","103");

result table

create table result(
    id int(5) AUTO_INCREMENT,
    student_id int(5),
    department_id int(5),
    
    
//student marks
CREATE TABLE student_marks (
    student_id INT(5),
    course_id INT(5),
    semester_id INT(5),
    subject_id INT(5),
    marks INT(3),
    PRIMARY KEY (student_id, course_id, semester_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id),
    FOREIGN KEY (subject_id) REFERENCES semester_subjects(id)
);

//student fees
CREATE TABLE student_fees (
    student_id INT(5),
    course_id INT(5),
    semester_id INT(5),
    fees INT(5),
    PRIMARY KEY (student_id, course_id, semester_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

//faculty semester wise subjects

CREATE TABLE faculty_subjects (
    instructor_id INT(5),
    course_id INT(5),
    semester_id INT(5),
    subject_id INT(5),
    PRIMARY KEY (instructor_id, course_id, semester_id, subject_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id),
    FOREIGN KEY (subject_id) REFERENCES semester_subjects(id)
);

//faculty attendance
CREATE TABLE faculty_attendance (
    instructor_id INT(5),
    course_id INT(5),
    date DATE,
    status ENUM('present', 'absent'),
    PRIMARY KEY (instructor_id, course_id, date),
    FOREIGN KEY (instructor_id) REFERENCES instructors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

//faculty salary

CREATE TABLE faculty_salary (
    instructor_id INT(5),
    salary INT(10),
    month INT(2),
    year INT(4),
    PRIMARY KEY (instructor_id, month, year),
    FOREIGN KEY (instructor_id) REFERENCES instructors(id)
);

//student result

CREATE TABLE student_result (
    student_id INT(5),
    course_id INT(5),
    semester_id INT(5),
    total_marks INT(3),
    PRIMARY KEY (student_id, course_id, semester_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

//anaouncement table    

CREATE TABLE announcements (
    id INT(5) AUTO_INCREMENT,
    title VARCHAR(100),
    description TEXT,
    date DATE,
    PRIMARY KEY (id)
);

//feedback table

CREATE TABLE feedbacks (
    id INT(5) AUTO_INCREMENT,
    student_id INT(5),
    course_id INT(5),
    semester_id INT(5),
    feedback TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

//complaints table

CREATE TABLE complaints (
    id INT(5) AUTO_INCREMENT,
    student_id INT(5),
    course_id INT(5),
    semester_id INT(5),
    complaint TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (semester_id) REFERENCES semesters(id)
);





