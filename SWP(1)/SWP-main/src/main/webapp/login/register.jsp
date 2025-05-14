<%-- 
    Document   : resgister
    Created on : May 14, 2023, 11:48:52 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <!-- css -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style_1.css" rel='stylesheet' type='text/css' media="all" />
        <!-- /css -->
        <style>

            body {
                background:url(images/background.jpg) no-repeat;
                background-attachment:fixed;
                background-position:center;
                background-size:cover;
                -webkit-background-size:cover;
                -moz-background-size:cover;
                -o-background-size:cover;
                font-family: 'Raleway', sans-serif;
                font-weight:300;
            }
            .form{
                margin-top: 100px;
            }
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
                background-color: blue;
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


        </style>
    </head>
    <body>

        <form class="form" action="register" method="post">
            <div class="form-control w3layouts"> 
                <input value="${requestScope.acc_re}" type="text" id="firstname" name="account" placeholder="Account" title="Please enter your First Name" required="" autocomplete="off">
            </div>
            <div class="form-control agileinfo">	
                <input value="${requestScope.pass_re}" type="password" class="lock" name="pass" placeholder="Password" id="password1" required="" autocomplete="off">
            </div>
            <div class="form-control w3layouts">	
                <input value="${requestScope.email_re}" type="email" id="email" name="email" placeholder="mail@example.com" title="Please enter a valid email" required="" autocomplete="off">
            </div>
             <div class="recap_container">
                    <img id="captchaImg" src="CaptchaServlet" alt="captch"/>
                    <button class="recap" type="button" onclick="refreshCaptcha()">RECAP</button>

             </div>
            <input type="text" name="captcha"><br><br>		

            <input type="submit" class="register" value="Register">
            <h3 style="color:red;text-align: center;" >${notice}</h3>
        </form>
    </body>

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
</html>