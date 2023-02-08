package service.myinterface;
import java.util.List;

public interface ICrud<E> {
    public List<E> selectAll();
    public void insert(E e);
    public void delete(int id) ;
    public void update(E e);
}
