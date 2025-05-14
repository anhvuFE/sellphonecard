<%-- 
    Document   : productdetail
    Created on : Oct 31, 2022, 4:09:15 AM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="css/productdetail.css"/>
        <!--<link href="css/style.css" rel="stylesheet">-->
        <script type="text/javascript">
            function doAddCart(id, name, username, quantity) {
                if (!!username) {
                    if (confirm("You sure you want add " + name + " to cart ?")) {
//                    window.location = "check?action=delete&id="+id;
                        window.location = "addcart?idproc=" + id + "&&quanti=" + quantity;
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

        <c:set var="p" value="${requestScope.produc}" />
        <c:set var="idproc" value="${p.id}"/>
        <c:set var="quantity" value="1"/>
        <div class="container my-5">
            <div class="row">
                <div class="col-md-5">
                    <div class="main-img">
                        <img class="img-fluid" src="${p.image}" alt="ProductS">
                        <div class="row my-3 previews">
                            <div class="col-md-3" style="width: 95px;padding-right: 0px;padding-left: 0px;">
                                <img class="w-100x" src="https://htran844.github.io/hihi/img/ig/i12.jpg" alt="Sale" >
                            </div>
                            <div class="col-md-3" style="width: 95px;padding-right: 0px;padding-left: 0px;">
                                <img class="w-100x" src="https://htran844.github.io/hihi/img/ig/i4.jpg" alt="Sale" >
                            </div>
                            <div class="col-md-3" style="width: 95px;padding-right: 0px;padding-left: 0px;">
                                <img class="w-100x" src="https://htran844.github.io/hihi/img/ig/i10.jpg" alt="Sale" >
                            </div>
                            <div class="col-md-3" style="width: 95px;padding-right: 0px;padding-left: 0px;">
                                <img class="w-100x" src="https://htran844.github.io/hihi/img/ig/i19.jpg" alt="Sale" >
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="main-description px-2">
                        <div class="category text-bold">
                            Category: ${p.category.name}
                        </div>
                        <div class="product-title text-bold my-3" style="color:#3d464d; ">
                            ${p.name}
                        </div>

                        <div class="price-area my-4">
                            <p class="old-price mb-1"><del><s:formatNumber value="${p.price*5/4}" type="currency"/></del>
                                <span class="old-price-discount text-danger">(20% off)</span></p>
                            <p class="new-price text-bold mb-1"><s:formatNumber value="${p.price}" type="currency"/></p>
                            <p class="text-secondary mb-1">(Additional tax may apply on checkout)</p>

                        </div>

                        <form action="addcart" method="get" class="form login">
                            <input type="hidden" name="idproc" value="${p.id}">
                            <div class="buttons d-flex my-5">
                                <div class="block">
                                    <a href="#" class="shadow btn custom-btn ">Wishlist</a>
                                </div>
                                <c:set var="getquant" value="${quantity}"/>
                                <div class="block">
                                    <input class="shadow btn custom-btn" type="submit" value="Add to cart" style="background-color: black;color: white;">    
                                </div>

                                <div class="block quantity">
                                    <input type="number" class="form-control" id="cart_quantity" name="quantity" value="${quantity}" min="1" max="${p.quantity}" placeholder="Enter email">

                                </div>
                            </div>
                        </form>



                    </div>

                    <div class="product-details my-4">
                        <p class="details-title text-color mb-1">Product Details</p>
                        <p class="description">${p.description} </p>
                    </div>
                    <div class="product-details my-4">
                        <p class="details-title text-color mb-2">Material & Care</p>
                        <ul>
                            <li>Cotton</li>
                            <li>Machine-wash</li>
                        </ul>
                    </div>
                    <div class="product-details my-4">
                        <p class="details-title text-color mb-2">Sold by</p>
                        <ul>
                            <li>Cotton</li>
                            <li>Machine-wash</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>



        <div class="container-fluid pt-5 pb-3">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Similar Products</span></h2>


            <!--<div class="row">-->
            <div class="row px-xl-5">
                <c:forEach items="${requestScope.listrelate}" var="p2">
                    <c:set var="pid" value="${p2.id}" />
                    <c:set var="idproc" value="${p2.id}" />
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${p2.image}" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href="" onclick="doAddCart('${p2.id}', '${p2.name}', '${sessionScope.infor.username}')"><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="productdetail?detailid=${p2.id}">${p2.name}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5 style="color: #ee4d2d"><s:formatNumber value="${p2.price}" type="currency"/></h5>
                                    <h5 style="margin-left: 5px;">VND</h5>
                                    <h6 class="text-muted ml-2">(${p2.quantity})</h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">
                                    <c:forEach begin="1" end="${p2.rate}" step="1" var="i">
                                        <small class="fa fa-star text-primary mr-1"></small>
                                    </c:forEach>
                                    <c:forEach begin="${p2.rate}" end="4" step="1" var="i">
                                        <small class="far fa-star text-primary mr-1"></small>
                                    </c:forEach>


                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!--</div>-->
            </div>
        </div>




    </div>

    <div class="footer mt-5">

    </div>

</body>

</html>