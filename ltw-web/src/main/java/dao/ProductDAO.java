package dao;

import model.Product;
import util.Db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {

    private static final Logger LOG = Logger.getLogger(ProductDAO.class.getName());

    private void logCurrentDatabase(Connection c) throws SQLException {
        try (Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("SELECT DATABASE()")) {
            if (rs.next()) {
                LOG.info("[ProductDAO] DATABASE() = " + rs.getString(1));
            }
        }
    }

    public int getTotalProducts() {
        LOG.info("[ProductDAO] getTotalProducts() called");
        try (Connection c = Db.getConnection()) {
            logCurrentDatabase(c);

            try (Statement stmt = c.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM products")) {
                if (rs.next()) return rs.getInt(1);
            }
        } catch (Exception e) {
            LOG.log(Level.SEVERE, "[ProductDAO] getTotalProducts failed", e);
        }
        return 0;
    }

    public List<Product> getProducts(int page, int pageSize) {
        LOG.info("[ProductDAO] getProducts() called page=" + page + " pageSize=" + pageSize);

        List<Product> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        String sql =
            "SELECT p.product_id, p.name, p.price, i.url " +
            "FROM products p " +
            "LEFT JOIN products_img i " +
            "  ON p.product_id = i.product_id AND i.is_primary = 1 " +
            "ORDER BY p.product_id DESC " +
            "LIMIT ? OFFSET ?";

        try (Connection c = Db.getConnection()) {
            logCurrentDatabase(c);

            try (PreparedStatement ps = c.prepareStatement(sql)) {
                ps.setInt(1, pageSize);
                ps.setInt(2, offset);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        list.add(new Product(
                                rs.getInt("product_id"),
                                rs.getString("name"),
                                rs.getDouble("price"),
                                rs.getString("url")
                        ));
                    }
                }
            }
        } catch (Exception e) {
            LOG.log(Level.SEVERE, "[ProductDAO] getProducts failed", e);
        }
        return list;
    }
}