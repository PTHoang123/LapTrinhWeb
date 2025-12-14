// Hiệu ứng hiện dần khi cuộn
window.addEventListener("scroll", () => {
    const elements = document.querySelectorAll(".fade-in");
    elements.forEach(el => {
        const position = el.getBoundingClientRect().top;
        if (position < window.innerHeight - 100) {
            el.classList.add("visible");
        }
    });
});

// Kiểm tra email trong footer
function subscribe() {
    const email = document.getElementById("emailInput").value;
    if (email.includes("@") && email.includes(".")) {
        alert("Đăng ký nhận tin thành công!");
    } else {
        alert("Vui lòng nhập email hợp lệ.");
    }
}
