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