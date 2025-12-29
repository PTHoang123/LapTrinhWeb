<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%
String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Dịch vụ | Cyclefy</title>

        <!-- CSS chung từ home -->
        <link rel="stylesheet" href="./css/home.css" />

        <!-- CSS riêng cho dịch vụ -->
        <link rel="stylesheet" href="dichvu.css" />

        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
            rel="stylesheet"
        />
    </head>

    <body>
        <header class="header">
            <div class="container">
                <div class="nav__wrapper">
                    <div class="logo">
                        <img
                            class="logo-img"
                            src="<%= ctx %>/assets/—Pngtree—green sprout leaf logo design_7431531.png"
                            alt="logo"
                        />
                        <h5>Cyclefy</h5>
                    </div>

                    <div class="navigation">
                        <div class="menu">
                            <a href="<%= ctx %>/home.jsp" class="menu__item">Trang chủ</a>
                            <a href="<%= ctx %>/about.jsp" class="menu__item"
                                >Giới thiệu</a
                            >
                            <a href="<%= ctx %>/tintuc.jsp" class="menu__item">Tin tức</a>
                            <a href="<%= ctx %>/product.jsp" class="menu__item"
                                >Sản phẩm</a
                            >
                            <a href="/cart" class="menu__item">Giỏ hàng</a>
                            <a href="<%= ctx %>/checkout.jsp" class="menu__item"
                                >Thanh toán</a
                            >
                        </div>
                    </div>

                    <div class="nav__right">
                        <span class="cart__icon">
                            <i class="ri-shopping-cart-fill"></i>
                            <span class="cart__badge">1</span>
                        </span>
                        <span class="user">
                            <i class="ri-user-fill"></i>
                        </span>
                    </div>
                </div>
            </div>
        </header>

        <!-- ================= NỘI DUNG DỊCH VỤ ================= -->
        <section class="service-section">
            <div class="container service-content">
                <div class="service-text">
                    <h1>Dịch vụ Thu Gom & Tái Chế Tại Nhà</h1>
                    <p>
                        Cyclefy cung cấp dịch vụ thu gom rác tái chế tận nơi —
                        giúp bạn dễ dàng bảo vệ môi trường chỉ với một thao tác
                        đặt lịch. Chúng tôi tiếp nhận:
                    </p>

                    <ul>
                        <li>
                            ♻ Nhựa PET, HDPE, PP và các loại nhựa tái chế được
                        </li>
                        <li>📄 Giấy, carton, sách cũ, tài liệu</li>
                        <li>🥫 Nhôm – lon – kim loại</li>
                        <li>
                            🔧 Đồ cũ có thể tái sử dụng (bàn ghế, túi, hộp
                            nhựa…)
                        </li>
                    </ul>

                    <p>
                        Chỉ cần đặt lịch, nhân viên sẽ tới tận nơi thu gom –
                        phân loại – vận chuyển đến nhà máy tái chế. Tiết kiệm
                        thời gian, thân thiện với môi trường.
                    </p>

                    <a href="#" class="service-btn">Đặt lịch ngay</a>
                </div>

                <!-- Hình minh hoạ -->
                <div class="service-img">
                    <img src="<%= ctx %>/assets/recycle-service.jpg" alt="service" />
                </div>
            </div>
        </section>

        <footer class="footer">
            <div class="footer__logo">
                <h5>Về chúng tôi</h5>
                <p>
                    Cyclefy – nền tảng mang lại sản phẩm tái chế thân thiện với
                    môi trường.
                </p>
            </div>

            <div class="footer__col">
                <h5 class="footer__title">Thời gian hoạt động</h5>
                <div class="deliver__time-list">
                    <div class="delivery__time-item">
                        <span>Chủ nhật - Thứ năm</span>
                        <p>8:00 - 17:00</p>
                    </div>
                    <div class="delivery__time-item">
                        <span>Thứ sáu - Thứ bảy</span>
                        <p>8:00 - 14:00</p>
                    </div>
                </div>
            </div>

            <div class="footer__col">
                <h5 class="footer__title">Thông tin liên hệ</h5>
                <div class="deliver__time-list">
                    <div class="delivery__time-item">
                        <p>
                            Địa chỉ 1: Khu phố 6, Phường Linh Trung, TP Thủ Đức,
                            TP.HCM
                        </p>
                    </div>
                    <div class="delivery__time-item">
                        <p>Địa chỉ 2: Khoa CNTT, Đại học Nông Lâm TP.HCM</p>
                    </div>
                    <div class="delivery__time-item">
                        <span>Phone: 0123456789</span>
                    </div>
                    <div class="delivery__time-item">
                        <span>Email: example@gmail.com</span>
                    </div>
                </div>
            </div>

            <div class="footer__col">
                <h5 class="footer__title">Đăng ký</h5>
                <div class="delivery__time-item">
                    <p>Đăng ký để nhận thông tin mới nhất.</p>
                </div>
                <div class="newsletter">
                    <input type="email" placeholder="Nhập email của bạn" />
                    <span><i class="ri-send-plane-line"></i></span>
                </div>
            </div>
        </footer>
    </body>
</html>
