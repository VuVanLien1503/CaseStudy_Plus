package service.myinterface;
import java.util.List;

public interface ICrud<E> {
    public List<E> selectAll();
    public void insert(E e);
    public boolean delete(int id) ;
    public boolean update(E e);
}
