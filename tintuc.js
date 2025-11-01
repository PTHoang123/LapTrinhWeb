// Danh sách tin tức (giả lập)
const newsList = [
    {
        img: "assets/news1.jpg",
        title: "Tái chế nhựa – xu hướng sống xanh năm 2025",
        desc: "Nhựa tái chế đang trở thành lựa chọn hàng đầu trong các sản phẩm gia dụng.",
        link: "#"
    },
    {
        img: "assets/news2.jpg",
        title: "5 cách sáng tạo để tái sử dụng chai nhựa",
        desc: "Những mẹo nhỏ giúp bạn vừa tiết kiệm vừa bảo vệ môi trường.",
        link: "#"
    },
    {
        img: "assets/news3.jpg",
        title: "Học sinh NLU tiên phong trong dự án tái chế rác hữu cơ",
        desc: "Một dự án sinh viên trường Đại học Nông Lâm hướng đến môi trường bền vững.",
        link: "#"
    }
];

// Render tin tức ra giao diện
const container = document.getElementById("news-container");
newsList.forEach(item => {
    const card = document.createElement("div");
    card.className = "news-card";
    card.innerHTML = `
    <img src="${item.img}" alt="${item.title}">
    <div class="news-card-content">
      <h3>${item.title}</h3>
      <p>${item.desc}</p>
      <a href="${item.link}">Xem thêm</a>
    </div>
  `;
    container.appendChild(card);
});

// Kiểm tra email
function subscribe() {
    const email = document.getElementById("emailInput").value;
    if (email.includes("@") && email.includes(".")) {
        alert("Đăng ký nhận tin thành công!");
    } else {
        alert("Vui lòng nhập email hợp lệ.");
    }
}