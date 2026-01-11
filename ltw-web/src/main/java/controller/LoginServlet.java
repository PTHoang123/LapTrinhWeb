package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.UserDAO;
import model.User;



public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

protected void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {

String email = req.getParameter("email");
String password = req.getParameter("password");

User u = UserDAO.login(email, password);

if (u!=null) {
HttpSession session = req.getSession();
session.setAttribute("user", u);
resp.sendRedirect("home.jsp");
} else {
req.setAttribute("error", "Sai email hoặc mật khẩu");
req.getRequestDispatcher("login.jsp").forward(req, resp);
}
}
}