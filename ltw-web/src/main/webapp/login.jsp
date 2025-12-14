<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Log in</title>
    <link rel="stylesheet" href="<%= ctx %>/css/login.css" />
</head>
<body>
    <div class="glass-container">
        <h2>Login</h2>
        <form action="<%= ctx %>/login" method="post">
            <div class="input-group">
                <input type="email" name="email" required />
                <label>Email</label>
            </div>

            <div class="input-group">
                <input type="password" name="password" required />
                <label>Password</label>
            </div>

            <div class="remember-forgot">
                <label>
                    <input type="checkbox" /> Remember password
                </label>
                <a href="<%= ctx %>/forgotpass.jsp">Forgot password?</a>
            </div>

            <button type="submit" class="login-btn">Login</button>

            <p class="error" style="color:red">${error}</p>

            <div class="register-link">
                <p>
                    Don't have an account?
                    <a href="<%= ctx %>/signup.jsp">Sign up</a>
                </p>
            </div>
        </form>
    </div>
</body>
</html>
```jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
<h2>ĐĂNG NHẬP</h2>

<form action="login" method="post">
    <label>Email</label><br>
    <input type="email" name="email" required><br><br>

    <label>Mật khẩu</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Đăng nhập</button>
</form>

<p style="color:red">${error}</p>

<a href="signup.jsp">Đăng ký</a> |
<a href="forgotpass.jsp">Quên mật khẩu</a>
</body>
</html>