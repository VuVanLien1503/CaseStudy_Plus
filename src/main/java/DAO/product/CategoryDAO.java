package DAO.product;

import DAO.MyConnection;
import model.product.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private final Connection connection;
    private final String SELECT_ALL_CATEGORY = "select * from category where status = true";
    private final String INSERT_CATEGORY = "insert into category(name) value(?)";
    private final String UPDATE_CATEGORY = "update category set name = ? where id = ?";
    private final String DELETE_CATEGORY = "update category set status = false where id = ?";
    private int id;

    public CategoryDAO() {
        connection = MyConnection.getConnection();
    }

    public List<Category> selectAll() {
        List<Category> categories = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                categories.add(new Category(resultSet.getInt(1), resultSet.getString(2), resultSet.getBoolean(3)));
            }
        } catch (SQLException a) {
            a.printStackTrace();
        }
        return categories;
    }
    public void insert(Category category){
        try(PreparedStatement preparedStatement=connection.prepareStatement(INSERT_CATEGORY)){
            preparedStatement.setString(1,category.getName());
            preparedStatement.executeUpdate();
        }catch(SQLException a){
            a.printStackTrace();
        }
    }

}
