package com.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    String userDatabase = "coretripappusers";

    public static Connection initializeConnection() throws ClassNotFoundException, SQLException {
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbUrl = "jdbc:mysql://localhost:3306/";

        //Db credentials
        String userName = "root";
        String passWord = "411353";
        String dbName = "coretripapp";

        Class.forName(dbDriver);

        return DriverManager.getConnection(dbUrl + dbName, userName, passWord);
    }
}
