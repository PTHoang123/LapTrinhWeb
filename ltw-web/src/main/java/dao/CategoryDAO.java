package dao;

import model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    private final String jdbcUrl;
    private final String jdbcUser;
    private final String jdbcPass;

    public CategoryDAO(String jdbcUrl, String jdbcUser, String jdbcPass) {
        this.jdbcUrl = jdbcUrl;
        this.jdbcUser = jdbcUser;
        this.jdbcPass = jdbcPass;
    }

    public List<Category> findAllWithProductCount() throws SQLException {
        List<Category> list = new ArrayList<>();

        String sql =
                "SELECT c.category_id, c.name, COUNT(p.product_id) AS total " +
                "FROM categories c " +
                "LEFT JOIN products p ON p.category_id = c.category_id AND p.status = 'active' " +
                "GROUP BY c.category_id, c.name " +
                "ORDER BY c.name ASC";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
                c.setProductCount(rs.getInt("total"));
                list.add(c);
            }
        }

        return list;
    }
}