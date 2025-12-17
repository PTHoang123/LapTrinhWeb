<script>
document.addEventListener("DOMContentLoaded", function() {
  const categorySelect = document.querySelectorAll(".filter-select")[0];
  const sortSelect = document.querySelectorAll(".filter-select")[1];
  const filterBtn = document.querySelector(".filter-section .order__btn");
  const grid = document.querySelector(".product-grid");
  const products = Array.from(document.querySelectorAll(".product-card"));

  filterBtn.addEventListener("click", () => {
    const category = categorySelect.value.toLowerCase();
    const sort = sortSelect.value;

    let filtered = [...products];

    // Lọc theo loại
    if (category !== "tất cả loại") {
      filtered = filtered.filter(p => p.dataset.category === category);
    }

    // Sắp xếp
    if (sort === "Giá tăng dần") {
      filtered.sort((a, b) => a.dataset.price - b.dataset.price);
    } else if (sort === "Giá giảm dần") {
      filtered.sort((a, b) => b.dataset.price - a.dataset.price);
    } else if (sort === "Tên A-Z") {
      filtered.sort((a, b) =>
        a.querySelector("h3").innerText.localeCompare(b.querySelector("h3").innerText)
      );
    }

    // Cập nhật giao diện
    grid.innerHTML = "";
    filtered.forEach(p => grid.appendChild(p));
  });
});
</script>
