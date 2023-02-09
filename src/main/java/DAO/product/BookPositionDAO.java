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
    private final String INSERT_BOOK_POSITION = "insert into book_position(name,positionContain,position,quantityNow)values(?,?,?,?)";
    private final String SELECT_BOOK_POSITION_BY_ID = "select * from book_position where id = ? and status = true";
    private final String UPDATE_BOOK_POSITION ="update book_position set name = ? , position = ? where id = ?";
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
    public  void  create(BookPosition bookPosition){
        try(PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_POSITION)
        ){
            preparedStatement.setString(1, bookPosition.getName());
            preparedStatement.setInt(2, bookPosition.getQuantity());
            preparedStatement.setString(3, bookPosition.getPosition());
            preparedStatement.setInt(4, bookPosition.getQuantityNow());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public  BookPosition findById(int id){
        BookPosition bookPosition = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_POSITION_BY_ID)) {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                bookPosition = new BookPosition(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getBoolean(6));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return bookPosition;
    }
    public void update(BookPosition bookPosition){
        try(PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK_POSITION)){
            preparedStatement.setString(1,bookPosition.getName());
            preparedStatement.setString(2,bookPosition.getPosition());
            preparedStatement.setInt(3,bookPosition.getId());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
