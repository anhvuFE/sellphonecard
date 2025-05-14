<%-- 
    Document   : index.jsp
    Created on : Oct 10, 2022, 4:19:07 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>

        <script type="text/javascript">
            function doAddCart(id, name, username) {
                if (!!username) {
                    if (confirm("You sure you want add " + name + " to cart ?")) {
//                    window.location = "check?action=delete&id="+id;
                        window.location = "addcart?idproc=" + id;
                        window.alert("Add to cart successful!");
                    }

                } else {
                    window.alert("You must login!");
                    window.location = "login";
                }


            }

        </script>
    </head>
    <body>

        <%@include file="header.jsp" %>
        <div class="col-12" >
            <div class="bg-light rounded h-100 p-4" >

                <table class="table table-bordered" style="width: 100%;border: 0px;">

                    <tbody>
                    <form action="search" method="post" >
                        <tr>
                        <input type="hidden" name="procidx" >
                        <td><h5>Select condition</h5></td>
                        <td>Category : <select name="procat" id="category">
                                <option value="--">--</option>
                                <c:forEach items="${sessionScope.data}" var="d">
                                    <option value="${d.id}">${d.name}</option>
                                </c:forEach>
                            </select></td>
                        </td>
                        <td>Vote : <select name="votesel" >   
                                    <option value="--">--</option>
                                    <option value="4">Vote > 4</option>
                                    <option value="3">Vote > 3</option>
                                    <option value="2">Vote > 2</option>
                                    <option value="1">Vote > 1</option>
                            </select></td></td>
                        <td>Price About : <select name="pricemax" >   
                                    <option value="--">--</option>
                                    <option value="2">Price > 1.000.000</option>
                                    <option value="3">Price > 500.000</option>
                                    <option value="4">Price > 200.000</option>
                                    <option value="5">Price > 100.000</option>
                            </select></td></td>
                        
                        <td><input type="submit" style="background-color: #4bb3fc ;" name="result" value="Accept Search">

                            </input>
                        </td>
                        </tr>
                    </form>
                    </tbody>
                </table>
            </div>
        </div>
        <h5 style="margin-left: 20px;">Have : ${requestScope.sl} products</h5>
        <div class="col-12" >
            <div class="bg-light rounded h-100 p-4" >

                <table class="table table-bordered" style="width: 100%;">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Image</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Category</th>
                            <th scope="col">Shop user</th>
                            <th scope="col">Add Cart</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${requestScope.error}
                        <c:forEach items="${requestScope.resultpro}" var="m">
                            <tr>
                                <th scope="row">#ID${m.id}</th>
                                <td><img src="${m.image}" alt="" width="90px"
                                         height="90px"></td>
                                <td>${m.name}</td>
                                <td>${m.price}</td>
                                <td>${m.category.name}</td>
                                <td>${m.username}</td>
                                <c:set var="start" value="${m.id}"></c:set>
                                    <td>
                                        <a class="btn btn-outline-dark btn-square" href="" onclick="doAddCart('${m.id}', '${m.name}', '${sessionScope.infor.username}')"><i class="fa fa-shopping-cart"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
