package Admin;

import java.sql.*;
import config.connect;
import java.util.Scanner;

public class admin {
	static Connection conn = connect.getConnection();
	String name, deparment;
	Integer id;

	public static boolean login(String username, String password) {

		try {

			PreparedStatement pstmt = conn.prepareStatement(
					"select * from admin where username = '" + username + "' and password = '" + password + "'");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("Login Successfull");
				System.out.println("Welcome " + rs.getString("name"));
				System.out.println("Department: " + rs.getString("department_id"));

				System.out.println("1. Add Student");
				System.out.println("2. Add Instructor");
				int choice;
				Scanner sc = new Scanner(System.in);
				choice = sc.nextInt();
				switch (choice) {
					case 1:
						addStudent();
						break;
					case 2:
						// addInstructor();
						break;
					default:
						break;
				}

			} else {
				System.out.println("Invalid Username or Password");
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static void addStudent() {

		try {
			Statement stmt = conn.createStatement();
			@SuppressWarnings("unused")
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

				ResultSet rs = stmt.executeQuery("select * from departments");
				while (rs.next()) {
					System.out.println(rs.getInt("id") + ". " + rs.getString("department_name"));
				}
				course = sc.nextInt();
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

	// public void addInstructor() {

	// try {
	// Statement stmt = conn.createStatement();
	// System.out.println(stmt);
	// String first_name, middle_name, last_name, email, qualification,
	// college_name, phone_number, address, city,
	// state, country, joining_date, instructor_type, status;
	// int age, department_id;
	// try (Scanner sc = new Scanner(System.in)) {
	// System.out.println("Enter First Name: ");
	// first_name = sc.nextLine();
	// System.out.println("Enter Middle Name: ");
	// middle_name = sc.nextLine();
	// System.out.println("Enter Last Name: ");
	// last_name = sc.nextLine();
	// System.out.println("Enter Department ID: ");
	// department_id = sc.nextInt();
	// System.out.println("Enter Email: ");
	// email = sc.nextLine();
	// System.out.println("Enter Age: ");
	// age = sc.nextInt();
	// System.out.println("Enter Qualification: ");
	// qualification = sc.nextLine();
	// System.out.println("Enter College Name: ");
	// college_name = sc.nextLine();
	// System.out.println("Enter Phone Number: ");
	// phone_number = sc.nextLine();
	// System.out.println("Enter Address: ");
	// address = sc.nextLine();
	// System.out.println("Enter City: ");
	// city = sc.nextLine();
	// System.out.println("Enter State: ");
	// state = sc.nextLine();
	// System.out.println("Enter Country: ");
	// country = sc.nextLine();
	// System.out.println("Enter Joining Date: ");
	// joining_date = sc.nextLine();
	// System.out.println(
	// "1. Professor\n2. HOD\n3. Lecturer\n4. Lab Assistant\n5.
	// Librarian\n6.Accountant\n7. Clerk\n8. Peon\n9. Other");
	// while (true) {
	// if (sc.nextInt() == 1) {
	// instructor_type = "professor";
	// break;
	// } else if (sc.nextInt() == 2) {
	// instructor_type = "HOD";
	// break;
	// } else if (sc.nextInt() == 3) {
	// instructor_type = "lecturer";
	// break;
	// } else if (sc.nextInt() == 4) {
	// instructor_type = "lab assistant";
	// break;
	// } else if (sc.nextInt() == 5) {
	// instructor_type = "librarian";
	// break;
	// } else if (sc.nextInt() == 6) {
	// instructor_type = "accountant";
	// break;
	// } else if (sc.nextInt() == 7) {
	// instructor_type = "clerk";
	// break;
	// } else if (sc.nextInt() == 8) {
	// instructor_type = "peon";
	// break;
	// } else {
	// instructor_type = "other";
	// break;
	// }
	// }
	// System.out.println(
	// "1. Active\n2. Deactive\n3. Resigned\n4. Retired\n5. Suspended\n6.
	// Expelled\n7. Transfered");
	// while (true) {
	// if (sc.nextInt() == 1) {
	// status = "active";
	// break;
	// } else if (sc.nextInt() == 2) {
	// status = "deactive";
	// break;
	// } else if (sc.nextInt() == 3) {
	// status = "resigned";
	// break;
	// } else if (sc.nextInt() == 4) {
	// status = "retired";
	// break;
	// } else if (sc.nextInt() == 5) {
	// status = "suspended";
	// break;
	// } else if (sc.nextInt() == 6) {
	// status = "expelled";
	// break;
	// } else {
	// status = "transfered";
	// break;
	// }
	// }
	// }
	// String sql = "insert into instructor (first_name, middle_name,
	// last_name,department_id, email, age, qualification, college_name,
	// phone_number,address, city, state, country, joining_date, instructor_type,
	// status) values( '"
	// + first_name + "', '" + middle_name + "', '" + last_name + "', '" +
	// department_id + "', '" + email
	// + "', '" + age + "', '" + qualification + "', '" + college_name + "', '" +
	// phone_number + "', '"
	// + address + "', '" + city + "', '" + state + "', '" + country + "', '" +
	// joining_date + "', '"
	// + instructor_type + "', '" + status + "')";
	// if (stmt.executeUpdate(sql) > 0) {
	// System.out.println("Instructor Added Successfully");
	// } else {
	// System.out.println("Error Occured");

	// }
	// } catch (Exception e) {
	// System.out.println(e);
	// }
	// return;
	// }
}
