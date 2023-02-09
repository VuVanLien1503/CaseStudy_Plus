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

    public Category findById(int id) {
        return categoryDAO.findById(id);
    }

    @Override
    public void insert(Category category) {
        categoryDAO.insert(category);
    }

    @Override
    public void delete(int id) {
        categoryDAO.delete(id);
    }

    @Override
    public void update(Category category) {
        categoryDAO.update(category);
    }
}
