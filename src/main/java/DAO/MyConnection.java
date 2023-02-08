package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    public static Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/book_management?useSSL=false";
        String user = "root";
        String passWord = "123456";
        String driver = "com.mysql.cj.jdbc.Driver";
        Connection connection = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, passWord);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
