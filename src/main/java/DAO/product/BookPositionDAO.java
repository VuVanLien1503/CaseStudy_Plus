package DAO.product;

import DAO.MyConnection;
import model.product.BookPosition;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookPositionDAO {
    private  final Connection connection;

    public BookPositionDAO() {
        connection = MyConnection.getConnection();
    }
    private final String SELECT_ALL_BOOK_POSITION = "select * from book_position where status = true";
    public List<BookPosition> selectAll(){
        List<BookPosition> bookPositions = new ArrayList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK_POSITION);
            ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()){
                bookPositions.add(new BookPosition(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getBoolean(6)));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return bookPositions;
    }
}
