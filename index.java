
import Admin.admin;
import java.util.Scanner;

public class index {
    public static void main(String[] args) {

        while (true) {

            System.out.println("1. Admin Login");
            System.out.println("2. Falcuty Login");
            System.out.println("3. Student Login");
            System.out.println("Enter Your Choice");
            Scanner sc = new Scanner(System.in);
            int choice = sc.nextInt();

            switch (choice) {

                case 1:
                    System.out.println("Admin Login");
                    System.out.println("Enter Username");
                    String username = sc.next();
                    System.out.println("Enter Password");
                    String password = sc.next();
                    admin a = new admin();
                    a.login(username, password);

                    break;
                case 2:
                    // falcuty f = new falcuty();
                    // f.falcuty();
                    break;
                case 3:
                    // student s = new student();
                    // s.student();
                    break;
                default:
                    break;
            }

        }
    }
}
