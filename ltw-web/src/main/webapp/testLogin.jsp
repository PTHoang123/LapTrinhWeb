<%--
  Created by IntelliJ IDEA.
  User: khanh
  Date: 11/01/2026
  Time: 3:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.User" %>
<html>
<body>
<%
    User u = UserDAO.login("EMAIL_TRONG_DB", "PASS_TRONG_DB");

    if (u == null) {
        out.println("LOGIN FAIL");
    } else {
        out.println("LOGIN OK: " + u.getEmail());
    }
%>
</body>
</html>

