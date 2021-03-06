package com.phoenixairline.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectToDB {

    public static Connection createConnection() {
        Connection con = null;
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/phoenixairline_db";
        String username = "wimu";
        String password = "20777";

        try {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e1) {
            }

            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connection established -> " + con);
        } catch (SQLException e) {
            System.out.println("Database connection failed!" + e);
        }

        return con;
    }
}
