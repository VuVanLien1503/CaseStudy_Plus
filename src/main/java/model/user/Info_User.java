package model.user;

import java.util.Date;

public class Info_User {
    private int id;
    private Date birthDay;
    private String phone;
    private  String image;
    private int user_id;
    private boolean status=true;

    public Info_User() {
    }

    public Info_User(Date birthDay, String phone, String image, int user_id, boolean status) {
        this.birthDay = birthDay;
        this.phone = phone;
        this.image = image;
        this.user_id = user_id;
        this.status = status;
    }

    public Info_User(int id, Date birthDay, String phone, String image, int user_id, boolean status) {
        this.id = id;
        this.birthDay = birthDay;
        this.phone = phone;
        this.image = image;
        this.user_id = user_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
