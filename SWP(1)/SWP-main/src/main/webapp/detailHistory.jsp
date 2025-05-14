<%-- 
    Document   : detailHistory
    Created on : Jun 15, 2023, 2:52:52 PM
    Author     : caoqu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .table {
                margin: auto;
                border-collapse: collapse;
                width: 50%;
                font-size: 16px;
                text-align: center;
                color: #333;
            }

            .table th {
                font-weight: bold;
                font-size: 18px;
                background-color: #ddd; /* Màu nền của header */
            }

            .table tr:nth-child(even) {
                background-color: #f2f2f2; /* Màu nền của các dòng chẵn */
            }

            td, th {
                padding: 12px;
                border: 1px solid #ccc;
            }

            td:hover {
                background-color: #ddd;
            }

            .table-container {
                margin-bottom: 30px;
                margin-left: 75px;
                margin-right: 75px;
            }

            .return-button {
                background-color: #4CAF50;
                color: white;
                border: 2px solid #4CAF50;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                margin-left: 75px;
            }

            .return-button:hover {
                background-color: #3e8e41;
                border: 2px solid #3e8e41;
            }




        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:forEach items="${list}" var="c">
            <form method="POST" action="/submit-form">

                <div class="table-container">
                    <table class="table">
                        <th>Số seri:</th>
                        <th>Mã thẻ:</th>
                        <th>Mệnh giá:</th>
                        <th>Ngày hết hạn:</th>
                        <th>Ngày tạo:</th>
                        <tr>
                            <td>${c.seri}</td>
                            <td>${c.code}</td>
                            <td>${c.price}</td>
                            <td>${c.expirationDate}</td>
                            <td>${c.createdAt}</td>
                        </tr>


                    </table>
                </div>
            </form>
        </c:forEach>
        <%@include file="footer.jsp" %>
    </body>
</html>
