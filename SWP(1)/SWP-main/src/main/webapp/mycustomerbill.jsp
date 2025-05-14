

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


                        <a href="myshop" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="mycustomerbill" class="nav-item nav-link  active"><i class="fa fa-chart-bar me-2"></i>My Customer Bill</a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">

                <!-- Table Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">

                        <div class="col-12">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">My Customer Bill >> Have ${requestScope.sizebillshop} bills</h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Customer</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Address</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.databill}" var="db">
                                                <tr>
                                                    <c:set var="e" value="${db.historybuy}"></c:set>
                                                    <c:set var="r" value="${e.product}"></c:set>
                                                    <c:set var="t" value="${e.status}"></c:set>
                                                    <th scope="row">${db.id}</th>
                                                    <td>${e.username}</td>
                                                    <td>${db.zipcode}</td>
                                                    <td>${r.name}</td>
                                                    <td>${e.quantity}</td>
                                                    <td>${e.bill}</td>
                                            <form action="fixstatus" method="post">
                                                <input type="hidden" name="ix" value="${e.id}">
                                                <td><select name="statusx" id="category">
                                                        <c:forEach items="${sessionScope.status}" var="stu">
                                                            <c:if test = "${t.id == stu.id}">
                                                                <option value="${stu.id}" <c:out value = "${'checked'}"/>>${stu.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:forEach items="${sessionScope.status}" var="stu">

                                                            <option value="${stu.id}">${stu.name}</option>

                                                        </c:forEach>
                                                    </select>
                                                </td>

                                                <td>${db.address1}</td>
                                                <td>${e.date}</td>
                                                <td>
                                                    <input type="submit" value="Update"></input>
                                                </td>
                                                </tr>
                                            </form>

                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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
