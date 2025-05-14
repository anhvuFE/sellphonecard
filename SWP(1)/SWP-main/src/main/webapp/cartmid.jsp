<%-- 
    Document   : cartmid
    Created on : Oct 30, 2022, 9:53:13 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>

        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
                            <th>Name Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                            <th>Check out</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">

                        <c:forEach items="${requestScope.cartlist}" var="cart">
                            <c:set var="x" value="${cart.produc.price*cart.quantity}" />
                            <tr>
                                <td class="align-middle"><img src="${cart.produc.image}" alt="" style="width: 50px;"></td>
                                <td class="align-middle"> ${cart.produc.name}</td>
                                <td class="align-middle" style="color: #ee4d2d"><s:formatNumber value="${cart.produc.price}" type="currency"/></td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <c:set var="minusonepro" value="${cart.produc.id}" />
                                            <c:set var="quantity" value="${cart.quantity}" />
                                            <a href="minusone?minusonepro=${cart.produc.id}&&quantity=${cart.quantity}">
                                                <button class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </a>

                                        </div>
                                        <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="${cart.quantity}">
                                        <div class="input-group-btn">
                                            <c:set var="addonepro" value="${cart.produc.id}" />
                                            <c:set var="quantity" value="${cart.quantity}" />
                                            <a href="addone?addonepro=${cart.produc.id}&&quantity=${cart.quantity}">
                                                <button class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button><!-- comment -->
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <c:set var="pid" value="${cart.id}" />
                                <td class="align-middle" style="color: #ee4d2d"><s:formatNumber value="${cart.produc.price*cart.quantity}" type="currency"/></td>
                                <td class="align-middle"><a href="deleproccart?pid=${cart.id}"><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></a></td>
                                <td class="align-middle"><a href="thanhtoan?pids=${cart.id}"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M8.503 5c-.258-1.675.039-3.562 1.228-5h7.259c-.522.736-1.768 2.175-1.391 5h-1.154c-.147-1.336.066-2.853.562-4h-4.726c-.665 1.003-.89 2.785-.656 4h-1.122zm8.124-1v.675c0 .732-.583 1.325-1.304 1.325h-6.646c-.72 0-1.303-.593-1.303-1.325v-.675h-2.374v20h14v-20h-2.373zm.373 18h-10v-14h10v14zm-1-13h-8v4h8v-4zm-6 7h-2v1h2v-1zm3 0h-2v1h2v-1zm3 0h-2v1h2v-1zm-6-2h-2v1h2v-1zm3 0h-2v1h2v-1zm3 0h-2v1h2v-1zm-6 4h-2v1h2v-1zm3 0h-2v1h2v-1zm3 0h-2v1h2v-1zm0 2h-2v1h2v-1zm-6 0h-2v1h2v-1zm3 0h-2v1h2v-1z"/></svg></a></td>

                            </tr>
                            <c:set var="subtotal" value="${subtotal + x}" />
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <form class="mb-30" action="">
                    <div class="input-group">
                        <input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form>
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6 style="color: #ee4d2d"><s:formatNumber value="${subtotal}" type="currency"/> VND</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">Free</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5 style="color: #ee4d2d"><s:formatNumber value="${subtotal+0}" type="currency"/>VND</h5>

                        </div>
                        <a href="thanhtoan?pids=0"><button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button></a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
<!---->