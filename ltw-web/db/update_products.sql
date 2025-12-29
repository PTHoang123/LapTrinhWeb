INSERT INTO categories(name) VALUES
('Khác'),
('Đèn tái chế'),
('Đồ chơi tái chế'),
('Nội thất tái chế'),
('Đồ trang trí tái chế'),
('Đồ dùng học tập / văn phòng'),
('Thời trang / phụ kiện tái chế'),
('Đồ gia dụng tái chế')
ON DUPLICATE KEY UPDATE name = name;

-- Update prices and descriptions
UPDATE products
SET
  price = (FLOOR((RAND() * (5000000 - 100000 + 1)) / 1000) * 1000) + 100000,
  description = CONCAT(
    'Sản phẩm thân thiện môi trường, bền đẹp, dễ dùng. ',
    'Phù hợp gia đình/văn phòng, bảo hành theo chính sách.'
  );

-- Default all to "Khác"
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Khác');

-- Đèn
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Đèn tái chế')
WHERE LOWER(name) LIKE 'den %'
   OR LOWER(slug) LIKE 'den-%';

-- Đồ chơi
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Đồ chơi tái chế')
WHERE LOWER(name) LIKE 'do choi%'
   OR LOWER(slug) LIKE 'do-choi%'
   OR LOWER(name) LIKE '%robot%'
   OR LOWER(slug) LIKE '%robot%'
   OR LOWER(name) LIKE '%mo hinh%'
   OR LOWER(slug) LIKE 'mo-hinh%';

-- Nội thất
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Nội thất tái chế')
WHERE LOWER(name) LIKE '%ban %'
   OR LOWER(name) LIKE '%ghe %'
   OR LOWER(slug) LIKE 'ban-%'
   OR LOWER(slug) LIKE 'ghe-%'
   OR LOWER(name) LIKE '%ke %'
   OR LOWER(slug) LIKE 'ke-%'
   OR LOWER(name) LIKE '%cau thang%'
   OR LOWER(slug) LIKE 'cau-thang%';

-- Đồ trang trí
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Đồ trang trí tái chế')
WHERE LOWER(name) LIKE '%trang tri%'
   OR LOWER(slug) LIKE '%trang-tri%'
   OR LOWER(name) LIKE '%khung%' OR LOWER(slug) LIKE 'khung-%'
   OR LOWER(name) LIKE '%dong ho%' OR LOWER(slug) LIKE 'dong-ho%'
   OR LOWER(name) LIKE '%binh hoa%' OR LOWER(slug) LIKE 'binh-hoa%';

-- Văn phòng / học tập
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Đồ dùng học tập / văn phòng')
WHERE LOWER(name) LIKE '%but%'
   OR LOWER(slug) LIKE '%but%'
   OR LOWER(name) LIKE '%hop but%'
   OR LOWER(slug) LIKE '%hop-but%'
   OR LOWER(name) LIKE '%kep%'
   OR LOWER(slug) LIKE 'kep-%';

-- Thời trang / phụ kiện
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Thời trang / phụ kiện tái chế')
WHERE LOWER(name) LIKE '%balo%' OR LOWER(slug) LIKE 'balo-%'
   OR LOWER(name) LIKE '%vi%' OR LOWER(slug) LIKE '%vi%'
   OR LOWER(name) LIKE '%moc khoa%' OR LOWER(slug) LIKE 'moc-khoa%'
   OR LOWER(name) LIKE '%op lung%' OR LOWER(slug) LIKE 'op-lung%';

-- Gia dụng
UPDATE products
SET category_id = (SELECT category_id FROM categories WHERE name='Đồ gia dụng tái chế')
WHERE LOWER(name) LIKE '%khay%' OR LOWER(slug) LIKE 'khay-%'
   OR LOWER(name) LIKE '%hop dung%' OR LOWER(slug) LIKE 'hop-dung%'
   OR LOWER(name) LIKE '%gia treo%' OR LOWER(slug) LIKE 'gia-treo%';
