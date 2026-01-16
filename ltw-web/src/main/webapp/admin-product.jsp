<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <% String ctx =
request.getContextPath(); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="<%= ctx %>/css/admin-product.css?v=<%=System.currentTimeMillis()%>"
        />
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
                            <button class="btn btn-primary admin-btn-add" id="btnAddProduct">
                                <i class="ri-add-line"></i>
                                Thêm sản phẩm
                            </button>
                        </div>

                        <div class="modal" id="addProductModal" aria-hidden="true">
                            <div class="modal__dialog" role="dialog" aria-modal="true" aria-labelledby="addProductTitle">
                                <div class="modal__header">
                                    <h3 id="addProductTitle" class="modal__title">Thêm sản phẩm</h3>
                                    <button type="button" class="modal__close" id="btnCloseAdd" aria-label="Close">×</button>
                                </div>
                                <div class="modal__body">
                                    <form  class="admin-form"
                                            method="post"
                                            action="<%= ctx %>/admin/products/add"
                                            enctype="multipart/form-data">
                                        <div class="admin-form__grid">
                                            <div class="admin-form__field">
                                                <label class="admin-form__label">Category ID</label>
                                                <input class="admin-input" name="categoryId" type="number" min="1" required />
                                            </div>

                                            <div class="admin-form__field">
                                                <label class="admin-form__label">Tên sản phẩm</label>
                                                <input class="admin-input" name="name" required />
                                            </div>

                                            <div class="admin-form__field">
                                                <label class="admin-form__label">Slug (optional)</label>
                                                <input class="admin-input" name="slug" placeholder="auto if empty" />
                                            </div>

                                            <div class="admin-form__field admin-form__field--full">
                                                <label class="admin-form__label">Mô tả (optional)</label>
                                                <textarea class="admin-textarea" name="description" rows="4"></textarea>
                                            </div>

                                            <div class="admin-form__field">
                                                <label class="admin-form__label">Giá</label>
                                                <input class="admin-input" name="price" type="number" min="0" step="0.01" required />
                                            </div>

                                            <div class="admin-form__field">
                                                <label class="admin-form__label">Trạng thái</label>
                                                <select class="admin-select" name="status">
                                                    <option value="active">active</option>
                                                    <option value="archived">archived</option>
                                                </select>
                                            </div>

                                            <div class="admin-form__field admin-form__field--full">
                                                <label class="admin-form__label">Image file</label>
                                                <input class="admin-input" type="file" name="imageFile" accept="image/*" />
                                            </div>
                                        </div>
                                    
                                        <div class="modal__footer">
                                            <button type="button" class="btn btn-outline" id="btnCancelAdd">Hủy</button>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="admin-filters">
                        <form method="get" action="<%= ctx %>/admin/products" class="admin-filters__left" style="display:flex; gap:12px; flex-wrap:wrap;">
                            <input
                                type="text"
                                name="q"
                                class="admin-input admin-input--search"
                                placeholder="Tìm theo tên sản phẩm..."
                                value="<c:out value='${q}'/>"
                            />
                            <select class="admin-select" name="sort">
                            <option value="" <c:if test="${empty sort}">selected</c:if>>Mặc định</option>
                            <option value="price_asc" <c:if test="${sort == 'price_asc'}">selected</c:if>>Giá tăng dần</option>
                            <option value="price_desc" <c:if test="${sort == 'price_desc'}">selected</c:if>>Giá giảm dần</option>
                            </select>
                            <button class="btn btn-outline" type="submit">Lọc</button>
                            <a class="btn btn-outline" href="<%= ctx %>/admin/products" style="text-decoration:none;">Làm mới</a>
                        </form>
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
                                <c:if test="${empty products}">
                                    <tr>
                                        <td colspan="8" style="padding:16px;">Không có sản phẩm.</td>
                                    </tr>
                                </c:if>
                            
                                <c:forEach var="p" items="${products}">
                                    <tr>
                                        <td>#<c:out value="${p.id}"/></td>
                                        <td>
                                            <c:choose>
                                              <c:when test="${not empty p.imageUrl}">
                                                <img src="${pageContext.request.contextPath}${p.imageUrl}" alt="<c:out value='${p.name}'/>" class="admin-table__thumb" />
                                              </c:when>
                                              <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/assets/images/no-image.png" alt="No image" />
                                              </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><c:out value="${p.name}"/></td>
                                    

                                        <td>-</td>
                                        <td>
                                            <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/>đ
                                        </td>
                                        <td>-</td>
                                        <td><span class="badge badge-success">Đang bán</span></td>
                                    
                                        <td>
                                            <a class="btn-icon btn-icon--edit" href="<%= ctx %>/admin/product/edit?id=${p.id}">
                                                <i class="ri-edit-2-line"></i>
                                            </a>
                                            <form method="post" action="<%= ctx %>/admin/product/delete" style="display:inline;">
                                                <input type="hidden" name="id" value="${p.id}"/>
                                                <button class="btn-icon btn-icon--danger" type="submit">
                                                    <i class="ri-delete-bin-6-line"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Simple pagination -->
                    <c:if test="${totalPages > 1}">
                            <div class="admin-pagination">
                                <c:choose>
                                    <c:when test="${currentPage > 1}">
                                        <a class="btn btn-outline" href="<%= ctx %>/admin/products?page=${currentPage-1}&q=${q}&sort=${sort}">
                                        <i class="ri-arrow-left-s-line"></i> Trước
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-outline" disabled>
                                            <i class="ri-arrow-left-s-line"></i> Trước
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                                <div class="admin-pagination__pages">
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <a class="page-btn ${i == currentPage ? 'active' : ''}"
                                        href="<%= ctx %>/admin/products?page=${i}&q=${q}&sort=${sort}">
                                        <c:out value="${i}"/>
                                        </a>
                                    </c:forEach>
                                </div>

                                <c:choose>
                                    <c:when test="${currentPage < totalPages}">
                                        <a class="btn btn-outline" href="<%= ctx %>/admin/products?page=${currentPage+1}&q=${q}&sort=${sort}">
                                        Sau <i class="ri-arrow-right-s-line"></i>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-outline" disabled>
                                        Sau <i class="ri-arrow-right-s-line"></i>
                                        </button>
                                    </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>
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
            (function () {
                const modal = document.getElementById('addProductModal');
                const openBtn = document.getElementById('btnAddProduct');
                const closeBtn = document.getElementById('btnCloseAdd');
                const cancelBtn = document.getElementById('btnCancelAdd');

                function open() {
                    if (!modal) return;
                    modal.classList.add('modal--open');
                    modal.setAttribute('aria-hidden', 'false');
                }
            
                function close() {
                    if (!modal) return;
                    modal.classList.remove('modal--open');
                    modal.setAttribute('aria-hidden', 'true');
                }
            
                if (openBtn) openBtn.addEventListener('click', open);
                if (closeBtn) closeBtn.addEventListener('click', close);
                if (cancelBtn) cancelBtn.addEventListener('click', close);
            
                if (modal) {
                    modal.addEventListener('click', function (e) {
                        if (e.target === modal) close();
                    });
                }
            
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape') close();
                });
            })();
        </script>
    </body>
</html>
