package controller;

import dao.CategoryDAO;
import model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

public class CategoriesController extends HttpServlet {

    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        Properties p = new Properties();

        // 1) Try classpath: src/main/resources/db.properties
        try (InputStream in = Thread.currentThread()
                .getContextClassLoader()
                .getResourceAsStream("db.properties")) {
            if (in != null) p.load(in);
        } catch (IOException e) {
            throw new ServletException("Failed to load db.properties", e);
        }

        // 2) Read from properties first, fallback to web.xml context-param
        String url = p.getProperty("db.url");
        String user = p.getProperty("db.user");
        String pass = p.getProperty("db.password");

        if (url == null) url = getServletContext().getInitParameter("DB_URL");
        if (user == null) user = getServletContext().getInitParameter("DB_USER");
        if (pass == null) pass = getServletContext().getInitParameter("DB_PASSWORD");

        if (url == null || user == null) {
            throw new ServletException("Database config missing. Need db.properties (db.url/db.user/db.password) or web.xml context-param.");
        }

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