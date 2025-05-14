<%-- 
    Document   : header
    Created on : Oct 20, 2022, 4:45:17 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            nav-item nav-link:active {
                color: yellow;
            }
        </style>
        <script>
            (function ($) {
                "use strict";

                // Dropdown on mouse hover
                $(document).ready(function () {
                    function toggleNavbarMethod() {
                        if ($(window).width() > 992) {
                            $('.navbar .dropdown').on('mouseover', function () {
                                $('.dropdown-toggle', this).trigger('click');
                            }).on('mouseout', function () {
                                $('.dropdown-toggle', this).trigger('click').blur();
                            });
                        } else {
                            $('.navbar .dropdown').off('mouseover').off('mouseout');
                        }
                    }
                    toggleNavbarMethod();
                    $(window).resize(toggleNavbarMethod);
                });


                // Back to top button
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 100) {
                        $('.back-to-top').fadeIn('slow');
                    } else {
                        $('.back-to-top').fadeOut('slow');
                    }
                });
                $('.back-to-top').click(function () {
                    $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
                    return false;
                });


                // Vendor carousel
                $('.vendor-carousel').owlCarousel({
                    loop: true,
                    margin: 29,
                    nav: false,
                    autoplay: true,
                    smartSpeed: 1000,
                    responsive: {
                        0: {
                            items: 2
                        },
                        576: {
                            items: 3
                        },
                        768: {
                            items: 4
                        },
                        992: {
                            items: 5
                        },
                        1200: {
                            items: 6
                        }
                    }
                });


                // Related carousel
                $('.related-carousel').owlCarousel({
                    loop: true,
                    margin: 29,
                    nav: false,
                    autoplay: true,
                    smartSpeed: 1000,
                    responsive: {
                        0: {
                            items: 1
                        },
                        576: {
                            items: 2
                        },
                        768: {
                            items: 3
                        },
                        992: {
                            items: 4
                        }
                    }
                });


                // Product Quantity
                $('.quantity button').on('click', function () {
                    var button = $(this);
                    var oldValue = button.parent().parent().find('input').val();
                    if (button.hasClass('btn-plus')) {
                        var newVal = parseFloat(oldValue) + 1;
                    } else {
                        if (oldValue > 0) {
                            var newVal = parseFloat(oldValue) - 1;
                        } else {
                            newVal = 0;
                        }
                    }
                    button.parent().parent().find('input').val(newVal);
                });

            })(jQuery);
        </script>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <a href="home" class="text-decoration-none">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">Sell</span>
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Phone</span>
                        <span class="h1 text-uppercase text-primary bg-dark px-2 ml-n1">Card</span>

                    </a>
                </div>
                <div class="col-lg-4 col-6 text-left">
                    <form action="search" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control" name="searchhome" placeholder="Search for products">
                            <div class="input-group-append">
                                <input type="submit" class="input-group-text bg-transparent text-primary" value="Search">
                                <!--<i class="fa fa-search"></i>-->
                                </input>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4 col-6 text-right">

                    <img src="images/logo.png" class="m-0"></img>
                </div>
            </div>
            <!--             Topbar End 
            
                         Navbar Start -->
            <div class="container-fluid bg-dark mb-30">
                <div class="row px-xl-5">

                    <div class="col-lg-9" style="width: 1000px;">
                        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav mr-auto py-0">
                                    <div class="nav-item dropdown" >
                                        <a href="" class="nav-link dropdown-toggle dropdown-menu-config" data-toggle="dropdown" style="background-color: #d88484;color: #3D464D;width: 200px;height: 64px;padding-top: 20px;">
                                            <i class="fa fa-bars mr-2"></i>
                                            <h6 style="display: inline-block">Categories </h6>
                                            
                                        </a>
                                       
                                    </div>
                                    <div class="col-lg-9">
                                        <a href="home" class="nav-item nav-link" style="float: left;">Home</a>
                                        <a href="shop" class="nav-item nav-link" style="float: left;">Shopping</a>
<!--                                        <a href="myshop" class="nav-item nav-link" style="float: left;">My Shop</a>
                                        <a href="cart" class="nav-item nav-link" style="float: left;">Cart</a>-->
                                        <a href="home" class="nav-item nav-link" style="float: left;">Load Money</a>
                                        <a href="myhistorybill" class="nav-item nav-link" style="float: left;">History Buy</a>
                                    </div>

                                </div>
                            </div>   
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block" style="float: right; display: inline;">
                                <a href="" class="btn px-0" style="float: right;">
                                    <i class="fas fa-heart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                </a>
                                <a href="cart" class="btn px-0 ml-3" style="float: right; margin-right:20px;">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">${sessionScope.sizecart}</span>
                                </a>

                            </div>
                        </nav>

                    </div>
                    <%--<c:set var="in" value="${requestScope.infor}" />--%>
                    <div style="width: 300px;float: right;">
                        <div style="">
                            <a href="accountinfor" style="float: left;padding: 10px;"><img style="background-color: #ffffff;padding: 10px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTIgMGMtNi42MjcgMC0xMiA1LjM3My0xMiAxMnM1LjM3MyAxMiAxMiAxMiAxMi01LjM3MyAxMi0xMi01LjM3My0xMi0xMi0xMnptNy43NTMgMTguMzA1Yy0uMjYxLS41ODYtLjc4OS0uOTkxLTEuODcxLTEuMjQxLTIuMjkzLS41MjktNC40MjgtLjk5My0zLjM5My0yLjk0NSAzLjE0NS01Ljk0Mi44MzMtOS4xMTktMi40ODktOS4xMTktMy4zODggMC01LjY0NCAzLjI5OS0yLjQ4OSA5LjExOSAxLjA2NiAxLjk2NC0xLjE0OCAyLjQyNy0zLjM5MyAyLjk0NS0xLjA4NC4yNS0xLjYwOC42NTgtMS44NjcgMS4yNDYtMS40MDUtMS43MjMtMi4yNTEtMy45MTktMi4yNTEtNi4zMSAwLTUuNTE0IDQuNDg2LTEwIDEwLTEwczEwIDQuNDg2IDEwIDEwYzAgMi4zODktLjg0NSA0LjU4My0yLjI0NyA2LjMwNXoiLz48L3N2Zz4="></a>
                            <h4 style="display:inline; color: rgb(255, 255, 255); font-size: 18px;float: left;padding-top: 20px;">Welcome ${sessionScope.account.userName}</h4>
                        </div>
                        <a href="login" style="display: inline-block;float: right;padding: 10px;"><img style="background-color: #ffffff;padding: 10px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTYgOXYtNGw4IDctOCA3di00aC04di02aDh6bS0xNi03djIwaDE0di0yaC0xMnYtMTZoMTJ2LTJoLTE0eiIvPjwvc3ZnPg=="></a>

                    </div>

                </div>
            </div>
            <!--             Navbar End -->
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html> 