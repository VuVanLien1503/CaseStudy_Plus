package DAO.product;

import DAO.MyConnection;
import model.product.Producer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProducerDAO {
    private  final Connection connection;

    public ProducerDAO( ) {
        connection = MyConnection.getConnection();
    }

    private final String SELECT_ALL_PRODUCER = "select * from producer where status = true";
    private final String SELECT_PRODUCER_BY_ID = "select * from producer where id = ? and status = true";
    private final String INSERT_PRODUCER = "insert into producer(name, status) value (?,?)";
    private final String UPDATE_PRODUCER = "update producer set name = ? where id = ?";
    private final String DELETE_PRODUCER = "update producer set status = false where id = ?";

    public List<Producer> findAll() {
        List<Producer> producerList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCER);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()){
                producerList.add(new Producer(resultSet.getInt(1),resultSet.getString(2),resultSet.getBoolean(3)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return producerList;
    }

    public Producer selectById(int id){
        Producer producer = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCER_BY_ID)){
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                producer = new Producer(resultSet.getInt(1),resultSet.getString(2),resultSet.getBoolean(3));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return producer;
    }

    public void create(Producer producer) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCER)) {
            preparedStatement.setString(1, producer.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Producer producer){
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCER)){
            preparedStatement.setString(1, producer.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void delete (Integer id){
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCER)){
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

}
