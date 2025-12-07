-- ==========================
-- TABLE: User
-- ==========================
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    status ENUM('active', 'blocked', 'delete') DEFAULT 'active'
);

-- ==========================
-- TABLE: User_Address
-- ==========================
CREATE TABLE User_Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(255),
    phone VARCHAR(50),
    city VARCHAR(255),
    street VARCHAR(255),
    cty VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    postal_code VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- ==========================
-- TABLE: Admin
-- ==========================
CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone INT,
    role ENUM('admin', 'manager') DEFAULT 'admin',
    status ENUM('active', 'blocked', 'delete') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

-- ==========================
-- TABLE: Categories
-- ==========================
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    slug VARCHAR(255)
);

-- ==========================
-- TABLE: Products
-- ==========================
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(255),
    slug VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2),
    status ENUM('active', 'archived') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- ==========================
-- TABLE: Products_variants
-- ==========================
CREATE TABLE Products_variants (
    variant_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color VARCHAR(255),
    extra_price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- ==========================
-- TABLE: Products_img
-- ==========================
CREATE TABLE Products_img (
    img_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    variant_id INT,
    url VARCHAR(1024),
    description TEXT,
    price DECIMAL(10,2),
    status ENUM('active', 'archived') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (variant_id) REFERENCES Products_variants(variant_id)
);

-- ==========================
-- TABLE: Inventory
-- ==========================
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    variant_id INT NOT NULL,
    stock_qty INT,
    reserved_qty INT,
    warehouse_id INT,
    FOREIGN KEY (variant_id) REFERENCES Products_variants(variant_id)
);

-- ==========================
-- TABLE: Cart
-- ==========================
CREATE TABLE Cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- ==========================
-- TABLE: Cart_Item
-- ==========================
CREATE TABLE Cart_Item (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    variant_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (variant_id) REFERENCES Products_variants(variant_id)
);

-- ==========================
-- TABLE: Order
-- ==========================
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    status ENUM('pending','paid','shipped','completed','cancelled','refunded') DEFAULT 'active',
    shipping_fee DECIMAL(10,2),
    tax_total DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    shipping_address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    paid_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- ==========================
-- TABLE: Order_Item
-- ==========================
CREATE TABLE Order_Item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    variant_id INT,
    unit_price DECIMAL(10,2),
    quantity INT,
    total_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    paid_at TIMESTAMP NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (variant_id) REFERENCES Products_variants(variant_id)
);

-- ==========================
-- TABLE: product_review
-- ==========================
CREATE TABLE product_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating TINYINT,
    comment VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

/*1. Đăng nhập (Login)*/
SELECT * 
FROM User
WHERE email = ?
  AND password_hash = ? 
  AND status = 'active';

/*2. Đăng ký tài khoản (Register)*/
INSERT INTO User (email, password_hash, status)
VALUES (?, ?, 'active');

/*3. Kiểm tra email tồn tại*/
SELECT user_id
FROM User
WHERE email = ?;

/*4. Quên mật khẩu – cập nhật mật khẩu mới*/
UPDATE User
SET password_hash = ?
WHERE email = ?;

/*5. Lấy thông tin user profile*/
SELECT u.user_id, u.email, a.full_name, a.phone, a.city, a.street
FROM User u
LEFT JOIN User_Address a ON u.user_id = a.user_id
WHERE u.user_id = ?;

/*6. Thêm địa chỉ giao hàng*/
INSERT INTO User_Address (user_id, full_name, phone, city, street, state, country, postal_code)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);

/*7. Lấy danh sách sản phẩm*/
SELECT p.product_id, p.name, p.price, p.slug, c.name AS category
FROM Products p
LEFT JOIN Categories c ON p.category_id = c.category_id
WHERE p.status = 'active';