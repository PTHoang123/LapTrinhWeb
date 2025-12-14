<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%
String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tin tức | Cyclefy</title>
        <link rel="stylesheet" href="tintuc.css" />
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <div class="logo">
                <img src="<%= ctx %>/assets/logo.png" alt="Cyclefy Logo" />
                <h1>Cyclefy</h1>
            </div>
            <nav>
                <ul class="nav-links">
                    <li><a href="<%= ctx %>/home.jsp">Trang chủ</a></li>
                    <li><a href="<%= ctx %>/gioithieu.jsp">Giới thiệu</a></li>
                    <li>
                        <a href="<%= ctx %>/tintuc.jsp" class="active"
                            >Tin tức</a
                        >
                    </li>
                    <li><a href="<%= ctx %>/sanpham.jsp">Sản phẩm</a></li>
                    <li><a href="<%= ctx %>/checkout.jsp">Thanh toán</a></li>
                </ul>
            </nav>
        </header>

        <!-- Banner -->
        <section class="banner">
            <h2>Tin tức & Bài viết mới nhất</h2>
            <p>Cập nhật xu hướng và thông tin về tái chế, môi trường xanh.</p>
        </section>

        <!-- Tin tức -->
        <section class="news-section" id="news-container">
            <!-- JS sẽ tự động thêm tin tức tại đây -->
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-box">
                <h3>Về chúng tôi</h3>
                <p>
                    Cyclefy – nền tảng mang lại sản phẩm tái chế thân thiện với
                    môi trường.
                </p>
            </div>
            <div class="footer-box">
                <h3>Thông tin liên hệ</h3>
                <p>Địa chỉ: Khu phố 6, Linh Trung, Thủ Đức, TP. HCM</p>
                <p>Email: example@gmail.com</p>
                <p>Điện thoại: 0123 456 789</p>
            </div>
            <div class="footer-box">
                <h3>Đăng ký nhận tin</h3>
                <input
                    type="email"
                    id="emailInput"
                    placeholder="Nhập email của bạn"
                />
                <button onclick="subscribe()">Đăng ký</button>
            </div>
        </footer>

        <script src="tintuc.js"></script>
    </body>
</html>
