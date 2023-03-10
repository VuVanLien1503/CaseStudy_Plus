package DAO.product;

import DAO.MyConnection;
import model.product.Position;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionDAO {
    private  final Connection connection;

    public PositionDAO() {
        connection = MyConnection.getConnection();
    }
    private final String SELECT_ALL_BOOK_POSITION = "select * from positions where status = true";
    private final String INSERT_BOOK_POSITION = "insert into positions(name,contain,position,quantityNow)values(?,?,?,?)";
    private final String SELECT_BOOK_POSITION_BY_ID = "select * from positions where id = ? and status = true";
    private final String UPDATE_BOOK_POSITION ="update positions set name = ? , position = ? where id = ?";
    private final String UPDATE_QUANTITY ="update positions set quantityNow = ? where id = ?";

    private final String DELETE_POSITION = "update positions set status = false where id = ?";
    public List<Position> selectAll(){
        List<Position> bookPositions = new ArrayList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK_POSITION);
            ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()){
                bookPositions.add(new Position(resultSet.getInt(1),
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
    public  void  create(Position bookPosition){
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
    public Position findById(int id){
        Position bookPosition = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_POSITION_BY_ID)) {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                bookPosition = new Position(resultSet.getInt(1),
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
    public void update(Position bookPosition){
        try(PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK_POSITION)){
            preparedStatement.setString(1,bookPosition.getName());
            preparedStatement.setString(2,bookPosition.getPosition());
            preparedStatement.setInt(3,bookPosition.getId());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete(int id){
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_POSITION)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateQuantityNow(Position bookPosition,int result){
        try(PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUANTITY)){
            preparedStatement.setInt(1,result);
            preparedStatement.setInt(2,bookPosition.getId());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
