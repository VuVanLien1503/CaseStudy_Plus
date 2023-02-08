package DAO.product;

import model.product.Book;
import service.MyConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private final Connection connection;
    private final String SELECT_ALL = "select * from book where status = true";

    public BookDAO() {
        connection = MyConnection.getConnection();
    }

    public List<Book> findAll() {
        List<Book> listBook = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                listBook.add(new Book(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getBoolean(5),
                        resultSet.getInt(6),
                        resultSet.getInt(7),
                        resultSet.getInt(8),
                        resultSet.getInt(9),
                        resultSet.getBoolean(10)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listBook;
    }
}
