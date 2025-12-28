import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.UserDAO;
import model.User;


public class LoginServlet extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {


String email = req.getParameter("email");
String password = req.getParameter("password");


User user = UserDAO.login(email, password);


if (user != null) {
HttpSession session = req.getSession();
session.setAttribute("user", user);
resp.sendRedirect("home.jsp");
} else {
req.setAttribute("error", "Sai email hoặc mật khẩu");
req.getRequestDispatcher("login.jsp").forward(req, resp);
}
}
}