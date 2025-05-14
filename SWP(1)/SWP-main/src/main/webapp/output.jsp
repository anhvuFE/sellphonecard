<%-- 
    Document   : output
    Created on : May 28, 2023, 9:28:28 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>OK</h1>

        <p>Account: ${sessionScope.account}</p>
        <p>Password: ${sessionScope.password}</p>

    </body>
</html>
