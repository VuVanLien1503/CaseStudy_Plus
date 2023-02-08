package model.product;

public class BookPosition {
    private int id;
    private String name;
    private int positionContain;
    private String position;
    private int quantityVailble;
    private boolean status =true;

    public BookPosition() {
    }

    public BookPosition(String name, int positionContain, String position, int quantityVailble, boolean status) {
        this.name = name;
        this.positionContain = positionContain;
        this.position = position;
        this.quantityVailble = quantityVailble;
        this.status = status;
    }

    public BookPosition(int id, String name, int positionContain, String position, int quantityVailble, boolean status) {
        this.id = id;
        this.name = name;
        this.positionContain = positionContain;
        this.position = position;
        this.quantityVailble = quantityVailble;
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

    public int getPositionContain() {
        return positionContain;
    }

    public void setPositionContain(int positionContain) {
        this.positionContain = positionContain;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getQuantityVailble() {
        return quantityVailble;
    }

    public void setQuantityVailble(int quantityVailble) {
        this.quantityVailble = quantityVailble;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
