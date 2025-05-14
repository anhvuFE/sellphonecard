<%-- 
    Document   : changePassword
    Created on : May 28, 2023, 8:03:51 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change PassWord Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            /* Thiết lập font chữ và background cho body */
            body {
                background:url(images/background.jpg) no-repeat;
                background-attachment:fixed;
                background-position:center;
                background-size:cover;
                -webkit-background-size:cover;
                -moz-background-size:cover;
                -o-background-size:cover;

                font-family: Arial, sans-serif;
                background: #f2f2f2;
            }


            .form-container {
                text-align: center;
                padding: 20px;
                margin-top: 200px;
            }


            /* Thiết lập độ rộng của form */
            form {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
            }
            input[type=text], input[type=password] {
                width: 60%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            input[type=submit] {
                background-color: #008CBA;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #005A7D;
                transform: scale(1.05);
            }

        </style>
    </head>
    <body>
        <div class="form-container">
            <form action="newPass" method="Post">
                Hello ${sessionScope.userName} <br/>
                <label for="pass">Pass:</label>
                <div class="input-container">
                    <input type="password" id="pass" name="pass">
                    <button type="button" class="toggle-password" onclick="togglePasswordVisibility()"><i class="fa fa-eye"></i></button>
                </div>
                <label for="rePass">Re-Pass:</label>
                <div class="input-container">
                    <input type="password" id="rePass" name="rePass">
                    <button type="button" class="toggle-password" onclick="togglePasswordVisibility()"><i class="fa fa-eye"></i></button>
                </div>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
    <script>
        function togglePasswordVisibility() {
            const passwords = document.querySelectorAll('input[type="password"]');
            const buttons = document.querySelectorAll('.toggle-password');
            for (let i = 0; i < passwords.length; i++) {
                if (passwords[i].type === 'password') {
                    passwords[i].type = 'text';
                    buttons[i].innerHTML = '<i class="fa fa-eye-slash"></i>';
                } else {
                    passwords[i].type = 'password';
                    buttons[i].innerHTML = '<i class="fa fa-eye"></i>';
                }
            }
        }

    </script>
</html>