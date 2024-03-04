package Admin;

import java.sql.*;
import config.connect;
import java.util.Scanner;

public class admin {
	static Connection conn = connect.getConnection();
	String name, department_name;
	int id;

	public admin(String username, String password) {

		try {

			PreparedStatement pstmt = conn.prepareStatement(
					"select * from admin where username = '" + username + "' and password = '" + password + "'");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("Login Successfull");
				System.out.println("Welcome " + rs.getString("name"));
				id = rs.getInt("id");
				name = rs.getString("name");

				System.out.println("select your choice");
				System.out.println("1. Student\n2. Instructor\n3. exit");

				int choice;
				Scanner sc = new Scanner(System.in);
				choice = sc.nextInt();
				switch (choice) {
					case 1:
						student s1 = new student(id);
						break;
					case 2:
						instructor i1 = new instructor(id);
						break;
					case 3:
						break;
					default:
						break;
				}

			} else {
				System.out.println("Invalid Username or Password");
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
}
