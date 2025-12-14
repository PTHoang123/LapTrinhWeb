<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%
String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./css/home.css" />
        <link rel="stylesheet" href="./css/baibao.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
            rel="stylesheet"
        />
        <title>Tái chế nhựa – xu hướng sống xanh năm 2025 | Cyclefy</title>
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
                            <a
                                href="<%= ctx %>/tintuc.jsp"
                                class="menu__item active__menu"
                                >Tin tức</a
                            >
                            <a href="<%= ctx %>/product.jsp" class="menu__item"
                                >Sản phẩm</a
                            >
                            <a href="<%= ctx %>/cart.jsp" class="menu__item">Giỏ hàng</a>
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

        <!-- ================= NỘI DUNG BÀI BÁO ================= -->
        <section class="article-container container">
            <h2 class="article-title">
                Tái chế nhựa – xu hướng sống xanh năm 2025
            </h2>
            <p class="article-date">Đăng ngày: 15/11/2025</p>

            <img
                src="<%= ctx %>/assets/news1.jpg"
                class="article-img"
                alt="Tái chế nhựa"
            />

            <p>
                Trong năm 2025, việc tái chế nhựa tiếp tục trở thành một xu
                hướng sống xanh được đông đảo người dân lựa chọn. Sau nhiều năm
                chứng kiến lượng rác thải nhựa tăng mạnh, ý thức bảo vệ môi
                trường đã chuyển từ nhận thức sang hành động thực tế.
            </p>

            <p>
                Các tổ chức môi trường, doanh nghiệp và cộng đồng xanh đang thúc
                đẩy mạnh mẽ mô hình “3R – Reduce, Reuse, Recycle”. Không chỉ
                dừng lại ở các chai và bao bì nhựa, nhiều sản phẩm được tái sinh
                thành đồ gia dụng, nội thất, thậm chí thời trang thân thiện với
                môi trường.
            </p>

            <img
                src="<%= ctx %>/assets/recycle2.jpg"
                class="article-img"
                alt="Nhựa tái chế"
            />

            <p>
                Nhờ công nghệ tái chế hiện đại, nhựa phế thải có thể được biến
                thành nguyên liệu mới với chất lượng không kém gì nhựa nguyên
                sinh. Điều này giúp giảm đáng kể áp lực lên hệ thống xử lý rác
                và hạn chế ô nhiễm tại các bãi chôn lấp.
            </p>

            <p>
                Cyclefy tự hào đồng hành trong hành trình xanh hóa môi trường
                bằng việc cung cấp các sản phẩm tái chế chất lượng, bền đẹp và
                có giá trị sử dụng lâu dài. Chúng tôi tin rằng sự thay đổi nhỏ
                từ mỗi cá nhân sẽ tạo ra tác động lớn cho tương lai.
            </p>

            <a href="<%= ctx %>/tintuc.jsp" class="back-btn">← Quay lại trang Tin tức</a>
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

        <script>
            (function () {
                const header = document.querySelector(".header");
                const onScroll = () => {
                    if (window.scrollY > 80)
                        header.classList.add("header__shrink");
                    else header.classList.remove("header__shrink");
                };
                window.addEventListener("scroll", onScroll);
                onScroll();
            })();
        </script>
    </body>
</html>
