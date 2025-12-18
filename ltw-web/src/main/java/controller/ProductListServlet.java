package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// Remove @WebServlet("/products") because web.xml already maps it
public class ProductListServlet extends HttpServlet {

    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int pageSize = 12;

        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try { page = Integer.parseInt(pageParam); } catch (NumberFormatException ignored) {}
        }

        int totalProducts = productDAO.getTotalProducts();
        System.out.println("[ProductListServlet] totalProducts=" + totalProducts);

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        List<Product> products = productDAO.getProducts(page, pageSize);
        System.out.println("[ProductListServlet] products.size=" + (products == null ? "null" : products.size()));

        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}