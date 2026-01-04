package dao;

import service.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    static Map<Integer, Product> data = new HashMap<>();
    static{

        data.put(1, new Product(1, "Thùng rác nhựa tái chế", "http://localhost:8080/ltw_web/images/2-150x150.png", 30.000));
        data.put(2, new Product(2, "Bàn nhựa tái chế", "http://localhost:8080/ltw_web/images/30-150x150.png", 25.000));
        data.put(3, new Product(3, "Kệ sách giấy", "http://localhost:8080/ltw_web/images/IMG_5594-750x750.jpg", 40.000));
        data.put(4, new Product(4, "Chậu cây nhựa tái chế", "http://localhost:8080/ltw_web/images/6-150x150.png", 30.000));
        data.put(5, new Product(5, "Tủ giày nhựa tái chế", "http://localhost:8080/ltw_web/images/38-150x150.png", 25.000));
        data.put(6, new Product(6, "Hộp giấy","http://localhost:8080/ltw_web/images/16-150x150.png", 40000));

    }

    public List<Product> getListProduct() {
        return new ArrayList<>(data.values());
    }
}
