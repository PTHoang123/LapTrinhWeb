package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.UserDAO;

public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean ok = UserDAO.register(fullname, email, password);
        if (ok) {
            req.setAttribute("success", "Đăng ký thành công, hãy đăng nhập");
        } else {
            req.setAttribute("error", "Email đã tồn tại");
        }
        req.getRequestDispatcher("signup.jsp").forward(req, resp);
    }
}