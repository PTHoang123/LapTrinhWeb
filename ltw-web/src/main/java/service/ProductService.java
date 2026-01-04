package service;

import dao.ProductDao;

import java.util.List;

public class ProductService {
    ProductDao pDao = new ProductDao();

    public List<Product> getListProduct() {
        return pDao.getListProduct();
    }
}
