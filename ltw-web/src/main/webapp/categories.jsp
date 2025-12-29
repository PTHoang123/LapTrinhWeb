<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="java.util.List" %> <%@ page import="model.Category" %> <%! private
String norm(String s) { if (s == null) return ""; String lower =
s.toLowerCase(); StringBuilder sb = new StringBuilder(lower.length()); for (int
i = 0; i < lower.length(); i++) { char ch = lower.charAt(i); if
(!Character.isWhitespace(ch)) sb.append(ch); } return sb.toString(); } public
String iconFor(String name) { String n = norm(name); if (n.contains("đèn") ||
n.contains("den")) return "ri-lightbulb-flash-line"; if (n.contains("đồchơi") ||
n.contains("dochoi") || n.contains("robot") || n.contains("môhình") ||
n.contains("mohinh")) return "ri-gamepad-line"; if (n.contains("nộithất") ||
n.contains("noithat") || n.contains("bàn") || n.contains("ban") ||
n.contains("ghế") || n.contains("ghe") || n.contains("kệ") || n.contains("ke"))
return "ri-sofa-line"; if (n.contains("trangtrí") || n.contains("trangtri") ||
n.contains("khung") || n.contains("đồnghồ") || n.contains("dongho")) return
"ri-paint-brush-line"; if (n.contains("vănphòng") || n.contains("vanphong") ||
n.contains("họctập") || n.contains("hoctap") || n.contains("bút") ||
n.contains("but")) return "ri-pencil-ruler-2-line"; if (n.contains("thờitrang")
|| n.contains("thoitrang") || n.contains("phụkiện") || n.contains("phukien") ||
n.contains("balo") || n.contains("ví") || n.contains("vi")) return
"ri-shirt-line"; if (n.contains("giadụng") || n.contains("giadung")) return
"ri-home-5-line"; return "ri-price-tag-3-line"; } public String
colorForIndex(int idx) { String[] colors = new String[]{ "category-icon--green",
"category-icon--orange", "category-icon--blue", "category-icon--yellow",
"category-icon--purple" }; return colors[Math.abs(idx) % colors.length]; } %> <%
String ctx = request.getContextPath(); List<Category>
    categories = (List<Category
        >) request.getAttribute("categories"); String error = (String)
        request.getAttribute("error"); %>
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="UTF-8" />
                <meta
                    name="viewport"
                    content="width=device-width, initial-scale=1.0"
                />
                <link rel="stylesheet" href="./css/categories.css" />
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
                                    <a
                                        href="<%= ctx %>/about.jsp"
                                        class="menu__item"
                                        >Giới thiệu</a
                                    >
                                    <a
                                        href="<%= ctx %>/news.jsp"
                                        class="menu__item"
                                        >Tin tức</a
                                    >
                                    <a
                                        href="<%= ctx %>/categories"
                                        class="menu__item"
                                        >Danh mục</a
                                    >
                                    <a
                                        href="<%= ctx %>/product.jsp"
                                        class="menu__item"
                                        >Sản phẩm</a
                                    >
                                    <a
                                        href="<%= ctx %>/cart.jsp"
                                        class="menu__item"
                                        >Giỏ hàng</a
                                    >
                                    <a
                                        href="<%= ctx %>/checkout.jsp"
                                        class="menu__item"
                                        >Thanh toán</a
                                    >
                                    <a
                                        href="<%= ctx %>/faq.jsp"
                                        class="menu__item"
                                        >FAQ</a
                                    >
                                </div>
                            </div>

                            <div class="nav__right">
                                <span class="cart__icon">
                                    <i class="ri-shopping-cart-fill"></i>
                                    <span class="cart__badge">1</span>
                                </span>
                                <span class="user"
                                    ><i class="ri-user-fill"></i
                                ></span>
                            </div>
                        </div>
                    </div>
                </header>

                <!-- Categories section -->
                <main class="categories-page">
                    <div class="container">
                        <section class="categories-hero">
                            <h1 class="categories-title">Danh mục sản phẩm</h1>
                            <p class="categories-subtitle">
                                Chọn danh mục bạn quan tâm để xem các sản phẩm
                                phù hợp cho khu vườn xanh của bạn.
                            </p>

                            <% if (error != null) { %>
                            <p style="color: #b00020; margin-top: 12px">
                                Lỗi tải danh mục: <%= error %>
                            </p>
                            <% } %>
                        </section>

                        <section class="categories-grid">
                            <% if (categories != null && !categories.isEmpty())
                            { %> <% for (int i = 0; i < categories.size(); i++)
                            { Category c = categories.get(i); %>
                            <article class="category-card">
                                <div
                                    class="category-icon <%= colorForIndex(i) %>"
                                >
                                    <i class="<%= iconFor(c.getName()) %>"></i>
                                </div>
                                <h3><%= c.getName() %></h3>
                                <p>
                                    <strong><%= c.getProductCount() %></strong>
                                    sản phẩm
                                </p>
                                <a
                                    href="<%= ctx %>/product.jsp?categoryId=<%= c.getCategoryId() %>"
                                    class="category-link"
                                >
                                    Xem sản phẩm
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </article>
                            <% } %> <% } else if (error == null) { %>
                            <p>Chưa có danh mục nào.</p>
                            <% } %>
                        </section>
                    </div>
                </main>

                <!-- footer -->
                <footer class="footer">
                    <div class="footer__logo">
                        <h5>Về chúng tôi</h5>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing
                            elit. Nesciunt pariatur accusamus
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
                                    địa chỉ 1: Khu phố 6, Phường Linh Trung, TP
                                    Thủ Đức, TP. Hồ Chí Minh
                                </p>
                            </div>
                            <div class="delivery__time-item">
                                <p>
                                    địa chỉ 2: Khoa công nghệ thông tin, Đại Học
                                    Nông Lâm TP.HCM.
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
                            <input
                                type="email"
                                placeholder="Nhập email của bạn"
                            />
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
        </html></Category
    ></Category
>
