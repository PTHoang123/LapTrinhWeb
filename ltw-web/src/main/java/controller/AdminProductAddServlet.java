package controller;

import dao.AdminProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 10 * 1024 * 1024,       // 10MB
        maxRequestSize = 20 * 1024 * 1024     // 20MB
)
public class AdminProductAddServlet extends HttpServlet {

    private final AdminProductDAO adminProductDAO = new AdminProductDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String name = trim(req.getParameter("name"));
        String slug = trim(req.getParameter("slug"));
        String description = trim(req.getParameter("description"));
        String priceStr = trim(req.getParameter("price"));
        String categoryIdStr = trim(req.getParameter("categoryId"));
        String status = trim(req.getParameter("status"));

        if (name == null || name.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/products?err=Name%20is%20required");
            return;
        }

        int categoryId;
        try {
            categoryId = Integer.parseInt(categoryIdStr);
            if (categoryId <= 0) throw new NumberFormatException();
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/admin/products?err=Category%20ID%20is%20required");
            return;
        }

        BigDecimal price;
        try {
            price = new BigDecimal(priceStr);
            if (price.compareTo(BigDecimal.ZERO) < 0) throw new NumberFormatException();
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/admin/products?err=Invalid%20price");
            return;
        }

        if (status == null || status.isEmpty()) status = "active";
        if (!status.equals("active") && !status.equals("archived")) status = "active";

        if (slug == null || slug.isBlank()) slug = toSlug(name);

        // Save uploaded file (optional) and store its relative URL
        String savedImagePath = null; // ex: /uploads/products/uuid.png
        Part imagePart = req.getPart("imageFile");
        if (imagePart != null && imagePart.getSize() > 0) {
            String submitted = getSubmittedFileName(imagePart);
            String ext = extensionOf(submitted);

            if (!isAllowedImageExt(ext)) {
                resp.sendRedirect(req.getContextPath() + "/admin/products?err=Only%20jpg%20png%20gif%20webp%20allowed");
                return;
            }

            String fileName = UUID.randomUUID().toString().replace("-", "") + ext;

            // Real path inside deployed webapp
            String uploadsDir = req.getServletContext().getRealPath("/uploads/products");
            if (uploadsDir == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/products?err=Upload%20path%20not%20available");
                return;
            }

            Path dir = Paths.get(uploadsDir);
            Files.createDirectories(dir);

            Path dest = dir.resolve(fileName);
            try (InputStream in = imagePart.getInputStream()) {
                Files.copy(in, dest);
            }

            savedImagePath = "/uploads/products/" + fileName;
        }

        try {
            int newId = adminProductDAO.insertProduct(categoryId, name, slug, description, price, status, savedImagePath);
            resp.sendRedirect(req.getContextPath() + "/admin/products?ok=Created%20product%20ID%20" + newId);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/admin/products?err=Add%20failed");
        }
    }

    private static String trim(String s) { return s == null ? null : s.trim(); }

    private static String toSlug(String s) {
        String x = s == null ? "" : s.trim().toLowerCase();
        x = x.replaceAll("[^a-z0-9\\s-]", "");
        x = x.replaceAll("\\s+", "-");
        x = x.replaceAll("-{2,}", "-");
        if (x.isEmpty()) x = "product";
        return x;
    }

    private static String getSubmittedFileName(Part part) {
        String cd = part.getHeader("content-disposition");
        if (cd == null) return null;
        for (String token : cd.split(";")) {
            token = token.trim();
            if (token.startsWith("filename=")) {
                String fn = token.substring("filename=".length()).trim().replace("\"", "");
                return fn;
            }
        }
        return null;
    }

    private static String extensionOf(String filename) {
        if (filename == null) return "";
        int dot = filename.lastIndexOf('.');
        if (dot < 0) return "";
        return filename.substring(dot).toLowerCase(); // includes "."
    }

    private static boolean isAllowedImageExt(String ext) {
        return ext.equals(".jpg") || ext.equals(".jpeg") || ext.equals(".png") || ext.equals(".gif") || ext.equals(".webp");
    }
}