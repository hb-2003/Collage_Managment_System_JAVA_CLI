package config;

import java.sql.*;

public class connect {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // connect with java mysql jdbc connecttion and create a data base name is
            // collage_mamanagement_system
            String url = "jdbc:mysql://localhost:3306/collage_management_system";
            String username = "root";
            String password = "Hardik@96011";
            connection = DriverManager.getConnection(url, username, password);
          
        } catch (Exception e) {
            System.out.println(e);
        }
        return connection;
    }

}