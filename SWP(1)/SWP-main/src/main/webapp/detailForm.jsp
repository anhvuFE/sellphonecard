<%-- 
    Document   : detailForm
    Created on : Jun 18, 2023, 6:41:32 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product" %>
<%@page import="java.util.List" %>
<%@page import="dao.ListBuyOfShopDAO" %>
<%@page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"/>
        <%
            ListBuyOfShopDAO l = new ListBuyOfShopDAO();
            List<Product> productList = l.getAllProduct();
        %>

        <script>
            // Define a global variable to hold the product data
            var productList = [];
            var p = {};
            // Function to process the product data
            function processProductData(data) {
                productList = data;
            }
            processProductData(<%= new Gson().toJson(productList)%>);
        </script>

    </head>
    <body>
        <style>
            /* CSS for the overlapping form container */
            .blur {
                filter: blur(5px); /* Adjust the blur amount as desired */
                pointer-events: none; /* Prevents the blurred content from receiving pointer events */
            }
            #anotherFormContainer {
                background: #fff;
                width: 900px;
                max-width: calc(100%-32px);
                min-height: 250px;
                position: fixed;
                top: 20%;
                right: 0;
                left: 20%;
                bottom: 0;
                transform: translateY(-100px);
                animation: modalFadeIn ease 0.5s;
                display: none;
                z-index: 9999;
            }
            header.modal-header {
                background-color: #009688;
                height: 70px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 30px;
                color: #fff;
            }
            .modal-close {
                background-color: #009688;
                border: none;
                padding: 16px;
                position: absolute;
                right: 0;
                top: 0;
                color: #fff;
                /*padding: 16px;*/
                cursor: pointer;
                opacity: 0.9;
            }
            .modal-close :hover {
                opacity: 0.8;
            }
            .modal-close i {
                font-size: 15px;
            }
            .modal-body {
                padding: 16px;
            }
            .modal-label {
                display: block;
                font-size: 14px;
                margin-bottom: 5px;
            }
            .modal-input {
                border: 1px solid #ccc;
                width: 100%;
                padding: 10px;
                font-size: 14px;
                margin-bottom: 5px;
            }
            .submit{
                background-color: #009688;
                border: none;
                color: #fff;
                width: 100%;
                font-size: 14px;
                text-transform: uppercase;
                padding: 18px;
            }
            .submit :hover {
                cursor: pointer;
                opacity: 0.9;
            }
        </style>

        <div id="overlay"></div>
        <div id="anotherFormContainer">
            <button class="modal-close js-modal-close" onclick="closeForm()">
                <i class="bi bi-x"></i>
            </button>
            <header class="modal-header">
                <i class="modal-heading-icon ti-bag"></i>
                Sell Phone Card
            </header>
            <div class="modal-body">
                <form action="buying" method="get">
                    <h3>Detail information</h3>
                    <label class="modal-label" for="nhaMang">Nhà mạng:</label>
                    <input class="modal-input" type="text" id="nhaMang" name="supplier" readonly><br>

                    <label class="modal-label" for="menhGia">Mệnh giá:</label>
                    <input class="modal-input" type="text" id="menhGia" name="denomination" readonly><br>

                    <label class="modal-label" for="soLuong">Số lượng:</label>
                    <input class="modal-input" type="text" id="soLuong" name="quantity" readonly><br>

                    <label class="modal-label" for="mieuTa">Miêu tả:</label>

                    <input class="modal-input" type="text" id="mieuTa" value="" readonly><br>
                    <label class="modal-label" for="hetHan">Ngày hết hạn:</label> 
                    <input class="modal-input" type="text" id="hetHan" value="" readonly><br>
                    <input type="text" id="pId" name="id" hidden=""><br>

                    <input class="submit" type="submit" value="Buy">
                </form>

            </div>

        </div>

        <script>
            var id;
            function showAnotherForm() {
                var anotherFormContainer = document.getElementById("anotherFormContainer");
                anotherFormContainer.style.display = "block";
                var supplierInput = document.getElementById("supplier");
                var newSupplier = document.getElementById("nhaMang");
                newSupplier.value = supplierInput.value;

                var denominationInput = document.getElementById("denomination");
                var newDenomination = document.getElementById("menhGia");
                var supplierInputValue = supplierInput.value;
                newDenomination.value = denominationInput.value;

                var description;
                var expirationDate;

                outerLoop:for (var i = 0; i < productList.length; i++) {
                    var obj = productList[i];
                    for (var key in obj) {
                        var sellPrice = obj["sellPrice"];
                        var supplier = obj["supplier"];
                        var productId = obj["id"];
                        if (id == productId) {
                            description = obj["description"];
                            expirationDate = obj["expirationDate"];
                            break outerLoop;
                        }
                    }
                }

                var quantityInput = document.getElementById("quantity");
                var newQuantity = document.getElementById("soLuong");
                newQuantity.value = quantityInput.value;

                var description1 = document.getElementById("mieuTa");
                description1.value = description;
                var hetHan = document.getElementById("hetHan");
                hetHan.value = expirationDate;
                var pid = document.getElementById("pId");
                pid.value = id;

            }
            function validateForm() {
                var selectedSupplier = document.getElementById('supplier').value;
                if (selectedSupplier === '') {
                    alert('Chọn nhà mạng trước khi submit.');
                    return false;
                }
                var selectedDenomination = document.getElementById('denomination').value;
                if (selectedDenomination === '') {
                    alert('Chọn mệnh giá trước khi submit.');
                    return false;
                }
                var quantity = document.getElementById('quantity').value;
                if (quantity === '') {
                    alert('Chọn số lượng trước khi submit.');
                    return false;
                }

                return true;
            }
            function checkStatus() {
                var supplierInput = document.getElementById("supplier").value;
                var denominationInput = document.getElementById("denomination").value;
                var quantityInput = document.getElementById("quantity").value;
                outerLoop:for (var i = 0; i < productList.length; i++) {
                    var obj = productList[i];
                    for (var key in obj) {
                        var sellPrice = obj["sellPrice"];
                        var supplier = obj["supplier"];
                        var expirationDate = obj["expirationDate"];
                        var amount = obj["amount"];
                        var status = obj["status"];
                        var pId = obj["id"];
                        var check = false;
                        if (sellPrice == denominationInput && supplier == supplierInput) {
                            if (quantityInput > amount) {
                                if (amount == 0) {
                                    alert("san pham het hang");
                                } else {
                                    alert("so luong hang trong kho chi con " + amount +
                                            "vui long nhap lai");
                                }
                                return false;
                            }
                            id = pId;
                            check = true;
                            break outerLoop;
                        }
                    }
                }
                if (check == false) {
                    alert("san pham chua co trong kho");
                    return false;
                }
                return true;
            }
            function validateAndShowForm() {
                var checkStat = checkStatus();
                var isValid = validateForm();
                if (isValid && checkStat) {
                    showAnotherForm();
                }
                return isValid;
            }

            function closeForm() {
                var overlay = document.getElementById("overlay");
                var formContainer = document.getElementById("anotherFormContainer");
                overlay.style.display = "none";
                formContainer.style.display = "none";
            }



        </script>
    </body>
</html>
