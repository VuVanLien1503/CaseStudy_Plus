package DAO.product;

import model.product.Book;
import model.product.BookPosition;
import service.MyConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private final Connection connection;
    private final String SELECT_ALL = "SELECT book.id,book.name,book.descriptions,book.image,book.status_book,book.quantity,book.producer_id,book.category_id,book.book_position,book.status FROM book \n" +
            "inner join producer on book.producer_id =producer.id\n" +
            "inner join category on book.category_id =category.id\n" +
            "inner join book_position on book.book_position = book_position.id\n" +
            "where producer.status=true and category.status=true and book_position.status=true;\n";
    private final String SELECT_BOOK = "insert into book(name,descriptions,image,status_book,quantity,producer_id,category_id,book_position) values(?,?,?,?,?,?,?,?);";
    private final String SELECT_BOOK_BY_ID = "select * from book where id = ? and status = true";

    private final String UPDATE_BOOK ="update book set name=?,set=descriptions=?,set image=?,set status_book=?,set quantity=?,set producer_id=?,set category_id=?,set book_position=?  where id = ?";

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

    public void create(Book book) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK)) {
            connection.setAutoCommit(false);
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getDescriptions());
            preparedStatement.setString(3, book.getImage());
            preparedStatement.setBoolean(4, book.isStatus_book());
            preparedStatement.setInt(5, book.getQuantity());
            preparedStatement.setInt(6, book.getProducer_id());
            preparedStatement.setInt(7, book.getCategory_id());
            preparedStatement.setInt(8, book.getBook_position());

            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void update(Book book){
        try(PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK)){
            connection.setAutoCommit(false);
            preparedStatement.setString(1, book.getName());
            preparedStatement.setString(2, book.getDescriptions());
            preparedStatement.setString(3, book.getImage());
            preparedStatement.setBoolean(4, book.isStatus_book());
            preparedStatement.setInt(5, book.getQuantity());
            preparedStatement.setInt(6, book.getProducer_id());
            preparedStatement.setInt(7, book.getCategory_id());
            preparedStatement.setInt(8, book.getBook_position());

            preparedStatement.setInt(9,book.getId());
            preparedStatement.executeUpdate();
            connection.commit();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book findById(int id) {
        Book book = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                book =new Book (
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getBoolean(5),
                        resultSet.getInt(6),
                        resultSet.getInt(7),
                        resultSet.getInt(8),
                        resultSet.getInt(9),
                        resultSet.getBoolean(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }


}
