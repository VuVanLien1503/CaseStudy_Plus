package service.IMPL.product;

import DAO.product.BookDAO;
import model.product.Book;
import service.myinterface.ICrud;
import service.myinterface.ISearch;

import java.util.List;

public class BookService implements ICrud<Book>, ISearch<Book> {
    private final BookDAO bookDAO;

    public BookService() {
        bookDAO = new BookDAO();
    }


    @Override
    public List<Book> selectAll() {
        return bookDAO.findAll();
    }

    @Override
    public void insert(Book book) {
        bookDAO.create(book);
    }

    @Override
    public void delete(int id) {
        bookDAO.delete(id);
    }

    @Override
    public void update(Book book) {
        bookDAO.update(book);
    }

    @Override
    public Book selectById(int id) {
        return bookDAO.findById(id);
    }

    @Override
    public List<Book> selectName(String value) {
        return bookDAO.findByName(value);
    }
}
