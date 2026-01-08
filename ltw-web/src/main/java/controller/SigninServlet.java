package controller;

import dao.UserDAO;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class SigninServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = trim(req.getParameter("email"));
        String password = req.getParameter("password");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("error", "Email and password are required.");
            req.getRequestDispatcher("/signin.jsp").forward(req, resp);
            return;
        }

        try {
            User u = userDAO.findByEmail(email);
            if (u == null || u.getPasswordHash() == null || !BCrypt.checkpw(password, u.getPasswordHash())) {
                req.setAttribute("error", "Invalid email or password.");
                req.getRequestDispatcher("/signin.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession(true);
            session.setAttribute("userId", u.getUserId());
            session.setAttribute("userEmail", u.getEmail());
            session.setAttribute("userRole", u.getRole());
            session.setAttribute("userName", u.getFullName());

            resp.sendRedirect(req.getContextPath() + "/home.jsp");
        } catch (Exception e) {
            req.setAttribute("error", "Sign in failed: " + e.getMessage());
            req.getRequestDispatcher("/signin.jsp").forward(req, resp);
        }
    }

    private static String trim(String s) {
        return s == null ? null : s.trim();
    }
}