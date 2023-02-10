package service.IMPL.user;

import DAO.user.UsersDAO;
import model.user.Users;
import service.myinterface.ICrud;
import service.myinterface.ISearch;

import java.util.List;

public class UsersService implements ICrud<Users>, ISearch<Users> {
    private final UsersDAO usersDAO;

    public UsersService() {
       usersDAO = new UsersDAO();
    }

    @Override
    public List<Users> selectAll() {
        return usersDAO.selectAll();
    }

    @Override
    public void insert(Users users) {
        usersDAO.create(users);
    }

    @Override
    public void delete(int id) {
        usersDAO.delete(id);
    }

    @Override
    public void update(Users users) {
        usersDAO.update(users);
    }

    @Override
    public Users selectById(int id) {
        return usersDAO.findById(id);
    }

    @Override
    public List<Users> selectName(String value) {
        return null;
    }
}
