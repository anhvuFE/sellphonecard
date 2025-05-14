<%-- 
    Document   : rePass
    Created on : May 14, 2023, 11:49:40 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            /* Thiết lập font chữ và background cho body */
            body {
                font-family: Arial, sans-serif;
                background: #f2f2f2;
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
                background-color: #f2f2f2;
            }

            .form-container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            /* Thiết lập độ rộng của form */
            form {
                max-width: 500px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
            }

            /* Thiết lập style cho input */
            input[type="text"], input[type="submit"] {
                display: block;
                width: 90%;
                padding: 10px;
                margin-bottom: 20px;
                border: none;
                border-radius: 5px;
                background-color: #f2f2f2;
            }

            input[type="submit"] {
                background-color: #008CBA;
                color: white;
                cursor: pointer;
            }
            input[type=submit]:hover {
                background-color: #005A7D;
                transform: scale(1.05);
            }

            button[type="button"] {
                background-color: #008CBA;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 20px;
                cursor: pointer;
                
            }
            button[type=button]:hover {
                background-color: #005A7D;
                transform: scale(1.05);
            }

            /* Thiết lập style cho h4 */
            h4 {
                color: red;
            }
            .recap_container{
                display: flex;
                align-items: center;

            }
            .recap{
                margin-top: 5px;
                padding-top: 10px;
                margin-right: 30px;
            }
            #captchaImg{
                padding-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class ="form-container">
            <form action="rePass" method="post">
                <label for="account">Account:</label>
                <input type="text" name="account" id="account" required>
                <div class ="recap_container">
                    <button class="recap" type="button" onclick="refreshCaptcha()">recap</button>
                    <img id="captchaImg" src="CaptchaServlet" alt="captch"/>
                </div>

                <label for="captcha">Captcha:</label>
                <input type="text" name="captcha" id="captcha" required>

                <input type="submit" value="Send OTP">
                <h4>${err}</h4>
            </form>
        </div>

        <script>
            function refreshCaptcha() {
                fetch('/SWP/CaptchaServlet', {

                    method: 'POST'
                })
                        .then(Response => Response.blob())
                        .then(Blob => {
                            const imageURL = URL.createObjectURL(Blob);
                            const imageElement = document.getElementById("captchaImg");
                            imageElement.src = imageURL;
                        })
                        .catch(Error => console.error(Error))
            }

        </script>
    </body>
</html>