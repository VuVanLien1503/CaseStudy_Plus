package service.IMPL.product;

import DAO.product.CategoryDAO;
import model.product.Category;
import service.myinterface.ICrud;

import java.util.List;

public class CategoryService implements ICrud<Category> {
    private final CategoryDAO categoryDAO;

    public CategoryService() {
        categoryDAO = new CategoryDAO();
    }

    @Override
    public List<Category> selectAll() {
        return categoryDAO.selectAll();
    }

    @Override
    public void insert(Category category) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(Category category) {

    }
}
