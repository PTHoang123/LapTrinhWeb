package dao;

import util.Db;

import java.math.BigDecimal;
import java.sql.*;

public class AdminProductDAO {

    public int insertProduct(
            int categoryId,
            String name,
            String slug,
            String description,
            BigDecimal price,
            String status,
            String imageUrl
    ) throws SQLException {

        if (status == null || status.isBlank()) status = "active";
        if (!status.equals("active") && !status.equals("archived")) status = "active";

        String sql = "INSERT INTO products(category_id, name, slug, description, price, status) VALUES (?,?,?,?,?,?)";

        try (Connection c = Db.getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, categoryId);
            ps.setString(2, name);
            if (slug == null || slug.isBlank()) ps.setNull(3, Types.VARCHAR);
            else ps.setString(3, slug);

            if (description == null || description.isBlank()) ps.setNull(4, Types.LONGVARCHAR);
            else ps.setString(4, description);

            ps.setBigDecimal(5, price);
            ps.setString(6, status);

            ps.executeUpdate();

            int productId;
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (!keys.next()) throw new SQLException("No generated key returned");
                productId = keys.getInt(1);
            }

            if (imageUrl != null && !imageUrl.isBlank()) {
                String sqlImg = "INSERT INTO products_img(product_id, url, sort_order, is_primary) VALUES (?,?,0,1)";
                try (PreparedStatement psi = c.prepareStatement(sqlImg)) {
                    psi.setInt(1, productId);
                    psi.setString(2, imageUrl.trim());
                    psi.executeUpdate();
                }
            }

            return productId;
        }
    }
}