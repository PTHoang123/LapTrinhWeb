package controller;

import model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class CartRemoveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId;
        try {
            productId = Integer.parseInt(request.getParameter("productId"));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing/invalid productId");
            return;
        }

        HttpSession session = request.getSession(false);
        if (session != null) {
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) cart.remove(productId);
        }

        String referer = request.getHeader("Referer");
        response.sendRedirect(referer != null ? referer : request.getContextPath() + "/cart.jsp");
    }
}