package controller;

import dao.ProductDAO;
import model.Cart;
import model.CartItem;
import model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class CartAddServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId;
        int quantity = 1;

        try {
            productId = Integer.parseInt(request.getParameter("productId"));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing/invalid productId");
            return;
        }

        String qtyParam = request.getParameter("quantity");
        if (qtyParam != null && !qtyParam.isBlank()) {
            try { quantity = Integer.parseInt(qtyParam); } catch (Exception ignored) {}
        }
        if (quantity <= 0) quantity = 1;

        Product p = productDAO.getProductById(productId);
        if (p == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            return;
        }

        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("CART");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("CART", cart);
        }

        cart.add(new CartItem(p.getId(), p.getName(), p.getPrice(), p.getImageUrl(), quantity));

        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isBlank()) response.sendRedirect(referer);
        else response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}