package service.IMPL.product;
import DAO.product.BookDAO;
import model.product.Book;
import service.myinterface.ICrud;

import java.util.List;

public class BookService implements ICrud<Book> {
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
    }
    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(Book book) {
        return false;
    }
}
