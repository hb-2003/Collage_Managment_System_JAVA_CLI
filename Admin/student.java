package Admin;

import java.util.Scanner;
import java.sql.*;
import config.connect;

public class student {
    static Connection conn = connect.getConnection();
    int id;

    student(int id) {
        this.id = id;
        while (true) {

            System.out.println("dqwdwq" + this.id);
            System.err.println(
                    "Enter Your Choice \n 1. Add Student \n 2. Update Student \n 3. Delete Student \n 4. View Student \n 5. Back \n Enter Your Choice:");
            Scanner sc = new Scanner(System.in);
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    addStudent();
                    break;
                case 2:
                   
                    break;
                case 3:
                    // deleteStudent();
                    break;
                case 4:
                    // viewStudent();
                    break;
                case 5:
                    break;
                default:
                    break;
            }

        }

    }

    public void addStudent() {

        try {
            Statement stmt = conn.createStatement();
            String first_name, middle_name, last_name, date_of_birth, gender, email, phone_number,
                    addresses, addmission_type, admission_date, status;
            Integer course, batch_year;
            try (Scanner sc = new Scanner(System.in)) {

                System.out.println("Enter First Name: ");

                first_name = sc.nextLine();
                System.out.println("Enter Middle Name: ");
                middle_name = sc.nextLine();
                System.out.println("Enter Last Name: ");
                last_name = sc.nextLine();
                System.out.println("Enter Date of Birth: ");
                date_of_birth = sc.next();
                System.out.println("1. Male\n2. Female\n3. Other");
                while (true) {
                    if (sc.nextInt() == 1) {
                        gender = "Male";
                        break;
                    } else if (sc.nextInt() == 2) {
                        gender = "Female";
                        break;
                    } else
                        gender = "Other";
                    break;
                }

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
                System.out.println("Enter Phone Number: ");
                phone_number = sc.next();
                System.out.println("Enter Address: ");
                // full address user input
                addresses = sc.next();
                System.out.println("Select Course: ");

                ResultSet rs = stmt.executeQuery("select * from admin where id = " + id);
                rs.next();
                course = rs.getInt("department_id");
                System.out.println("Enter Batch Year: ");
                batch_year = sc.nextInt();

                while (true) {
                    System.out.println("1. SFI\n2. GIA");
                    int choice = sc.nextInt();
                    if (choice == 1) {
                        addmission_type = "SFI";
                        break;
                    } else if (choice == 2) {
                        addmission_type = "GIA";
                        break;
                    } else {
                        System.out.println("Invalid Input");
                    }

                }

                System.out.println("Enter Admission Date: ");
                admission_date = sc.next();
                System.out.println(
                        "1. Active\n2. Deactive\n3. Passout\n4. Dropout\n5.Suspended\n6. Expelled\n7.Transfered\n8. Detained");
                while (true) {
                    if (sc.nextInt() == 1) {
                        status = "active";
                        break;
                    } else if (sc.nextInt() == 2) {
                        status = "deactive";
                        break;
                    } else if (sc.nextInt() == 3) {
                        status = "passout";
                        break;
                    } else if (sc.nextInt() == 4) {
                        status = "dropout";
                        break;
                    } else {
                        System.out.println("Invalid Input");
                    }
                }

                System.out.println(first_name + "\n" + middle_name + "\n" + last_name + "\n"
                        + date_of_birth + "\n" + email + " \n" + phone_number + "\n" + addresses + "\n" + course + "\n"
                        + batch_year + "\n" + addmission_type + "\n"
                        + admission_date + "\n" + status
                        + "\n");
                String sql = "insert into student (first_name, middle_name, last_name,date_of_birth,gender, email, phone_number, addresses,department_id, batch_year, admission_type, admission_date, status)values ('"
                        + first_name + "', '" + middle_name + "', '" + last_name + "','"
                        + date_of_birth + "','" + gender + "', '" + email + "', '" + phone_number + "', '" + addresses
                        + "'," + course + ", " + batch_year + ",'" + addmission_type + "', '" + admission_date + "', '"
                        + status + "')";

                System.out.println(sql);
                if (stmt.executeUpdate(sql) > 0) {
                    System.out.println("Student Added Successfully");
                } else {
                    System.out.println("Error Occured");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return;
    }

    // public void updateStudent(int student_id) {
    //     try {
    //         Statement stmt = conn.createStatement();
    //         String first_name, middle_name, last_name, date_of_birth, gender, email, phone_number,
    //                 addresses, addmission_type, admission_date, status;
    //         Integer course, batch_year;
    //         Scanner sc = new Scanner(System.in);
    //     //     
    //         ResultSet rs = stmt.executeQuery("select * from student where id = " + student_id);
    //         rs.next();
    //         System.out.println(rs.getInt(student_id));
    //         System.out.println(rs.getString("first_name"));

    //         // System.out.println("if you don't want to update a field just press enter");
    //         // System.out.println("Enter First Name: ");
    //         // first_name = sc.nextLine();
    //         // if (first_name.equals("")) {
    //         // first_name = rs.getString("first_name");
    //         // }
    //         // System.out.println("Enter Middle Name: ");
    //         // middle_name = sc.nextLine();
    //         // if (middle_name.equals("")) {
    //         // middle_name = rs.getString("middle_name");
    //         // }
    //         // System.out.println("Enter Last Name: ");
    //         // last_name = sc.nextLine();
    //         // if (last_name.equals("")) {
    //         // last_name = rs.getString("last_name");
    //         // }
    //         // System.out.println("Enter Date of Birth: ");
    //         // date_of_birth = sc.nextLine();
    //         // if (date_of_birth.equals("")) {
    //         // date_of_birth = rs.getString("date_of_birth");
    //         // }
    //         // System.err.println("1. Male\n2. Female\n3. Other");
    //         // int choice = sc.nextInt();
    //         // if (choice == 1) {
    //         // gender = "Male";
    //         // } else if (choice == 2)
    //         // gender = "Female";
    //         // else {
    //         // gender = "Other";
    //         // }
    //         // System.out.println("Enter Email: ");
    //         // email = sc.nextLine();
    //         // if (email.equals("")) {
    //         // email = rs.getString("email");
    //         // }
    //         // System.out.println("Enter Phone Number: ");
    //         // phone_number = sc.nextLine();
    //         // if (phone_number.equals("")) {
    //         // phone_number = rs.getString("phone_number");
    //         // }
    //         // System.out.println("Enter Address: ");
    //         // addresses = sc.nextLine();

    //         // if (addresses.equals("")) {
    //         // addresses = rs.getString("addresses");
    //         // }
    //         // course = rs.getInt("department_id");
    //         // batch_year = rs.getInt("batch_year");
    //         // addmission_type = rs.getString("admission_type");
    //         // admission_date = rs.getString("admission_date");
    //         // System.err.println(
    //         // "1. Active\n2. Deactive\n3. Passout\n4. Dropout\n5.Suspended\n6.
    //         // Expelled\n7.Transfered\n8. Detained");
    //         // status = rs.getString("status");
    //         // choice = sc.nextInt();
    //         // if (choice == 1) {
    //         // status = "active";
    //         // } else if (choice == 2) {
    //         // status = "deactive";
    //         // } else if (choice == 3) {
    //         // status = "passout";
    //         // } else if (choice == 4) {
    //         // status = "dropout";
    //         // } else {
    //         // System.out.println("Invalid Input");
    //         // }

    //         // String sql = "update student set first_name = '" + first_name + "',
    //         // middle_name = '" + middle_name
    //         // + "', last_name = '" + last_name + "', date_of_birth = '" + date_of_birth +
    //         // "',gender = '" + gender
    //         // + "', email = '" + email + "', phone_number = '" + phone_number + "',
    //         // addresses = '" + addresses
    //         // + "', department_id = " + course + ", batch_year = " + batch_year + ",
    //         // admission_type = '"
    //         // + addmission_type + "', admission_date = '" + admission_date + "', status =
    //         // '" + status
    //         // + "' where id = " + student_id;
    //         // if (stmt.executeUpdate(sql) > 0) {
    //         // System.out.println("Student Updated Successfully");
    //         // } else {
    //         // System.out.println("Error Occured");
    //         // }
    //     } catch (Exception e) {
    //         System.out.println(e);
    //     }
    //     return;
    // }

}
