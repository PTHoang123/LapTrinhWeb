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
        <title>Giỏ hàng</title>

        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="${ctx}/css/cart.css" />
    </head>
    <body>
        <!-- HEADER -->
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

        <!-- GIỎ HÀNG -->

        <c:set var="cart" value="${sessionScope.CART}" />

        <main class="cart-page">
            <div class="container">
                <h2 class="cart-title">Giỏ hàng</h2>

                <div class="cart-surface">
                    <c:set var="cart" value="${sessionScope.CART}" />

                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>

                        <tbody id="cart-body">
                            <c:if test="${empty cart or empty cart.items}">
                                <tr>
                                    <td class="cart-empty" colspan="6">
                                        Giỏ hàng trống
                                    </td>
                                </tr>
                            </c:if>

                            <c:if
                                test="${not empty cart and not empty cart.items}"
                            >
                                <c:forEach var="it" items="${cart.items}">
                                    <tr>
                                        <td class="cell-img">
                                            <c:choose>
                                                <c:when
                                                    test="${not empty it.imageUrl}"
                                                >
                                                    <img
                                                        src="${ctx}/${it.imageUrl}"
                                                        alt="<c:out value='${it.name}'/>"
                                                    />
                                                </c:when>
                                                <c:otherwise>
                                                    <img
                                                        src="${ctx}/assets/placeholder.png"
                                                        alt="No image"
                                                    />
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="cell-name">
                                            <c:out value="${it.name}" />
                                        </td>

                                        <td class="cell-price">
                                            <fmt:formatNumber
                                                value="${it.price}"
                                                type="number"
                                                maxFractionDigits="0"
                                            />
                                            VND
                                        </td>

                                        <td class="cell-qty">
                                            <c:out value="${it.quantity}" />
                                        </td>

                                        <td class="cell-total">
                                            <fmt:formatNumber
                                                value="${it.lineTotal}"
                                                type="number"
                                                maxFractionDigits="0"
                                            />
                                            VND
                                        </td>

                                        <td class="cell-actions">
                                            <a
                                                class="btn btn-danger"
                                                href="${ctx}/cart/remove?productId=${it.id}"
                                                >Xoá</a
                                            >
                                            <a href="">cập nhật</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>

                    <div class="cart-summary">
                        <h3>
                            Tổng cộng:
                            <span class="amount">
                                <c:choose>
                                    <c:when test="${not empty cart}">
                                        <fmt:formatNumber
                                            value="${cart.totalAmount}"
                                            type="number"
                                            maxFractionDigits="0"
                                        />
                                        VND
                                    </c:when>
                                    <c:otherwise>0 VND</c:otherwise>
                                </c:choose>
                            </span>
                        </h3>

                        <div class="cart-actions">
                            <a class="btn btn-danger" href="${ctx}/cart/clear"
                                >Xoá tất cả</a
                            >
                            <a class="btn btn-primary" href="${ctx}/checkout"
                                >Thanh toán</a
                            >
                            <a class="btn btn-ghost" href="${ctx}/products"
                                >Tiếp tục mua</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- FOOTER -->
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

        <script src="cart.js"></script>
    </body>
</html>
