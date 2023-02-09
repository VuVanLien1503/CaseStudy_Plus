package service.IMPL.product;

import DAO.product.BookPositionDAO;
import model.product.BookPosition;
import service.myinterface.ICrud;
import service.myinterface.ISearch;

import java.util.List;

public class BookPositionService implements ICrud<BookPosition>, ISearch<BookPosition> {
    private final BookPositionDAO bookPositionDAO;

    public BookPositionService() {
        bookPositionDAO = new BookPositionDAO();
    }

    @Override
    public List<BookPosition> selectAll() {
        return bookPositionDAO.selectAll();
    }

    @Override
    public void insert(BookPosition bookPosition) {
        bookPositionDAO.create(bookPosition);
    }

    @Override
    public void delete(int id) {
        bookPositionDAO.delete(id);
    }

    @Override
    public void update(BookPosition bookPosition) {
        bookPositionDAO.update(bookPosition);
    }

    @Override
    public BookPosition selectById(int id) {
        return bookPositionDAO.findById(id);
    }

    @Override
    public List<BookPosition> selectName(String value) {
        return null;
    }
}
