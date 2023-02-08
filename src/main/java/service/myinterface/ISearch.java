package service.myinterface;

import java.util.List;

public interface ISearch<E> {
    public E selectById(int id);
    public List<E> selectName(String value);
}
