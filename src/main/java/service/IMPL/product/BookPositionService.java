package service.IMPL.product;

import model.product.BookPosition;
import service.myinterface.ICrud;

import java.util.List;

public class BookPositionService implements ICrud<BookPosition> {
    @Override
    public List<BookPosition> selectAll() {
        return null;
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
