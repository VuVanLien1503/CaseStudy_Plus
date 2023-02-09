package service.IMPL.product;

import DAO.product.ProducerDAO;
import model.product.Producer;
import service.myinterface.ICrud;

import java.util.List;

public class ProducerService implements ICrud<Producer> {
    private final ProducerDAO producerDAO;

    public ProducerService(){
        producerDAO = new ProducerDAO();
    }
    @Override
    public List<Producer> selectAll() {
        return producerDAO.findAll();
    }

    @Override
    public void insert(Producer producer) {
        producerDAO.create(producer);
    }

    @Override
    public void delete(int id) {
        producerDAO.delete(id);
    }

    @Override
    public void update(Producer producer) {
        producerDAO.update(producer);
    }



}
