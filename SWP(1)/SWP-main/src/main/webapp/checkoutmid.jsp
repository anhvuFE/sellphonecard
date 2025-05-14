<%-- 
    Document   : header
    Created on : Oct 20, 2022, 4:45:17 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <!--<link href="img/favicon.ico" rel="icon">-->

<!--         Google Web Fonts 
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

         Font Awesome 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">-->

        <!--         Libraries Stylesheet 
                <link href="lib/animate/animate.min.css" rel="stylesheet">
                <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">-->

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Checkout Start -->
        <div class="container-fluid">
            <form action="thanhtoan" method="post" >
                <div class="row px-xl-5">
                <div class="col-lg-8">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="row">
                            
                            
                            <div class="col-md-6 form-group">
                                <label>First Name</label>
                                <input class="form-control" type="text" name="fname" value="${sessionScope.infor.firstname}" placeholder="First Name">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Last Name</label>
                                <input class="form-control" type="text" name="lname" value="${sessionScope.infor.lastname}" placeholder="Last Name">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Mobile No</label>
                                <input class="form-control" type="text" name="phonex" value="${sessionScope.infor.phonenumber}" placeholder="+123 456 789">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address Line 1</label>
                                <input class="form-control" type="text" name="address1"  value="${sessionScope.infor.address}" placeholder="123 Street">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address Line 2</label>
                                <input class="form-control" type="text" name="address2" placeholder="123 Street">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Country</label>
                                <input class="form-control" type="text" name="ctry" placeholder="Viet Nam">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>City</label>
                                <input class="form-control" type="text" name="city" value="Ha Noi" placeholder="Ha Noi">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>ZIP Code</label>
                                <input class="form-control" type="text" name="zip" value="100000" placeholder="123">
                            </div>


                        </div>
                    </div>

                </div>
                <div class="col-lg-4">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom">
                            <h6 class="mb-3">Products</h6>
                            <c:set var="qp" value="${0}" />
                            <c:forEach items="${requestScope.cartcheck}" var="cartee">
                                <c:set var="idcartx" value="${cartee.produc.id}" />
                                <div class="d-flex justify-content-between">
                                    <p>${cartee.produc.name}</p>

                                    <p>${cartee.produc.price*cartee.quantity}</p>
                                </div>
                                
                                <c:set var="qp" value="${qp+1}" />
                                <c:set var="totale" value="${totale+cartee.produc.price*cartee.quantity}" />
                            </c:forEach>
                        </div>
                        <div class="border-bottom pt-3 pb-2">
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Subtotal</h6>
                                <h6><s:formatNumber value="${totale}" type="currency"/></h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">Free</h6>
                            </div>
                        </div>
                        <div class="pt-2">
                            <div class="d-flex justify-content-between mt-2" >
                                <h5>Total</h5>
                                <h5 style="color: red;"><s:formatNumber value="${totale}" type="currency"/></h5>
                            </div>
                        </div>
                    </div>
                    <div class="mb-5">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                        <div class="bg-light p-30">
                            <div class="form-group">
                                <h5 style="display: inline-block;">Your surplus: </h5>
                                <h5 style="color: red;display: inline-block;"><s:formatNumber value="${sessionScope.infor.surplus}" type="currency"/> VND</h5>
                            </div>
                            <input type="hidden"  name="userx" value="${sessionScope.infor.username}">
                            <input type="hidden"  name="slx" value="${qp}">
                            <input type="hidden"  name="ide" value="${idcartx}">
                            <input type="submit"class="btn btn-block btn-primary font-weight-bold py-3" value="Place Order"></input>
                        </div>
                    </div>
                </div>
            </div>
                
            </form>
            
        </div>
        <!-- Checkout End -->

<!--         JavaScript Libraries 
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

         Contact Javascript File 
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

         Template Javascript 
        <script src="js/main.js"></script>-->
    </body>

</html>
