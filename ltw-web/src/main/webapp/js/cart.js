document.addEventListener("DOMContentLoaded", function () {
  const cartBody = document.getElementById("cart-body");
  const cartTotal = document.getElementById("cart-total");
  const clearBtn = document.getElementById("clear-cart");

  let cart = JSON.parse(localStorage.getItem("cart")) || [];

  function renderCart() {
    cartBody.innerHTML = "";
    let total = 0;

    cart.forEach((item, index) => {
      const itemTotal = item.price * item.quantity;
      total += itemTotal;

      const row = document.createElement("tr");
      row.innerHTML = `
        <td><img src="${item.image}" alt="${item.name}"></td>
        <td>${item.name}</td>
        <td>${item.price.toLocaleString()}đ</td>
        <td>
          <input type="number" min="1" value="${item.quantity}" data-index="${index}" class="qty-input">
        </td>
        <td>${itemTotal.toLocaleString()}đ</td>
        <td><button class="order__btn remove-btn" data-index="${index}" style="background:#dc3545;">Xóa</button></td>
      `;
      cartBody.appendChild(row);
    });

    cartTotal.textContent = total.toLocaleString() + "đ";
    localStorage.setItem("cart", JSON.stringify(cart));
  }

  // Cập nhật số lượng
  cartBody.addEventListener("input", (e) => {
    if (e.target.classList.contains("qty-input")) {
      const index = e.target.dataset.index;
      cart[index].quantity = parseInt(e.target.value);
      renderCart();
    }
  });

  // Xóa từng sản phẩm
  cartBody.addEventListener("click", (e) => {
    if (e.target.classList.contains("remove-btn")) {
      const index = e.target.dataset.index;
      cart.splice(index, 1);
      renderCart();
    }
  });

  // Xóa toàn bộ
  clearBtn.addEventListener("click", () => {
    if (confirm("Bạn có chắc muốn xóa toàn bộ giỏ hàng?")) {
      cart = [];
      renderCart();
    }
  });

  renderCart();
});
