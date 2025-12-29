package controller;

import dao.CategoryDAO;
import model.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CategoriesController extends HttpServlet {

    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        String url = getServletContext().getInitParameter("DB_URL");
        String user = getServletContext().getInitParameter("DB_USER");
        String pass = getServletContext().getInitParameter("DB_PASSWORD");

        // Optional env fallback
        if (url == null) url = System.getenv("DB_URL");
        if (user == null) user = System.getenv("DB_USER");
        if (pass == null) pass = System.getenv("DB_PASSWORD");

        categoryDAO = new CategoryDAO(url, user, pass);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ignored) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Category> categories = categoryDAO.findAllWithProductCount();
            req.setAttribute("categories", categories);
        } catch (SQLException ex) {
            req.setAttribute("error", ex.getMessage());
        }

        req.getRequestDispatcher("/categories.jsp").forward(req, resp);
    }
}