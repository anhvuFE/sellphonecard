<%-- 
    Document   : myshopmid
    Created on : Oct 31, 2022, 7:51:05 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!--Icon Font Stylesheet--> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!--     Libraries Stylesheet 
        -->    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style1.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            

            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="home" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><|BACK HOME</h3>
                    </a>
                    
                    <div class="navbar-nav w-100">
                        
                        
                        <a href="myshop" class="nav-item nav-link active"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="mycustomerbill" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>My Customer Bill</a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                
                <!-- Table Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        

                        <div class="col-12" >
                            <div class="bg-light rounded h-100 p-4" >
                                <h6 class="mb-4">Add New</h6>
                                <table class="table table-bordered" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th scope="col">Image Url</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Add button</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <form action="addproduct" method="post" >
                                        <tr>
                                            <input type="hidden" name="procidx" >
                                            <td><input type="text" name="proimage" placeholder="url image"  size="10"
                                                                    ></td>
                                            <td><input id="name" name="proname" type="text" required="" maxlength="40"  >
                                            </td>
                                            <td><input id="expire_date" name="proquanti" type="text"  size="10"
                                                            data-large-mode="true"></td>
                                            <td><input id="stock" name="proprice" type="text"  size="10"
                                                           required=""></td>
                                            <td><textarea   name="prodes" size="15"></textarea></td>
                                            <td><select name="procat" id="category">
                                                    
                                                    <c:forEach items="${sessionScope.data}" var="d">

                                                        <option value="${d.id}">${d.name}</option>

                                                    </c:forEach>
                                                </select></td>
                                                <td><input type="submit" style="background-color: #4bb3fc ;" name="result" value="ADD">
                                                    <a href="myshop">
                                                            <div type="" 
                                                                 style="background-color: #aec2d1 ;margin-top: 10px;color: black;width: 72px;text-align: center;">
                                                                Cancel</div>
                                                        </a>
                                                    </input>
                                        </td>
                                        </tr>
                                        </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Update</h6>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">Image Url</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Add button</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <form action="updateproduct" method="post" >
                                        <tr>
                                        <input type="hidden"  name="procidx1" value="${productedit.id}">
                                            <td><input type="text" name="proimage1" placeholder="url image" size="10"
                                                                    value="${productedit.image}"></td>
                                            <td><input id="name" name="proname1" value="${productedit.name}"type="text" required="" maxlength="40" >
                                            </td>
                                            <td><input id="expire_date" name="proquanti1" type="text" value="${productedit.quantity}" required=""  size="10"
                                                            data-large-mode="true"></td>
                                            <td><input id="stock" name="proprice1" type="text" value="${productedit.price}" required="" size="10"
                                                           ></td>
                                            <td><textarea   name="prodes1" >${productedit.description}</textarea></td>
                                            <td><select name="procat1" id="category">
                                                    <c:forEach items="${sessionScope.data}" var="d">
                                                        <c:if test = "${productedit.category.id == d.id}">
                                                            <option value="${d.id}" <c:out value = "${'checked'}"/>>${d.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:forEach items="${sessionScope.data}" var="d">

                                                        <option value="${d.id}">${d.name}</option>

                                                    </c:forEach>
                                                </select></td>
                                                <td><input type="submit" style="background-color: #4bb3fc ;" name="result1" value="UPDATE">
                                                    <a href="myshop">
                                                            <div type="" 
                                                                 style="background-color: #aec2d1 ;margin-top: 10px;color: black;width: 72px;text-align: center;">
                                                                Cancel</div>
                                                        </a>
                                                    </input>
                                        </td>
                                        </tr>
                                        </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>                    
                        <div class="col-12">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Product List</h6>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Edit</th>
                                            <th scope="col">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${requestScope.error}
                                        <c:forEach items="${requestScope.myproc}" var="m">
                                            <tr>
                                                <th scope="row">#ID${m.id}</th>
                                                <td><img src="${m.image}" alt="" width="90px"
                                                         height="90px"></td>
                                                <td>${m.name}</td>
                                                <td>${m.quantity}</td>
                                                <td>${m.price}</td>
                                                <td>${m.category.name}</td>
                                                <td>${m.description}</td>
                                                <c:set var="start" value="${m.id}"></c:set>
                                                    <td>
                                                        <a href="myshop?start=${m.id}" class="edit-item" title="Edit" ><img
                                                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTYuNTk4IDEzLjA5MWwtNS42OS01LjY4OCA3LjQwMi03LjQwMyA1LjY5IDUuNjg5LTcuNDAyIDcuNDAyem0tMTYuNTk4IDEwLjkwOWw3LjEyNi0xLjQzNi01LjY4OC01LjY4OS0xLjQzOCA3LjEyNXptMS45ODQtMjAuNTY4bDYuNDQ5IDYuNDQ2LTUuNTgyIDUuNTgyIDUuNjg5IDUuNjkgNS41ODMtNS41ODMgNi40OTIgNi40OSAxLjQtMS40MjgtMTguNjMxLTE4LjYyNS0xLjQgMS40Mjh6Ii8+PC9zdmc+"></a>

                                                </td>
                                                <td>
                                                    <a href="deleteproduct?start=${m.id}" class="remove-item" title="Remove" style="float: right;">
                                                        <img style="width: 35px ;height: 35px;"
                                                             src="data:image/svg+xml;base64,PHN2ZyBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLW1pdGVybGltaXQ9IjIiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJtMTIuMDAyIDIuMDA1YzUuNTE4IDAgOS45OTggNC40OCA5Ljk5OCA5Ljk5NyAwIDUuNTE4LTQuNDggOS45OTgtOS45OTggOS45OTgtNS41MTcgMC05Ljk5Ny00LjQ4LTkuOTk3LTkuOTk4IDAtNS41MTcgNC40OC05Ljk5NyA5Ljk5Ny05Ljk5N3ptNC4yNTMgOS4yNWgtOC41Yy0uNDE0IDAtLjc1LjMzNi0uNzUuNzVzLjMzNi43NS43NS43NWg4LjVjLjQxNCAwIC43NS0uMzM2Ljc1LS43NXMtLjMzNi0uNzUtLjc1LS43NXoiIGZpbGwtcnVsZT0ibm9uemVybyIvPjwvc3ZnPg==">
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Table End -->


            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>