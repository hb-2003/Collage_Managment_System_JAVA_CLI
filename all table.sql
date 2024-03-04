 //departments
CREATE TABLE departments (
    id INT(5) AUTO_INCREMENT,
    department_name VARCHAR(100),
    PRIMARY KEY (id)
);

-- Create the admin table
CREATE TABLE admin (
    id INT(5) AUTO_INCREMENT,
    name VARCHAR(100),
    username VARCHAR(30),
    password VARCHAR(25),
    department_id int(5),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

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

//instructor
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
    instructor_tupe ENUM('professor','HOD','lecturer','lab assistant','librarian','accountant','clerk','peon','other'),
    status ENUM('active', 'deactive', 'resigned', 'retired', 'suspended', 'expelled', 'transfered'),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

//courses
CREATE TABLE courses (
    id INT(5) AUTO_INCREMENT,
    course_name VARCHAR(100),
    department_id INT(5),
    instructor_id int(5),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(id)
);
 


// student courses
CREATE TABLE student_courses (
    student_id INT(5),
    course_id INT(5),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

//instructor courses
CREATE TABLE instructor_courses (
    instructor_id INT(5),
    course_id INT(5),
    PRIMARY KEY (instructor_id, course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
//attendance
CREATE TABLE student_attendance (
    student_id INT(5),
    course_id INT(5),
    date DATE,
    status ENUM('present', 'absent'),
    PRIMARY KEY (student_id, course_id, date),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
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





