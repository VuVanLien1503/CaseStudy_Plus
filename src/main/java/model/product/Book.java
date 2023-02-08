package model.product;

public class Book {
    private int id;
    private String name;
    private String descriptions;
    private String image;
    private boolean status_book;
    private int quantity;
    private  int producer_id;
    private  int category_id;
    private  int book_position;
    private boolean status=true;

    public Book() {
    }

    public Book(int id, String name, String descriptions, String image, boolean status_book, int quantity, int producer_id, int category_id, int book_position, boolean status) {
        this.id = id;
        this.name = name;
        this.descriptions = descriptions;
        this.image = image;
        this.status_book = status_book;
        this.quantity = quantity;
        this.producer_id = producer_id;
        this.category_id = category_id;
        this.book_position = book_position;
        this.status = status;
    }

    public Book(String name, String descriptions, String image, boolean status_book, int quantity, int producer_id, int category_id, int book_position, boolean status) {
        this.name = name;
        this.descriptions = descriptions;
        this.image = image;
        this.status_book = status_book;
        this.quantity = quantity;
        this.producer_id = producer_id;
        this.category_id = category_id;
        this.book_position = book_position;
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

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus_book() {
        return status_book;
    }

    public void setStatus_book(boolean status_book) {
        this.status_book = status_book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProducer_id() {
        return producer_id;
    }

    public void setProducer_id(int producer_id) {
        this.producer_id = producer_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getBook_position() {
        return book_position;
    }

    public void setBook_position(int book_position) {
        this.book_position = book_position;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
