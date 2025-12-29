package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class ProductListServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO(); // loads db.properties
        try { Class.forName("com.mysql.cj.jdbc.Driver"); } catch (ClassNotFoundException ignored) {}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String q = trimToNull(request.getParameter("q"));
        String sort = trimToNull(request.getParameter("sort"));

        Integer categoryId = null;
        String categoryIdStr = trimToNull(request.getParameter("categoryId"));
        if (categoryIdStr != null) {
            try { categoryId = Integer.parseInt(categoryIdStr); } catch (NumberFormatException ignored) {}
        }

        int page = parseIntOrDefault(request.getParameter("page"), 1);
        int pageSize = 12;
        if (page < 1) page = 1;

        try {
            int total = productDAO.countActive(categoryId, q);
            int totalPages = (int) Math.ceil(total / (double) pageSize);
            if (totalPages < 1) totalPages = 1;
            if (page > totalPages) page = totalPages;

            int offset = (page - 1) * pageSize;
            List<Product> products = productDAO.findActive(categoryId, q, sort, pageSize, offset);

            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("q", q);
            request.setAttribute("sort", sort);
            request.setAttribute("categoryId", categoryId);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("products", Collections.emptyList());
            request.setAttribute("currentPage", 1);
            request.setAttribute("totalPages", 1);
        }

        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }

    private static String trimToNull(String s) {
        if (s == null) return null;
        String t = s.trim();
        return t.isEmpty() ? null : t;
    }

    private static int parseIntOrDefault(String s, int def) {
        if (s == null) return def;
        try { return Integer.parseInt(s); } catch (NumberFormatException e) { return def; }
    }
}