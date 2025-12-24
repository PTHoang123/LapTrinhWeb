<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%
String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./css/admin-user.css" />
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
                            <a
                                href="<%= ctx %>/home.jsp"
                                class="menu__item active__menu"
                                >Trang chủ</a
                            >
                            <a href="/about" class="menu__item">Giới thiệu</a>
                            <a href="/news" class="menu__item">Tin tức</a>
                            <a href="<%= ctx %>/product.jsp" class="menu__item"
                                >Sản phẩm</a
                            >
                            <a href="/cart" class="menu__item">Giỏ hàng</a>
                            <a
                                href="<%= ctx %>//checkout.jsp"
                                class="menu__item"
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
                            <h2>Quản lý sản phẩm</h2>
                            <p class="admin-card__subtitle">
                                Xem, tìm kiếm, thêm mới và chỉnh sửa sản phẩm.
                            </p>
                        </div>
                        <div class="admin-card__actions">
                            <button class="btn btn-primary admin-btn-add">
                                Best seller
                            </button>
                            <button class="btn btn-primary admin-btn-add">
                                Tổng doanh thu
                            </button>
                            <button class="btn btn-primary admin-btn-add">
                                <i class="ri-add-line"></i>
                                Thêm sản phẩm
                            </button>
                        </div>
                    </div>
                    <div class="admin-filters">
                        <div class="admin-filters__left">
                            <input
                                type="text"
                                class="admin-input admin-input--search"
                                placeholder="Tìm theo tên sản phẩm..."
                            />
                            <select class="admin-select">
                                <option value="">Tất cả danh mục</option>
                                <option>Phân bón hữu cơ</option>
                                <option>Dụng cụ làm vườn</option>
                                <option>Hạt giống</option>
                            </select>
                            <select class="admin-select">
                                <option value="">Tất cả trạng thái</option>
                                <option value="active">Đang bán</option>
                                <option value="hidden">Ẩn</option>
                                <option value="out">Hết hàng</option>
                            </select>
                        </div>
                        <div class="admin-filters__right">
                            <button class="btn btn-outline">Làm mới</button>
                        </div>
                    </div>
                    <div class="admin-table-wrapper">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Danh mục</th>
                                    <th>Giá</th>
                                    <th>Tồn kho</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#101</td>
                                    <td>
                                        <img
                                            src="<%= ctx %>/assets/product1.png"
                                            alt="Product"
                                            class="admin-table__thumb"
                                        />
                                    </td>
                                    <td>Phân bón hữu cơ cao cấp</td>
                                    <td>Phân bón hữu cơ</td>
                                    <td>250.000đ</td>
                                    <td>120</td>
                                    <td>
                                        <span class="badge badge-success"
                                            >Đang bán</span
                                        >
                                    </td>
                                    <td>
                                        <button class="btn-icon btn-icon--edit">
                                            <i class="ri-edit-2-line"></i>
                                        </button>
                                        <button
                                            class="btn-icon btn-icon--danger"
                                        >
                                            <i class="ri-delete-bin-6-line"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#102</td>
                                    <td>
                                        <img
                                            src="<%= ctx %>/assets/product2.png"
                                            alt="Product"
                                            class="admin-table__thumb"
                                        />
                                    </td>
                                    <td>Bút chì tái chế</td>
                                    <td>Dụng cụ học tập</td>
                                    <td>180.000đ</td>
                                    <td>36</td>
                                    <td>
                                        <span class="badge badge-warning"
                                            >Hết hàng</span
                                        >
                                    </td>
                                    <td>
                                        <button class="btn-icon btn-icon--edit">
                                            <i class="ri-edit-2-line"></i>
                                        </button>
                                        <button
                                            class="btn-icon btn-icon--danger"
                                        >
                                            <i class="ri-delete-bin-6-line"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#103</td>
                                    <td>
                                        <img
                                            src="<%= ctx %>/assets/product1.png"
                                            alt="Product"
                                            class="admin-table__thumb"
                                        />
                                    </td>
                                    <td>Cờ nút nhựa tái chế</td>
                                    <td>Đồ dùng trang trí</td>
                                    <td>35.000đ</td>
                                    <td>250</td>
                                    <td>
                                        <span class="badge badge-secondary"
                                            >Đang ẩn</span
                                        >
                                    </td>
                                    <td>
                                        <button class="btn-icon btn-icon--edit">
                                            <i class="ri-edit-2-line"></i>
                                        </button>
                                        <button
                                            class="btn-icon btn-icon--danger"
                                        >
                                            <i class="ri-delete-bin-6-line"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Simple pagination -->
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
