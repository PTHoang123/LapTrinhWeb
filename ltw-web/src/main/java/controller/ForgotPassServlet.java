import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.UserDAO;

public class ForgotPassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String newPass = req.getParameter("newPassword");

        boolean ok = UserDAO.updatePassword(email, newPass);
        if (ok) {
            req.setAttribute("success", "Đổi mật khẩu thành công");
        } else {
            req.setAttribute("error", "Email không tồn tại");
        }
        req.getRequestDispatcher("forgotpass.jsp").forward(req, resp);
    }
}