<%-- 
    Document   : OTP
    Created on : May 28, 2023, 5:51:54 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP Page</title>
        <style>
            /* Reset các giá trị padding và margin */
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

            /* Thiết lập kiểu chữ cho tiêu đề */
            h4,p  {
                font-family: 'Montserrat', sans-serif;
                font-weight: bold;
                color: red;
                text-align: center;
            }
            .input_otp {
                padding: 10px;
                border: 2px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                color: #333;
                margin-top: 20px;
                margin-bottom: 20px;
                text-align: center;
            }

            .input_otp:focus {
                outline: none;
                border-color: #1e90ff;
            }


            /* Thiết lập kiểu chữ cho nội dung thông báo */


            /* Thiết lập kiểu chữ cho link */
            a:hover {
                color: #00688B;
            }

            /* Thiết lập kiểm soát cho phần countdown */
            #timer {
                font-weight: bold;
                font-size: 24px;
                display: block;
                margin-top: 30px;
                animation: pulse 1s ease-in-out infinite;
            }

            /* Thiết lập style cho nút resubmit */
            input[type="submit"] {
                background: #008CBA;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                margin-bottom: 20px;
            }

            /* Thiết lập hover cho nút resubmit */
            input[type="submit"]:hover {
                background: #005A7D;
                transform: scale(1.05);
            }
            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.05);
                }
                100% {
                    transform: scale(1);
                }
            }

        </style>
    </head>
    <body>
        <div class="form-container">
            <form action="changePass" method="post">
                Hello ${sessionScope.userName} <br/>
                <input class="input_otp" type="text" name="otp" size="30"> <br>
                <input type="submit" value="Submit">
                <p>An OTP has been resent to your email.</p>
                <p>Time remaining: <span id="timer"></span></p>

                <p id="resendLink" style="visibility: hidden;">Click <a href="#">here</a> to resend OTP</p>
                <h4>${err}</h4>
            </form>
        </div>


        <!-- Add JavaScript code for countdown timer  -->
        <script type="text/javascript">
            var countdown;
            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;
                countdown = setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);
                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;
                    display.textContent = minutes + ":" + seconds;
                    if (--timer < 0) {
                        clearInterval(countdown);
                        display.textContent = "Time's up!";
                        enableResendLink();
                    }
                }, 1000);
            }

            function enableResendLink() {
                var resendLink = document.getElementById("resendLink");
                resendLink.style.visibility = "visible";
                resendLink.onclick = function () {
                    // Call your resend OTP function or redirect the user to the resend page
                    // Example: window.location.href = "resend_otp.jsp";
                    window.location.href = "changePass";
                };
            }

            window.onload = function () {
                var duration = 60; // Duration in seconds (e.g., 5 minutes)
                var display = document.querySelector('#timer');
                startTimer(duration, display);
            };
        </script>
    </body>
</html>