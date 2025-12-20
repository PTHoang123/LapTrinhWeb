
UPDATE products
SET
  price = (FLOOR((RAND() * (5000000 - 100000 + 1)) / 1000) * 1000) + 100000,
  description = CONCAT(
    'Sản phẩm thân thiện môi trường, bền đẹp, dễ dùng. ',
    'Phù hợp gia đình/văn phòng, bảo hành theo chính sách.'
  );
