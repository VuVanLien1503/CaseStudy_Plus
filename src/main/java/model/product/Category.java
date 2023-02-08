package model.product;

public class Category {
    private int id;
    private String name;
    private boolean status=true;

    public Category() {
    }

    public Category(String name, boolean status) {
        this.name = name;
        this.status = status;
    }

    public Category(int id, String name, boolean status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }
}
