package model;

import java.io.Serializable;

public class CartItem implements Serializable {
    private final int productId;
    private final String name;
    private final double price;
    private final String imageUrl;
    private int quantity;

    public CartItem(int productId, String name, double price, String imageUrl, int quantity) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
    }

    public int getProductId() { return productId; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
    public int getQuantity() { return quantity; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void increment(int delta) { this.quantity += delta; }

    public double getLineTotal() { return price * quantity; }
}