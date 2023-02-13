package service.IMPL.product;

import DAO.product.PositionDAO;
import model.product.Position;
import service.myinterface.ICrud;
import service.myinterface.ISearch;

import java.util.List;

public class PositionService implements ICrud<Position>, ISearch<Position> {
    private final PositionDAO bookPositionDAO;

    public PositionService() {
        bookPositionDAO = new PositionDAO();
    }

    @Override
    public List<Position> selectAll() {

        return bookPositionDAO.selectAll();
    }

    @Override
    public void insert(Position bookPosition) {
        bookPositionDAO.create(bookPosition);
    }

    @Override
    public void delete(int id) {
        bookPositionDAO.delete(id);
    }

    @Override
    public void update(Position bookPosition) {
        bookPositionDAO.update(bookPosition);
    }

    @Override
    public Position selectById(int id) {

        return bookPositionDAO.findById(id);
    }

    @Override
    public List<Position> selectName(String value) {
        return null;
    }
    public void updateQuantityNow(Position position, int result) {
        bookPositionDAO.updateQuantityNow(position, result);
    }

}
