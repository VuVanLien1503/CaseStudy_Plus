package DAO.user;

import DAO.MyConnection;
import model.user.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO {
    private  final Connection connection;

    public UsersDAO() {
        connection = MyConnection.getConnection();
    }
    private final String SELECT_ALL_USES = "select * from users where status = true";
    private final String INSERT_USERS = "insert into users (name,email,password) values (?,?,?)";
    private final String SELECT_USERS_BY_ID = "select * from users where id = ? and status = true";
    private final String UPDATE_USERS ="update users set password = ? where id = ?";
    private final String DELETE_USERS = "update users set status = false where id = ?";


    public List<Users> selectAll(){
        List<Users> users = new ArrayList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USES);
            ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()){
                users.add(new Users(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getDate(5),
                        resultSet.getString(6),
                        resultSet.getString(7)));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public  void  create(Users users){
        try(PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS)
        ){
            preparedStatement.setString(1, users.getName());
            preparedStatement.setString(2, users.getEmail());
            preparedStatement.setString(3, users.getPassword());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public  Users findById(int id){
        Users users = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID)) {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
               users = new Users(resultSet.getInt(1),
                       resultSet.getString(2),
                       resultSet.getString(3),
                       resultSet.getString(4),
                       resultSet.getBoolean(5));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public void update(Users users){
        try(PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS)){
            preparedStatement.setString(1, users.getPassword());
            preparedStatement.setInt(2,users.getId());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete(int id){
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
