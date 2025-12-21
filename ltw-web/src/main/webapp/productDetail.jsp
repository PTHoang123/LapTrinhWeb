<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<fmt:setLocale value="vi_VN" />

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><c:out value="${product.name}" /></title>

        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="${ctx}/css/productDetail.css" />
    </head>

    <body>
        <header class="header">
            <div class="container">
                <div class="nav__wrapper">
                    <div class="logo">
                        <img
                            class="logo-img"
                            src="${ctx}/assets/—Pngtree—green sprout leaf logo design_7431531.png"
                            alt="logo"
                        />
                        <h5>Cyclefy</h5>
                    </div>

                    <div class="navigation">
                        <div class="menu">
                            <a
                                href="${ctx}/home.jsp"
                                class="menu__item active__menu"
                                >Trang chủ</a
                            >
                            <a href="${ctx}/about.jsp" class="menu__item"
                                >Giới thiệu</a
                            >
                            <a href="${ctx}/news.jsp" class="menu__item"
                                >Tin tức</a
                            >
                            <a href="${ctx}/categories.jsp" class="menu__item"
                                >Danh mục</a
                            >
                            <a href="${ctx}/product.jsp" class="menu__item"
                                >Sản phẩm</a
                            >
                            <a href="${ctx}/cart.jsp" class="menu__item"
                                >Giỏ hàng</a
                            >
                            <a href="${ctx}/checkout.jsp" class="menu__item"
                                >Thanh toán</a
                            >
                            <a href="${ctx}/faq.jsp" class="menu__item">FAQ</a>
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

        <main class="body">
            <div class="container">
                <c:if test="${empty product}">
                    <h2>Không tìm thấy sản phẩm</h2>
                    <p><a href="${ctx}/products">Quay lại danh sách</a></p>
                </c:if>

                <c:if test="${not empty product}">
                    <div class="body">
                        <div class="product-img">
                            <c:choose>
                                <c:when test="${not empty product.imageUrl}">
                                    <img
                                        class="product-img__img"
                                        src="${ctx}/${product.imageUrl}"
                                        alt="<c:out value='${product.name}'/>"
                                    />
                                </c:when>
                                <c:otherwise>
                                    <img
                                        class="product-img__img"
                                        src="${ctx}/assets/placeholder.png"
                                        alt="No image"
                                    />
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="product-detail">
                            <div class="product-title">
                                <h2><c:out value="${product.name}" /></h2>

                                <p>
                                    Giá:
                                    <fmt:formatNumber
                                        value="${product.price}"
                                        type="number"
                                        maxFractionDigits="0"
                                    />
                                    VND
                                </p>

                                <p>
                                    Mô tả:
                                    <c:out value="${product.description}" />
                                </p>
                            </div>

                            <form method="post" action="${ctx}/cart/add">
                                <input
                                    type="hidden"
                                    name="productId"
                                    value="${product.id}"
                                />

                                <div class="quantity-section">
                                    <label for="quantity">Số lượng:</label>
                                    <input
                                        id="quantity"
                                        name="quantity"
                                        class="quantity-input"
                                        type="number"
                                        min="1"
                                        value="1"
                                    />
                                </div>

                                <button class="order__btn" type="submit">
                                    Thêm vào giỏ hàng
                                </button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>

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
                    if (!header) return;
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
