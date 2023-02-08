package model.product;

public class BookPosition {
    private int id;
    private String name;
    private int quantity;
    private String position;
    private int quantityNow;
    private boolean status =true;

    public BookPosition() {
    }

    public BookPosition(String name, int quantity, String position, int quantityNow, boolean status) {
        this.name = name;
        this.quantity = quantity;
        this.position = position;
        this.quantityNow = quantityNow;
        this.status = status;
    }

    public BookPosition(int id, String name, int quantity, String position, int quantityNow, boolean status) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.position = position;
        this.quantityNow = quantityNow;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getQuantityNow() {
        return quantityNow;
    }

    public void setQuantityNow(int quantityNow) {
        this.quantityNow = quantityNow;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
