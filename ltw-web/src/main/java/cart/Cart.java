package cart;

import java.io.Serializable;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

import service.Product;

public class Cart implements Serializable {
    Map<Integer, CartItem> data;

    public Cart(){
        data = new HashMap<>();
    }

    public void addProduct(Product p, int quantity){
        if(data.containsKey(p.getId())) data.get(p.getId()).upQuantity(quantity);
        else data.put(p.getId(),new CartItem(p, p.getPrice(), quantity));
    }

    public CartItem deleteProduct(int id){
        return data.remove(id);
    }

    public List<CartItem> deleteAll(){
        Collection<CartItem> values = data.values();
        data.clear();
        return new ArrayList<>(values);
    }

    public List<CartItem> getList(){
        return new ArrayList<>(data.values());
    }

    public int getTotalQuantity(){
         AtomicInteger total = new AtomicInteger();
        data.values().stream().forEach(p-> {
            total.addAndGet(p.getQuantity());});
        return total.get();
    }

    public double getTotal(){
        AtomicReference<Double> total = new AtomicReference<>((double) 0);
        data.values().forEach(p-> total.updateAndGet(v -> (v+(p.getQuantity() * (p.getPrice())))));
        return total.get();
    }

    public boolean update(int id, Product p){
        if (!data.containsKey(id)) {
            return false;
        }

        CartItem item = data.get(id);
        item.setProduct(p);
        item.setPrice(p.getPrice());

        return true;
    }

}
