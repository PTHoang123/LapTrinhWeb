<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <title>Products</title>
  <link rel="stylesheet" href="${ctx}/css/product.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.5.0/remixicon.min.css"/>
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
          <a href="${ctx}/home.jsp" class="menu__item active__menu">Trang chủ</a>
          <a href="${ctx}/about.jsp" class="menu__item">Giới thiệu</a>
          <a href="${ctx}/news.jsp" class="menu__item">Tin tức</a>
          <a href="${ctx}/categories.jsp" class="menu__item">Danh mục</a>
          <a href="${ctx}/product.jsp" class="menu__item">Sản phẩm</a>
          <a href="${ctx}/cart.jsp" class="menu__item">Giỏ hàng</a>
          <a href="${ctx}/checkout.jsp" class="menu__item">Thanh toán</a>
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

<main class="page">
  <div class="container">

    <!-- Filters -->
    <div class="product-filters">
      <div class="product-filters-left">
        <form method="get" action="${ctx}/products" style="display:flex; gap:12px; flex-wrap:wrap;">
          <input
            class="product-search-input"
            type="text"
            name="q"
            value="<c:out value='${param.q}'/>"
            placeholder="Search products..."
          />

          <select class="product-select" name="sort">
            <option value="" <c:if test="${empty param.sort}">selected</c:if>>Sort: Default</option>
            <option value="new" <c:if test="${param.sort == 'new'}">selected</c:if>>Newest</option>
            <option value="price_asc" <c:if test="${param.sort == 'price_asc'}">selected</c:if>>Price: Low → High</option>
            <option value="price_desc" <c:if test="${param.sort == 'price_desc'}">selected</c:if>>Price: High → Low</option>
          </select>

          <button class="order__btn" type="submit" style="border:none;">Apply</button>
        </form>
      </div>

      <div class="product-filters-right">
        <span style="color:var(--muted); font-weight:700;">
          Page <c:out value="${currentPage}" /> / <c:out value="${totalPages}" />
        </span>
      </div>
    </div>

    <!-- Products -->
    <div class="product-grid">
      <c:forEach var="p" items="${products}">
        <div class="product-card">
          <a href="${ctx}/product.jsp?id=${p.id}">
            <c:choose>
              <c:when test="${not empty p.imageUrl}">
                <img src="${ctx}/${p.imageUrl}" alt="<c:out value='${p.name}'/>" />
              </c:when>
              <c:otherwise>
                <img src="${ctx}/assets/placeholder.png" alt="No image" />
              </c:otherwise>
            </c:choose>

            <h3><c:out value="${p.name}" /></h3>
            <p class="price"><c:out value="${p.price}" /></p>
          </a>

          <div style="padding: 0 14px 14px;">
            <form method="post" action="${ctx}/cart/add" style="display:inline;">
              <input type="hidden" name="productId" value="${p.id}" />
              <button type="submit" class="order__btn">Add to cart</button>
            </form>
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- Pagination -->
  <c:if test="${totalPages > 1}">
    <div class="pagination">

    <!-- Prev -->
    <c:choose>
      <c:when test="${currentPage > 1}">
        <a href="${ctx}/products?page=${currentPage - 1}&q=${param.q}&sort=${param.sort}">Prev</a>
      </c:when>
      <c:otherwise>
        <span class="disabled">Prev</span>
      </c:otherwise>
    </c:choose>

    <!-- Windowed page links -->
    <c:set var="start" value="${currentPage - 2}" />
    <c:set var="end" value="${currentPage + 2}" />

    <c:if test="${start < 1}">
      <c:set var="start" value="1" />
    </c:if>
    <c:if test="${end > totalPages}">
      <c:set var="end" value="${totalPages}" />
    </c:if>

    <!-- First page + left dots -->
    <c:if test="${start > 1}">
      <a href="${ctx}/products?page=1&q=${param.q}&sort=${param.sort}">1</a>
      <c:if test="${start > 2}">
        <span class="dots">…</span>
      </c:if>
    </c:if>

    <!-- Page numbers (safe active class) -->
    <c:forEach var="i" begin="${start}" end="${end}">
      <c:choose>
        <c:when test="${i == currentPage}">
          <a href="${ctx}/products?page=${i}&q=${param.q}&sort=${param.sort}" class="active">
            <c:out value="${i}" />
          </a>
        </c:when>
        <c:otherwise>
          <a href="${ctx}/products?page=${i}&q=${param.q}&sort=${param.sort}">
            <c:out value="${i}" />
          </a>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <!-- Right dots + last page -->
    <c:if test="${end < totalPages}">
      <c:if test="${end < totalPages - 1}">
        <span class="dots">…</span>
      </c:if>
      <a href="${ctx}/products?page=${totalPages}&q=${param.q}&sort=${param.sort}">
        <c:out value="${totalPages}" />
      </a>
    </c:if>

    <!-- Next -->
    <c:choose>
      <c:when test="${currentPage < totalPages}">
        <a href="${ctx}/products?page=${currentPage + 1}&q=${param.q}&sort=${param.sort}">Next</a>
      </c:when>
      <c:otherwise>
        <span class="disabled">Next</span>
      </c:otherwise>
    </c:choose>

    </div>
  </c:if>

  </div>
</main>

<!-- Footer -->
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
  window.addEventListener('scroll', function () {
    const header = document.querySelector('.header');
    if (!header) return;
    if (window.scrollY > 60) header.classList.add('header__shrink');
    else header.classList.remove('header__shrink');
  });
</script>

</body>
</html>