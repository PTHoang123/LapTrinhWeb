import re
import subprocess
from pathlib import Path

DB = "ltw"
# your path
IMG_DIR = Path("/Users/mac/LTW/ltw-web/src/main/webapp/images")

CATEGORY_ID = 1
MYSQL_DEFAULTS = str(Path.home() / ".my.cnf")
EXTS = {".png", ".jpg", ".jpeg", ".webp"}

def run_mysql(sql: str):
    subprocess.check_call(["mysql", f"--defaults-file={MYSQL_DEFAULTS}", DB, "-e", sql])

def mysql_query(sql: str) -> str:
    return subprocess.check_output(
        ["mysql", f"--defaults-file={MYSQL_DEFAULTS}", "-N", DB, "-e", sql],
        text=True
    )

def slugify(name: str) -> str:
    s = name.strip().lower()
    # remove extension-like leftovers
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
    # Ensure category 1 exists (create if missing)
    sql = f"""
    INSERT INTO categories(category_id, name, slug)
    VALUES ({CATEGORY_ID}, 'Imported', 'imported')
    ON DUPLICATE KEY UPDATE name=VALUES(name), slug=VALUES(slug);
    """
    run_mysql(sql)

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

        insert_product_sql = f"""
        INSERT INTO products(category_id, name, slug, description, price, status)
        VALUES ({cat}, {sql_quote(name)}, {sql_quote(slug)}, NULL, 0.00, 'active');
        SELECT LAST_INSERT_ID();
        """

        # Get created product_id
        pid_str = mysql_query(insert_product_sql).strip()
        if not pid_str.isdigit():
            raise SystemExit(f"Failed to get product_id for image {img.name}. Got: {pid_str!r}")
        pid = int(pid_str)

        insert_img_sql = f"""
        INSERT INTO products_img(product_id, url, sort_order, is_primary)
        VALUES ({pid}, {sql_quote(url)}, 0, 1);
        """
        run_mysql(insert_img_sql)

        print(f"Inserted product_id={pid} name={name!r} img={url!r}")

    print("Done.")

if __name__ == "__main__":
    main()