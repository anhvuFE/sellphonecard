<%-- 
    Document   : login
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/login.css" rel="stylesheet">
        <style>
            body {
                background-image: url(images/background.jpg);
                background-size: cover;
            }
            .captcha-container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                max-width: 400px;
            }
            .captcha-image {
                display: flex;
                align-items: center;
                font-size: 24px;
                font-weight: bold;
                letter-spacing: 10px;
                /*text-transform: uppercase;*/
                background-color: #f7f7f7;
                padding: 10px;
                margin :auto;
            }

            .captcha-char {
                display: inline-block;
                position: relative;
                margin-right: 10px;
                transform: skew(-20deg);
                animation: jitter 0.2s infinite alternate;
                color: #444;
                background-color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
                -webkit-user-select: none; /* Safari */
                -moz-user-select: none; /* Firefox */
                -ms-user-select: none; /* IE10+/Edge */
                user-select: none;
            }
            #captchaImg{
                margin-bottom: 10px;
            }

            .captcha-char:before {
                content: "";
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                height: 1px;
                background-color: ${sessionScope.rgb};
                transform: translateY(-50%);
            }
            .recap_container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .recap {
                margin-top: 0;
            }

            button[type="button"] {
                background-color: #008CBA;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 5px;
                cursor: pointer;
            }
            button[type=button]:hover {
                background-color: #005A7D;
                transform: scale(1.05);
            }
            /* Thiết lập màu chữ của placeholder là trắng */
            .form__input::placeholder {
                color: #fff;
            }
            .text--center{
                color: #fff;
            }
            .icon{
                color:#fff;
            }




            @keyframes jitter {
                from {
                    transform: skew(-20deg) translateX(0);
                }
                to {
                    transform: skew(-20deg) translateX(5px);
                }
            }

        </style>
        <script>
            function refreshCaptcha() {
                // Lấy đối tượng button theo class
                var btn = document.querySelector(".recap");

                // Thay đổi màu background của button
                btn.style.backgroundColor = "#4CAF50";

                // Tạo timeout để button trở lại màu ban đầu sau một khoảng thời gian
                setTimeout(function () {
                    btn.style.backgroundColor = "";
                }, 300);

                // Gọi đến server để lấy captcha mới
                // ...
            }

        </script>
    </head>

    <body class="align">

        <div class="grid">
            <form action="login" method="post" class="form login">

                <div class="form__field">
                    <label for="account"><svg class="icon">
                        <use xlink:href="#icon-user"></use>
                        </svg><span class="hidden">Account</span></label>
                        <input value="${requestScope.acc}" autocomplete="account" id="login__username" type="text" name="account" class="form__input" placeholder="Username" required>
                </div>

                <div class="form__field">
                    <label for="pass"><svg class="icon">
                        <use xlink:href="#icon-lock"></use>
                        </svg><span class="hidden">Password</span></label>
                        <input value="${requestScope.pass}" autocomplete="pass" id="login__password" type="password" name="pass" class="form__input" placeholder="Password" required>
                </div>

                <div class="recap_container">
                    <img id="captchaImg" src="CaptchaServlet" alt="captch"/>
                    <button class="recap" type="button" onclick="refreshCaptcha()">RECAP</button>

                </div>


                <div class="form__field">
                    <label for="captcha"><svg class="icon">
                        <use xlink:href="#icon-lock"></use>
                        </svg><span class="hidden">Captcha</span></label>
                    <input id="login__username" type="text" name="captcha" class="form__input" placeholder="Captcha" required>
                </div>
                <div class="form__field">
                    <a href="login?forgotPass=1">Forgot password?</a>
                </div>
                <h3 style="color: red;">${requestScope.err}</h3>
                <div class="form__field">
                    <input type="submit" name="login" value="Sign In">
                </div>

            </form>

            <p class="text--center">Not a member ? <a href="login?signUp=1"> Sign up now</a> <svg class="icon">
                <use class="right" xlink:href="#icon-arrow-right"></use>
                </svg></p>

        </div>

        <svg xmlns="http://www.w3.org/2000/svg" class="icons">
    <symbol id="icon-arrow-right" viewBox="0 0 1792 1792">
        <path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z" />
    </symbol>
    <symbol id="icon-lock" viewBox="0 0 1792 1792">
        <path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z" />
    </symbol>
    <symbol id="icon-user" viewBox="0 0 1792 1792">
        <path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z" />
    </symbol>
    </svg>

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
