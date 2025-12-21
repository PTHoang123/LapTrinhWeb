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

        <p style="color:red">${error}</p>

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
