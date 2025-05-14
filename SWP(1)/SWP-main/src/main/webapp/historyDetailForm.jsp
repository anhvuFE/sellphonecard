<%-- 
    Document   : historyDetailForm
    Created on : Jun 23, 2023, 4:35:26 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History detail form</title>
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
            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 40px;
                table-layout: fixed;
                overflow: hidden;
                white-space: nowrap;
            }

            th {
                background-color: #009688;
                color: white;
                font-weight: bold;
                font-size: 16px;
                text-align: center;
                padding: 8px;
                border: 1px solid #ddd;
            }

            td {
                text-align: center;
                padding: 10px;
                border: 1px solid #ddd;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

        </style>
        

        <div id="overlay"></div>
        <div id="anotherFormContainer">
            <button class="modal-close js-modal-close" onclick="closeForm()">
                <i class="bi bi-x"></i>
            </button>
            <header class="modal-header">
                <i class="modal-heading-icon ti-bag"></i>
                History Buy
            </header>
            <div class="modal-body">
                <form action="buying" method="get">
                    Menh gia
                    <p id="menhGia"></p>
                    Nha mang
                    <p id="nhaMang"></p>
                    Ngày hết hạn :
                    <p id="date"></p>
                    <table id="cardTable">
                        <thead>
                            <tr>
                                <th>Card seri</th>
                                <th>Card code</th>
                                <!-- Add more table headers as needed -->
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>


                </form>

            </div>

        </div>
        
        <script>
            function closeForm() {
                var overlay = document.getElementById("overlay");
                var formContainer = document.getElementById("anotherFormContainer");
                overlay.style.display = "none";
                formContainer.style.display = "none";
                clearTable();
            }
            function clearTable() {
                var table = document.getElementById("cardTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 0; i < rows.length; i++) {
                    var cells = rows[i].getElementsByTagName("td");

                    for (var j = 0; j < cells.length; j++) {
                        cells[j].textContent = ""; // Clear the text content of each cell
                    }
                }
            }
            
        </script>
    </body>
</html>
