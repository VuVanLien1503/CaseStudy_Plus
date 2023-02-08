package model.product;

public class Producer {
    private int id;
    private String name;
    private boolean status=true;

    public Producer() {
    }

    public Producer(String name, boolean status) {
        this.name = name;
        this.status = status;
    }

    public Producer(int id, String name, boolean status) {
        this.id = id;
        this.name = name;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
