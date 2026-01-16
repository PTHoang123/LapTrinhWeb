<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <link rel="stylesheet" href="${ctx}/css/signup.css" />
    </head>
    <body>
        <div class="glass-container">
            <h2>Sign Up</h2>

            <c:if test="${not empty error}">
                <p style="color: #b00020; margin: 10px 0">
                    <c:out value="${error}" />
                </p>
            </c:if>

            <form method="post" action="${ctx}/signup" autocomplete="off">
                <div class="input-group">
                    <input
                        type="text"
                        name="fullName"
                        value="<c:out value='${param.fullName}'/>"
                        required
                    />
                    <label>Full Name</label>
                </div>

                <div class="input-group">
                    <input
                        type="email"
                        name="email"
                        value="<c:out value='${param.email}'/>"
                        required
                    />
                    <label>Email</label>
                </div>

                <div class="input-group">
                    <input
                        type="password"
                        name="password"
                        minlength="6"
                        required
                    />
                    <label>Password</label>
                </div>

                <div class="input-group">
                    <input
                        type="password"
                        name="confirmPassword"
                        minlength="6"
                        required
                    />
                    <label>Confirm Password</label>
                </div>

                <button type="submit" class="signup-btn">Sign Up</button>

                <div class="login-link">
                    <p>
                        Already have an account?
                        <a href="${ctx}/signin">Login</a>
                    </p>
                </div>
            </form>
        </div>

        <script>
            // Client-side confirm password check (server should also validate)
            (function () {
                const form = document.querySelector("form");
                if (!form) return;
                form.addEventListener("submit", function (e) {
                    const pw =
                        form.querySelector("input[name='password']")?.value ||
                        "";
                    const cpw =
                        form.querySelector("input[name='confirmPassword']")
                            ?.value || "";
                    if (pw !== cpw) {
                        e.preventDefault();
                        alert("Confirm password does not match.");
                    }
                });
            })();
        </script>
    </body>
</html>
