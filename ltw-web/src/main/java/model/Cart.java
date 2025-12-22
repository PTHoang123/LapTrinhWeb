package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart implements Serializable {
    private final Map<Integer, CartItem> items = new LinkedHashMap<>();

    public void add(CartItem item) {
        CartItem existing = items.get(item.getProductId());
        if (existing == null) {
            items.put(item.getProductId(), item);
        } else {
            existing.increment(item.getQuantity());
        }
    }

    public void updateQuantity(int productId, int quantity) {
        CartItem existing = items.get(productId);
        if (existing == null) return;

        if (quantity <= 0) items.remove(productId);
        else existing.setQuantity(quantity);
    }

    public void remove(int productId) {
        items.remove(productId);
    }

    public void clear() {
        items.clear();
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public int getTotalQuantity() {
        return items.values().stream().mapToInt(CartItem::getQuantity).sum();
    }

    public double getTotalAmount() {
        return items.values().stream().mapToDouble(CartItem::getLineTotal).sum();
    }
}