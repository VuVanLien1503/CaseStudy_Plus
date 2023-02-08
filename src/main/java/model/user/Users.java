package model.user;

public class Users {
    private int id;
    private String name;
    private String email;
    private String password;
    private boolean status=true;

    public Users() {
    }

    public Users(String name, String email, String password, boolean status) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public Users(int id, String name, String email, String password, boolean status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.status = status;
    }
}
