package service.IMPL.product;

import DAO.product.BookPositionDAO;
import model.product.BookPosition;
import service.myinterface.ICrud;

import java.util.List;

public class BookPositionService implements ICrud<BookPosition> {
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

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(BookPosition bookPosition) {

    }
}
