package controller;

import dao.UserDAO;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class SignupServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = trim(req.getParameter("fullName"));
        String email = trim(req.getParameter("email"));
        String password = req.getParameter("password");

        if (fullName == null || fullName.isEmpty() ||
            email == null || email.isEmpty() ||
            password == null || password.length() < 6) {
            req.setAttribute("error", "Invalid input. Password must be at least 6 characters.");
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            return;
        }

        try {
            User existing = userDAO.findByEmail(email);
            if (existing != null) {
                req.setAttribute("error", "Email already exists.");
                req.getRequestDispatcher("/signup.jsp").forward(req, resp);
                return;
            }

            String hash = BCrypt.hashpw(password, BCrypt.gensalt(10));
            int userId = userDAO.createUser(email, hash, fullName, "user");

            HttpSession session = req.getSession(true);
            session.setAttribute("userId", userId);
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", "user");
            session.setAttribute("userName", fullName);

            resp.sendRedirect(req.getContextPath() + "/home.jsp");
        } catch (Exception e) {
            req.setAttribute("error", "Sign up failed: " + e.getMessage());
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
        }
    }

    private static String trim(String s) {
        return s == null ? null : s.trim();
    }
}