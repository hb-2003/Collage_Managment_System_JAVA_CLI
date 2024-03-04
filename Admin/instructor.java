package Admin;

import java.util.Scanner;
import java.sql.*;
import config.connect;

public class instructor {
    static Connection conn = connect.getConnection();

    instructor(int id) {
        while (true) {
            System.out.println("Enter a choice \n1. add instructor\n2. view instructor\n3. update instructor\n4. delete instructor\n5. exit");

            Scanner sc = new Scanner(System.in);
            int choice = sc.nextInt();
            
        }
    }

    public void addInstructor() {

        try {
            Statement stmt = conn.createStatement();

            String first_name, middle_name, last_name, email, phone_number, address, joining_date,
                    instructor_type, status, qualification, college_name;
            Integer age, department_id;
            try (Scanner sc = new Scanner(System.in)) {
                System.out.println("Enter First Name: ");
                first_name = sc.nextLine();
                System.out.println("Enter Middle Name: ");
                middle_name = sc.nextLine();
                System.out.println("Enter Last Name: ");
                last_name = sc.nextLine();
                System.out.println("Select Department: ");
                ResultSet rs = stmt.executeQuery("select * from departments");
                while (rs.next()) {
                    System.out.println(rs.getInt("id") + ". " + rs.getString("department_name"));
                }
                department_id = sc.nextInt();
                System.out.println("Enter Email: ");
                while (true) {
                    email = sc.next();
                    if (email.contains("@") && email.contains(".")) {
                        break;
                    } else {
                        System.out.println("Invalid Email");
                    }
                    System.out.println("Enter Email: ");

                }
                System.out.println("Enter age: ");
                age = sc.nextInt();
                System.out.println("Enter Qualification: ");
                qualification = sc.next();
                System.out.println("Enter College Name: ");
                college_name = sc.next();
                System.out.println("Enter Phone Number: ");
                phone_number = sc.next();
                System.out.println("Enter Address: ");
                address = sc.next();
                System.out.println("Enter Joining Date: ");
                joining_date = sc.next();
                System.out.println(
                        "1. Professor\n2. HOD\n3. Lecturer\n4. Lab Assistant\n5. Librarian\n6. Accountant\n7. Clerk\n8. Peon\n9. Other");
                while (true) {
                    if (sc.nextInt() == 1) {
                        instructor_type = "Professor";
                        break;
                    } else if (sc.nextInt() == 2) {
                        instructor_type = "HOD";
                        break;
                    } else if (sc.nextInt() == 3) {
                        instructor_type = "Lecturer";
                        break;
                    } else if (sc.nextInt() == 4) {
                        instructor_type = "Lab Assistant";
                        break;
                    } else if (sc.nextInt() == 5) {
                        instructor_type = "Librarian";
                        break;
                    } else if (sc.nextInt() == 6) {
                        instructor_type = "Accountant";
                        break;
                    } else if (sc.nextInt() == 7) {
                        instructor_type = "Clerk";
                        break;
                    } else if (sc.nextInt() == 8) {
                        instructor_type = "Peon";
                        break;
                    } else {
                        instructor_type = "Other";
                        break;
                    }
                }
                System.out.println(
                        "1. Active\n2. Deactive\n3. Resigned\n4. Retired\n5. Suspended\n6. Expelled\n7. Transfered");
                while (true) {
                    if (sc.nextInt() == 1) {
                        status = "active";
                        break;
                    } else if (sc.nextInt() == 2) {
                        status = "deactive";
                        break;
                    } else if (sc.nextInt() == 3) {
                        status = "resigned";
                        break;
                    } else if (sc.nextInt() == 4) {
                        status = "retired";
                        break;
                    } else if (sc.nextInt() == 5) {
                        status = "suspended";
                        break;
                    } else if (sc.nextInt() == 6) {
                        status = "expelled";
                        break;
                    } else {
                        status = "transfered";
                        break;
                    }
                }
                System.out.println(first_name + "\n" + middle_name + "\n" + last_name + "\n" + email + " \n"
                        + phone_number + "\n" + address + "\n" + department_id + "\n" + age + "\n" + qualification
                        + "\n" + college_name + "\n" + joining_date + "\n" + instructor_type + "\n" + status + "\n");
                String sql = "insert into instructor (first_name, middle_name, last_name, email, phone_number, address, department_id, age, qualification, college_name, joining_date, instructor_type, status)values ('"
                        + first_name + "', '" + middle_name + "', '" + last_name + "','" + email + "', '" + phone_number
                        + "', '" + address + "'," + department_id + ", " + age + ",'" + qualification + "', '"
                        + college_name + "', '" + joining_date + "', '" + instructor_type + "', '" + status + "')";
                System.out.println(sql);
                if (stmt.executeUpdate(sql) > 0) {
                    System.out.println("Instructor Added Successfully");
                } else {
                    System.out.println("Error Occured");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return;
    }
}
