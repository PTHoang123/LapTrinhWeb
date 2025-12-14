<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%
String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./css/admin-order.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
            rel="stylesheet"
        />
        <title>Foodyfi</title>
    </head>
    <body>
        <!-- header -->
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
                            <a href="<%= ctx %>/home.jsp" class="menu__item active__menu"
                                >Trang chủ</a
                            >
                            <a href="/about" class="menu__item">Giới thiệu</a>
                            <a href="/news" class="menu__item">Tin tức</a>
                            <a href="<%= ctx %>/product.jsp" class="menu__item"
                                >Sản phẩm</a
                            >
                            <a href="/cart" class="menu__item">Giỏ hàng</a>
                            <a href="<%= ctx %>//checkout.jsp" class="menu__item"
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

        <main class="admin-page">
            <div class="container">
                <div class="admin-card">
                    <div class="admin-card__header">
                        <div>
                            <h2>Quản lý đơn hàng</h2>
                            <p class="admin-card__subtitle">
                                Xem chi tiết, lọc theo trạng thái và cập nhật
                                đơn hàng của khách.
                            </p>
                        </div>
                    </div>

                    <div class="admin-filters">
                        <div class="admin-filters__left">
                            <input
                                type="text"
                                class="admin-input admin-input--search"
                                placeholder="Tìm theo mã đơn / tên khách..."
                            />
                            <select class="admin-select">
                                <option value="">Tất cả trạng thái</option>
                                <option value="pending">Chờ xác nhận</option>
                                <option value="processing">Đang xử lý</option>
                                <option value="shipping">Đang giao</option>
                                <option value="completed">Hoàn thành</option>
                                <option value="cancelled">Đã hủy</option>
                            </select>
                            <select class="admin-select">
                                <option value="">Thời gian</option>
                                <option>Hôm nay</option>
                                <option>7 ngày gần đây</option>
                                <option>30 ngày gần đây</option>
                            </select>
                        </div>
                        <div class="admin-filters__right">
                            <button class="btn btn-outline">Làm mới</button>
                        </div>
                    </div>

                    <div class="admin-table-wrapper">
                        <table class="admin-table admin-table--orders">
                            <thead>
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Khách hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Ngày đặt</th>
                                    <th>Tổng tiền</th>
                                    <th>Phương thức</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#DH00125</td>
                                    <td>Nguyễn Văn A</td>
                                    <td>0901 234 567</td>
                                    <td>27/11/2025</td>
                                    <td>850.000đ</td>
                                    <td>COD</td>
                                    <td>
                                        <span class="badge badge-warning"
                                            >Chờ xác nhận</span
                                        >
                                    </td>
                                    <td>
                                        <button
                                            class="btn-icon btn-icon--edit"
                                            title="Xem / cập nhật"
                                        >
                                            <i class="ri-eye-line"></i>
                                        </button>
                                        <button
                                            class="btn-icon btn-icon--danger"
                                            title="Hủy đơn"
                                        >
                                            <i class="ri-close-circle-line"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#DH00124</td>
                                    <td>Trần Thị B</td>
                                    <td>0987 654 321</td>
                                    <td>26/11/2025</td>
                                    <td>420.000đ</td>
                                    <td>Chuyển khoản</td>
                                    <td>
                                        <span class="badge badge-info"
                                            >Đang giao</span
                                        >
                                    </td>
                                    <td>
                                        <button
                                            class="btn-icon btn-icon--edit"
                                            title="Xem / cập nhật"
                                        >
                                            <i class="ri-eye-line"></i>
                                        </button>
                                        <button
                                            class="btn-icon btn-icon--danger"
                                            title="Hủy đơn"
                                        >
                                            <i class="ri-close-circle-line"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#DH00123</td>
                                    <td>Lê Văn C</td>
                                    <td>0912 345 678</td>
                                    <td>25/11/2025</td>
                                    <td>1.250.000đ</td>
                                    <td>COD</td>
                                    <td>
                                        <span class="badge badge-success"
                                            >Hoàn thành</span
                                        >
                                    </td>
                                    <td>
                                        <button
                                            class="btn-icon btn-icon--edit"
                                            title="Xem chi tiết"
                                        >
                                            <i class="ri-eye-line"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#DH00122</td>
                                    <td>Phạm D</td>
                                    <td>0933 222 111</td>
                                    <td>24/11/2025</td>
                                    <td>310.000đ</td>
                                    <td>Chuyển khoản</td>
                                    <td>
                                        <span class="badge badge-danger"
                                            >Đã hủy</span
                                        >
                                    </td>
                                    <td>
                                        <button
                                            class="btn-icon btn-icon--edit"
                                            title="Xem lý do"
                                        >
                                            <i class="ri-eye-line"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="admin-pagination">
                        <button class="btn btn-outline" disabled>
                            <i class="ri-arrow-left-s-line"></i>
                            Trước
                        </button>
                        <div class="admin-pagination__pages">
                            <button class="page-btn active">1</button>
                            <button class="page-btn">2</button>
                            <button class="page-btn">3</button>
                        </div>
                        <button class="btn btn-outline">
                            Sau
                            <i class="ri-arrow-right-s-line"></i>
                        </button>
                    </div>
                </div>
            </div>
        </main>

        <!-- footer -->
        <footer class="footer">
            <div class="footer__logo">
                <h5>Về chúng tôi</h5>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Nesciunt pariatur accusamus
                </p>
            </div>

            <div class="footer__col">
                <h5 class="footer__title">Thời gian hoạt động</h5>
                <div class="deliver__time-list">
                    <div class="delivery__time-item">
                        <span>Sunday - Thursday</span>
                        <p>8:00am - 5:00pm</p>
                    </div>
                    <div class="delivery__time-item">
                        <span>Friday - Saturday</span>
                        <p>8:00am - 2:00pm</p>
                    </div>
                </div>
            </div>

            <div class="footer__col">
                <h5 class="footer__title">Thông tin liên hệ</h5>
                <div class="deliver__time-list">
                    <div class="delivery__time-item">
                        <p>
                            địa chỉ 1: Khu phố 6, Phường Linh Trung, TP Thủ Đức
                            ,TP. Hồ Chí Minh
                        </p>
                    </div>
                    <div class="delivery__time-item">
                        <p>
                            địa chỉ 2: Khoa công nghệ thông tin, Đại Học Nông
                            Lâm TP.HCM.
                        </p>
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
