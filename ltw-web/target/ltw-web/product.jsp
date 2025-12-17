<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%
String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="<%= ctx %>/css/product.css" />
        <script src="<%= ctx %>/js/cart.js" defer></script>

        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
            rel="stylesheet"
        />
        <title>Sản phẩm | Cyclefy</title>
    </head>

    <body>
        <!-- Header -->
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
                            <a href="<%= ctx %>/home.jsp" class="menu__item"
                                >Trang chủ</a
                            >
                            <a href="<%= ctx %>/about.jsp" class="menu__item"
                                >Giới thiệu</a
                            >
                            <a href="<%= ctx %>/news.jsp" class="menu__item"
                                >Tin tức</a
                            >
                            <a
                                href="<%= ctx %>/categories.jsp"
                                class="menu__item"
                                >Danh mục</a
                            >
                            <a
                                href="<%= ctx %>/product.jsp"
                                class="menu__item active__menu"
                                >Sản phẩm</a
                            >
                            <a href="<%= ctx %>/cart.jsp" class="menu__item"
                                >Giỏ hàng</a
                            >
                            <a href="<%= ctx %>/checkout.jsp" class="menu__item"
                                >Thanh toán</a
                            >
                            <a href="<%= ctx %>/faq.jsp" class="menu__item"
                                >FAQ</a
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

        <!-- Danh sách sản phẩm -->
        <section class="container" style="margin-top: 120px">
            <section class="product-filters">
                <div class="product-filters-left">
                    <input
                        type="text"
                        class="product-search-input"
                        placeholder="Tìm theo tên sản phẩm..."
                    />
                    <select class="product-select" id="categorySelect">
                        <option value="">Tất cả danh mục</option>
                        <option value="nhựa tái chế">Nhựa tái chế</option>
                        <option value="giấy tái chế">Giấy tái chế</option>
                    </select>
                </div>
                <div class="product-filters-right">
                    <select class="product-select" id="sortSelect">
                        <option value="">Sắp xếp</option>
                        <option value="name_asc">Tên A → Z</option>
                        <option value="name_desc">Tên Z → A</option>
                        <option value="price_asc">Giá tăng dần</option>
                        <option value="price_desc">Giá giảm dần</option>
                    </select>
                </div>
            </section>

            <div class="product-grid" id="productGrid">
                <div
                    class="product-card"
                    data-category="nhựa tái chế"
                    data-price="30000"
                >
                    <img
                        src="<%= ctx %>/images/2-150x150.png"
                        alt="Sản phẩm 1"
                    />
                    <h3>Thùng rác nhựa tái chế</h3>
                    <p class="price">30.000đ</p>
                    <button class="order__btn">Thêm vào giỏ</button>
                </div>

                <div
                    class="product-card"
                    data-category="nhựa tái chế"
                    data-price="25000"
                >
                    <img
                        src="<%= ctx %>/images/30-150x150.png"
                        alt="Sản phẩm 2"
                    />
                    <h3>Bàn nhựa tái chế</h3>
                    <p class="price">25.000đ</p>
                    <button class="order__btn">Thêm vào giỏ</button>
                </div>

                <div
                    class="product-card"
                    data-category="giấy tái chế"
                    data-price="40000"
                >
                    <img
                        src="<%= ctx %>/images/IMG_5594-750x750.jpg"
                        alt="Sản phẩm 3"
                    />
                    <h3>Kệ sách giấy</h3>
                    <p class="price">40.000đ</p>
                    <button class="order__btn">Thêm vào giỏ</button>
                </div>

                <div
                    class="product-card"
                    data-category="nhựa tái chế"
                    data-price="30000"
                >
                    <img
                        src="<%= ctx %>/images/6-150x150.png"
                        alt="Sản phẩm 4"
                    />
                    <h3>Chậu cây nhựa tái chế</h3>
                    <p class="price">30.000đ</p>
                    <button class="order__btn">Thêm vào giỏ</button>
                </div>

                <div
                    class="product-card"
                    data-category="nhựa tái chế"
                    data-price="25000"
                >
                    <img
                        src="<%= ctx %>/images/38-150x150.png"
                        alt="Sản phẩm 5"
                    />
                    <h3>Tủ giày nhựa tái chế</h3>
                    <p class="price">25.000đ</p>
                    <button class="order__btn">Thêm vào giỏ</button>
                </div>

                <div
                    class="product-card"
                    data-category="giấy tái chế"
                    data-price="40000"
                >
                    <img
                        src="<%= ctx %>/images/16-150x150.png"
                        alt="sản phẩm 6"
                    />
                    <h3>Hộp giấy</h3>
                    <p class="price">40.000đ</p>
                    <button class="order__btn">Thêm vào giỏ</button>
                </div>
            </div>
        </section>

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
            // Filter + sort + search
            document.addEventListener("DOMContentLoaded", function () {
                const categorySelect =
                    document.getElementById("categorySelect");
                const sortSelect = document.getElementById("sortSelect");
                const searchInput = document.querySelector(
                    ".product-search-input"
                );

                const grid = document.getElementById("productGrid");
                const products = Array.from(
                    document.querySelectorAll(".product-card")
                );

                const applyFilters = () => {
                    const category = (categorySelect.value || "")
                        .toLowerCase()
                        .trim();
                    const sort = sortSelect.value;
                    const keyword = (searchInput.value || "")
                        .toLowerCase()
                        .trim();

                    let filtered = [...products];

                    if (category) {
                        filtered = filtered.filter(
                            (p) =>
                                (p.dataset.category || "").toLowerCase() ===
                                category
                        );
                    }

                    if (keyword) {
                        filtered = filtered.filter((p) => {
                            const name = (
                                p.querySelector("h3")?.innerText || ""
                            ).toLowerCase();
                            return name.includes(keyword);
                        });
                    }

                    if (sort === "price_asc")
                        filtered.sort(
                            (a, b) =>
                                Number(a.dataset.price) -
                                Number(b.dataset.price)
                        );
                    else if (sort === "price_desc")
                        filtered.sort(
                            (a, b) =>
                                Number(b.dataset.price) -
                                Number(a.dataset.price)
                        );
                    else if (sort === "name_asc")
                        filtered.sort((a, b) =>
                            (
                                a.querySelector("h3").innerText || ""
                            ).localeCompare(
                                b.querySelector("h3").innerText || ""
                            )
                        );
                    else if (sort === "name_desc")
                        filtered.sort((a, b) =>
                            (
                                b.querySelector("h3").innerText || ""
                            ).localeCompare(
                                a.querySelector("h3").innerText || ""
                            )
                        );

                    grid.innerHTML = "";
                    filtered.forEach((p) => grid.appendChild(p));
                };

                categorySelect.addEventListener("change", applyFilters);
                sortSelect.addEventListener("change", applyFilters);
                searchInput.addEventListener("input", applyFilters);
            });
        </script>

        <script>
            // Add to cart (localStorage)
            document.addEventListener("DOMContentLoaded", () => {
                const addButtons = document.querySelectorAll(
                    ".product-card .order__btn"
                );

                addButtons.forEach((button) => {
                    button.addEventListener("click", () => {
                        const card = button.closest(".product-card");
                        const name = card.querySelector("h3").innerText;
                        const price = parseInt(card.dataset.price, 10);
                        const image = card.querySelector("img").src;

                        let cart =
                            JSON.parse(localStorage.getItem("cart")) || [];

                        const existing = cart.find(
                            (item) => item.name === name
                        );
                        if (existing) existing.quantity += 1;
                        else cart.push({ name, price, image, quantity: 1 });

                        localStorage.setItem("cart", JSON.stringify(cart));
                        alert("Đã thêm sản phẩm vào giỏ hàng!");
                    });
                });
            });
        </script>

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
