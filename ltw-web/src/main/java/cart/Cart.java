package cart;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    Map<Integer, CartItem> data;

    public Cart(){
        data = new HashMap<>();
    }
}
