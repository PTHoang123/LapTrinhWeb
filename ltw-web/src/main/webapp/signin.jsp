<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib uri="jakarta.tags.core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
    <head>
        <title>Log in</title>
        <link rel="stylesheet" href="${ctx}/css/login.css" />
    </head>

    <body>
        <div class="glass-container">
            <h2>Login</h2>

            <c:if test="${not empty error}">
                <p style="color: #b00020; margin: 10px 0">
                    <c:out value="${error}" />
                </p>
            </c:if>

            <form method="post" action="${ctx}/signin" autocomplete="off">
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
                    <input type="password" name="password" required />
                    <label>Password</label>
                </div>

                <div class="remember-forgot">
                    <label
                        ><input
                            type="checkbox"
                            name="remember"
                            value="1"
                        />Remember password</label
                    >
                    <a href="#">Forgot password</a>
                </div>

                <button type="submit" class="login-btn">Login</button>

                <div class="register-link">
                    <p>
                        Don't have an account
                        <a href="${ctx}/signup">Sign up</a>
                    </p>
                </div>
            </form>
        </div>
    </body>
</html>
