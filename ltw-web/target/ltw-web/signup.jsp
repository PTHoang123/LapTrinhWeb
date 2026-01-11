<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <link rel="stylesheet" href="./css/signup.css" />
    </head>
    <body>
        <div class="glass-container">
            <h2>Sign Up</h2>
            <form action="<%= ctx %>/signup" method="post">
            <div class="input-group">
                    <input type="text" name="fullname" required />
                    <label>Full Name</label>
                </div>
<%--                <div class="input-group">--%>
<%--                    <input type="tel" name="phone" required />--%>
<%--                    <label>Phone Number</label>--%>
<%--                </div>--%>
                <div class="input-group">
                    <input type="email" name="email" required />
                    <label>Email</label>
                </div>
                <div class="input-group">
                    <input type="password" name="password" required />
                    <label>Password</label>
                </div>
                <div class="input-group">
                    <input type="password" required />
                    <label>Confirm Password</label>
                </div>

                <button type="submit" class="signup-btn">Sign Up</button>
                <p style="color:red">${error}</p>
                <p style="color:green">${success}</p>
                <div class="login-link">
                    <p>
                        Already have an account?
                        <a href="<%= ctx %>/login.jsp">Login</a>
                    </p>
                </div>
            </form>
        </div>
    </body>
</html>
