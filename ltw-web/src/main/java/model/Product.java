package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String imageUrl;
    private String description;

    public Product(int id, String name, double price, String imageUrl) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
    }
    public Product(int id, String name, double price, String imageUrl, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
     public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}