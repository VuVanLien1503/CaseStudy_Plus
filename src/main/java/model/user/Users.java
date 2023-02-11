package model.user;

import java.util.Date;

public class Users {
    private int id;
    private String name;
    private String email;
    private String password;
    private Date birthDay;
    private String phone;
    private  String image;
    private boolean status=true;

    public Users() {
    }

    public Users(int id, String name, String email, String password, Date birthDay, String phone, String image) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.birthDay = birthDay;
        this.phone = phone;
        this.image = image;
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

    public Users(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public Users(int id, String name, String email, String password, Date birthDay, String phone, String image, boolean status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.birthDay = birthDay;
        this.phone = phone;
        this.image = image;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
