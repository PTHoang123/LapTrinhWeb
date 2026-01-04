package cart;

import service.Product;

public class CartItem {

    private Product product;
    private double price;
    private int quantity;

    public CartItem(Product product, double price, int quantity) {
        this.product = product;
        this.price = price;
        this.quantity = quantity;
    }

    public void upQuantity(int quantity) {
        if(quantity<=0) quantity=1;
        this.quantity+=quantity;
    }
}
