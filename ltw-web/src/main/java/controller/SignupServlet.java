package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.UserDAO;

public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println("EMAIL = [" + email + "]");

        // Regex kiểm tra mật khẩu mạnh
        String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=?]).{8,}$";

        if (!password.matches(pattern)) {
            req.setAttribute("error", "Mật khẩu phải ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        String confirmPassword = req.getParameter("confirmPassword");
        if (!password.equals(confirmPassword)) {
            req.setAttribute("error", "Mật khẩu xác nhận không khớp");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        if (UserDAO.emailExists(email)) {
            req.setAttribute("error", "Email đã tồn tại");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        boolean ok = UserDAO.register(fullname, email, password);
        if (ok) {
            req.setAttribute("success", "Đăng ký thành công, hãy đăng nhập");
        } else {
            req.setAttribute("error", "Email đã tồn tại");
        }
        req.getRequestDispatcher("signup.jsp").forward(req, resp);
    }
}