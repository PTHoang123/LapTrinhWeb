package cart;

import java.util.HashMap;
import java.util.Map;

import service.Product;
import cart.CartItem;

public class Cart {
    Map<Integer, CartItem> data;

    public Cart(){
        data = new HashMap<>();
    }

    public void addProduct(Product p, int quantity){
        if(data.containsKey(p.getId())) data.get(p.getId()).upQuantity(quantity);
        else data.put(p.getId(),new CartItem(p, p.getPrice(), quantity));
    }
}
