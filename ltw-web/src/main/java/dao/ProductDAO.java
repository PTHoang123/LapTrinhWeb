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


    public Product getProductById(int id) {
        String sql =
            "SELECT p.product_id AS id, p.name, p.price, " +
            "       (SELECT pi.url " +
            "        FROM products_img pi " +
            "        WHERE pi.product_id = p.product_id " +
            "        ORDER BY pi.is_primary DESC, pi.sort_order ASC, pi.img_id ASC " +
            "        LIMIT 1) AS imageUrl " +
            "FROM products p " +
            "WHERE p.product_id = ?";

        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;

                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("imageUrl")
                );
            }
        } catch (Exception e) {
            LOG.log(Level.SEVERE, "[ProductDAO] getProductById failed", e);
            return null;
        }
    }
    public int countProducts(String q) {
        LOG.info("[ProductDAO] countProducts(q=" + q + ") called");

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT COUNT(DISTINCT p.product_id) ");
        sql.append("FROM products p ");
        sql.append("WHERE 1=1 ");

        List<Object> params = new ArrayList<>();

        if (q != null && !q.trim().isEmpty()) {
            sql.append(" AND LOWER(p.name) LIKE ? ");
            params.add("%" + q.trim().toLowerCase() + "%");
        }

        try (Connection c = Db.getConnection()) {
            logCurrentDatabase(c);

            try (PreparedStatement ps = c.prepareStatement(sql.toString())) {
                bind(ps, params);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            LOG.log(Level.SEVERE, "[ProductDAO] countProducts failed", e);
        }
        return 0;
    }

    public List<Product> getProducts(int page, int pageSize, String q, String sort) {
        LOG.info("[ProductDAO] getProducts(page=" + page + ", pageSize=" + pageSize + ", q=" + q + ", sort=" + sort + ")");

        List<Product> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT p.product_id, p.name, p.price, i.url ");
        sql.append("FROM products p ");
        sql.append("LEFT JOIN products_img i ");
        sql.append("  ON p.product_id = i.product_id AND i.is_primary = 1 ");
        sql.append("WHERE 1=1 ");

        List<Object> params = new ArrayList<>();

        if (q != null && !q.trim().isEmpty()) {
            sql.append(" AND LOWER(p.name) LIKE ? ");
            params.add("%" + q.trim().toLowerCase() + "%");
        }

        sql.append(" ORDER BY ").append(orderBy(sort));
        sql.append(" LIMIT ? OFFSET ? ");
        params.add(pageSize);
        params.add(offset);

        try (Connection c = Db.getConnection()) {
            logCurrentDatabase(c);

            try (PreparedStatement ps = c.prepareStatement(sql.toString())) {
                bind(ps, params);

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
            LOG.log(Level.SEVERE, "[ProductDAO] getProducts (filtered) failed", e);
        }

        return list;
    }

    private static String orderBy(String sort) {
        // whitelist only (prevents SQL injection)
        if (sort == null || sort.trim().isEmpty()) return "p.product_id DESC";
        switch (sort) {
            case "price_asc":
                return "p.price ASC, p.product_id DESC";
            case "price_desc":
                return "p.price DESC, p.product_id DESC";
            default:
                return "p.product_id DESC";
        }
    }

    private static void bind(PreparedStatement ps, List<Object> params) throws SQLException {
        for (int i = 0; i < params.size(); i++) {
            ps.setObject(i + 1, params.get(i));
        }
    }

    public int countActive(Integer categoryId, String q) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM products p WHERE p.status='active' ");
        List<Object> params = new ArrayList<>();

        if (categoryId != null) {
            sql.append("AND p.category_id = ? ");
            params.add(categoryId);
        }
        if (q != null && !q.isBlank()) {
            sql.append("AND p.name LIKE ? ");
            params.add("%" + q.trim() + "%");
        }

        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }

        public List<Product> findActive(Integer categoryId, String q, String sort, int limit, int offset) throws SQLException {
        StringBuilder sql = new StringBuilder(
            "SELECT p.product_id AS id, p.name, p.price, " +
            "       (SELECT pi.url " +
            "        FROM products_img pi " +
            "        WHERE pi.product_id = p.product_id " +
            "        ORDER BY pi.is_primary DESC, pi.sort_order ASC, pi.img_id ASC " +
            "        LIMIT 1) AS imageUrl " +
            "FROM products p " +
            "WHERE p.status='active' "
        );

        List<Object> params = new ArrayList<>();
        if (categoryId != null) {
            sql.append("AND p.category_id = ? ");
            params.add(categoryId);
        }
        if (q != null && !q.isBlank()) {
            sql.append("AND p.name LIKE ? ");
            params.add("%" + q.trim() + "%");
        }

        if ("price_asc".equals(sort)) sql.append("ORDER BY p.price ASC ");
        else if ("price_desc".equals(sort)) sql.append("ORDER BY p.price DESC ");
        else sql.append("ORDER BY p.product_id DESC ");

        sql.append("LIMIT ? OFFSET ? ");
        params.add(limit);
        params.add(offset);

        List<Product> out = new ArrayList<>();
        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    out.add(new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("imageUrl") // may be null
                    ));
                }
            }
        }
        return out;
    }
}