import re
import subprocess
import random
from pathlib import Path

DB = "ltw"
IMG_DIR = Path("/Users/mac/LTW/ltw-web/src/main/webapp/images")

CATEGORY_ID = 1
MYSQL_DEFAULTS = str(Path.home() / ".my.cnf")
EXTS = {".png", ".jpg", ".jpeg", ".webp"}

# Random VND price settings
PRICE_MIN_VND = 100_000
PRICE_MAX_VND = 5_000_000
PRICE_STEP_VND = 1_000  # keep it "VND-like" steps

# Description settings (>= 50 chars)
DESC_MIN_LEN = 50

DESC_SENTENCES = [
    "Sản phẩm thân thiện môi trường, thiết kế tối giản và dễ sử dụng.",
    "Chất liệu bền, hoàn thiện chắc chắn, phù hợp nhiều không gian.",
    "Dễ vệ sinh, dễ bảo quản, dùng hằng ngày rất tiện lợi.",
    "Phù hợp cho gia đình và văn phòng, đóng gói cẩn thận khi giao hàng.",
    "Màu sắc và chi tiết có thể thay đổi nhẹ tùy theo từng lô sản xuất.",
    "Gợi ý sử dụng: kết hợp cùng các phụ kiện tái chế để đồng bộ phong cách.",
    "Kích thước vừa phải, tối ưu công năng và tiết kiệm diện tích.",
    "Sản phẩm được lựa chọn kỹ, ưu tiên độ bền và tính an toàn khi sử dụng.",
]

DESC_TAGS = [
    "Tái chế", "Bền vững", "Tiện dụng", "Tối giản", "Thân thiện môi trường",
    "Chất lượng tốt", "Dễ dùng", "Dễ vệ sinh"
]

def run_mysql(sql: str):
    subprocess.check_call(["mysql", f"--defaults-file={MYSQL_DEFAULTS}", DB, "-e", sql])

def mysql_query(sql: str) -> str:
    return subprocess.check_output(
        ["mysql", f"--defaults-file={MYSQL_DEFAULTS}", "-N", DB, "-e", sql],
        text=True
    )

def slugify(name: str) -> str:
    s = name.strip().lower()
    s = re.sub(r"\s+", "-", s)
    s = re.sub(r"[^a-z0-9\-]+", "-", s)
    s = re.sub(r"-{2,}", "-", s).strip("-")
    return s or "product"

def title_from_filename(filename: str) -> str:
    base = Path(filename).stem
    base = base.replace("_", " ").replace("-", " ").strip()
    base = re.sub(r"\s+", " ", base)
    return base[:255] if base else "Product"

def sql_quote(s: str) -> str:
    return "'" + s.replace("\\", "\\\\").replace("'", "''") + "'"

def ensure_category():
    if CATEGORY_ID is None:
        return
    sql = f"""
    INSERT INTO categories(category_id, name, slug)
    VALUES ({CATEGORY_ID}, 'Imported', 'imported')
    ON DUPLICATE KEY UPDATE name=VALUES(name), slug=VALUES(slug);
    """
    run_mysql(sql)

def random_price_vnd() -> int:
    # Random in steps (e.g. 1000 VND)
    steps = (PRICE_MAX_VND - PRICE_MIN_VND) // PRICE_STEP_VND
    return PRICE_MIN_VND + random.randint(0, steps) * PRICE_STEP_VND

def random_description(min_len: int = DESC_MIN_LEN) -> str:
    # Build a description by sampling sentences + tags until >= min_len
    parts = []
    # 2-4 sentences
    for s in random.sample(DESC_SENTENCES, k=random.randint(2, 4)):
        parts.append(s)

    # add 2-4 tags
    tags = ", ".join(random.sample(DESC_TAGS, k=random.randint(2, 4)))
    parts.append(f"Từ khóa: {tags}.")

    desc = " ".join(parts).strip()
    # ensure minimum length
    while len(desc) < min_len:
        desc += " " + random.choice(DESC_SENTENCES)
    return desc

def main():
    if not IMG_DIR.exists():
        raise SystemExit(f"Image folder not found: {IMG_DIR}")

    images = [p for p in IMG_DIR.iterdir() if p.is_file() and p.suffix.lower() in EXTS and p.name != ".DS_Store"]
    images.sort(key=lambda p: p.name.lower())

    if not images:
        raise SystemExit(f"No images found in {IMG_DIR}")

    ensure_category()

    # Optional: clear existing products/images (uncomment if you want reset)
    # run_mysql("SET FOREIGN_KEY_CHECKS=0; DELETE FROM products_img; DELETE FROM products; SET FOREIGN_KEY_CHECKS=1;")

    for img in images:
        name = title_from_filename(img.name)
        slug = slugify(name)
        url = f"images/{img.name}"

        cat = "NULL" if CATEGORY_ID is None else str(CATEGORY_ID)

        price_vnd = random_price_vnd()
        # Store as DECIMAL(10,2) but with .00
        price_sql = f"{price_vnd}.00"

        desc = random_description()

        insert_product_sql = f"""
        INSERT INTO products(category_id, name, slug, description, price, status)
        VALUES ({cat}, {sql_quote(name)}, {sql_quote(slug)}, {sql_quote(desc)}, {price_sql}, 'active');
        SELECT LAST_INSERT_ID();
        """

        pid_str = mysql_query(insert_product_sql).strip()
        if not pid_str.isdigit():
            raise SystemExit(f"Failed to get product_id for image {img.name}. Got: {pid_str!r}")
        pid = int(pid_str)

        insert_img_sql = f"""
        INSERT INTO products_img(product_id, url, sort_order, is_primary)
        VALUES ({pid}, {sql_quote(url)}, 0, 1);
        """
        run_mysql(insert_img_sql)

        print(f"Inserted product_id={pid} price={price_vnd} desc_len={len(desc)} name={name!r} img={url!r}")

    print("Done.")

if __name__ == "__main__":
    main()