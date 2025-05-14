<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Admin</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/css/demo.css" rel="stylesheet" />
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <style>
            .header{
                background-color: #009688;
                height: 70px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 25px;
                color: #fff;
                margin-bottom: 20px;

            }
            body {
                /*background:url(images/ExcelForBusiness_WEB_1600x900.jpg) no-repeat;*/
                /*                background-attachment:fixed;
                                background-position:center;
                                background-size:cover;
                                -webkit-background-size:cover;
                                -moz-background-size:cover;
                                -o-background-size:cover;
                                font-family: Arial, sans-serif;
                                z-index: 9999;*/
                z-index: 9999;

            }
            h2 {

                text-align: center;

            }



            form {

                margin-top: 150px;
                margin-left: auto;
                margin-right: auto;
                width: 50%;
                border: 2px solid #ccc;

                padding-bottom: 10px;
                border-radius: 5px;
                background-color: #fff;
            }

            input[type="file"] {
                display: block;
                margin: 10px 0;
            }

            p {
                color: #fff;
                text-align: center;
            }
            .submit{
                background-color: #009688;
                border: none;
                color: #fff;
                width: 15%;
                font-size: 14px;
                text-transform: uppercase;
                padding: 10px;
            }
            .submit :hover {
                cursor: pointer;
                opacity: 0.9;
            }
            .network{
                padding: 0 20px;
            }

        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-image="assets/img/sidebar-5.jpg">
                <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
    
            Tip 2: you can also add an image using data-image tag
                -->
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="" class="simple-text">
                            Admin sell card
                        </a>
                    </div>
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="manageProduct">
                                <i class="nc-icon nc-circle-09"></i>
                                <p>Manage Product</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="adminTransaction">
                                <i class="nc-icon nc-notes"></i>
                                <p>Transaction history</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="import.jsp">
                                <i class="nc-icon nc-bell-55"></i>
                                <p>Import excel file</p>
                            </a>
                        </li>
                        <li class="nav-item active active-pro">
                            <a class="nav-link active" href="upgrade.jsp">
                                <i class="nc-icon nc-alien-33"></i>
                                <p>Upgrade to PRO</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="dashboard.jsp"> Admin </a>
                        <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar burger-lines"></span>
                            <span class="navbar-toggler-bar burger-lines"></span>
                            <span class="navbar-toggler-bar burger-lines"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <ul class="nav navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a href="#" class="nav-link" data-toggle="dropdown">
                                        <i class="nc-icon nc-palette"></i>
                                        <span class="d-lg-none">Dashboard</span>
                                    </a>
                                </li>
                                <li class="dropdown nav-item">
                                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                        <i class="nc-icon nc-planet"></i>
                                        <span class="notification">5</span>
                                        <span class="d-lg-none">Notification</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Notification 1</a>
                                        <a class="dropdown-item" href="#">Notification 2</a>
                                        <a class="dropdown-item" href="#">Notification 3</a>
                                        <a class="dropdown-item" href="#">Notification 4</a>
                                        <a class="dropdown-item" href="#">Another notification</a>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="nc-icon nc-zoom-split"></i>
                                        <span class="d-lg-block">&nbsp;Search</span>
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="#pablo">
                                        <span class="no-icon">Account</span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="no-icon">Dropdown</span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                        <div class="divider"></div>
                                        <a class="dropdown-item" href="#">Separated link</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="login">
                                        <span class="no-icon">Log out</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div>
                    <div class="myform">
                        <form  action="UploadFile" method="post" enctype="multipart/form-data" >
                            <header class="header">
                                <h2>Import Excel</h2>
                            </header>
                            <div class="network">
                                Chọn nhà mạng:
                                <select name="supplier">
                                    <option value="viettel">Viettel</option>
                                    <option value="mobifone">Mobifone</option>
                                    <option value="vinaphone">Vinaphone</option>
                                    <option value="vietnamobile">Vietnamobile</option>
                                </select>
                                <br/><br/>
                                Chọn mệnh giá
                                <select name="menhGia">
                                    <option value="20000">20,000 VND</option>
                                    <option value="50000">50,000 VND</option>
                                    <option value="50000">100,000 VND</option>
                                    <option value="50000">200,000 VND</option>
                                    <option value="50000">500,000 VND</option>
                                </select>
                                <br/><br/>

                                File to Upload: <input type="file" name="file" accept=".xlsx, .xls">
                                <input class="submit" type="submit" value="Import">
                            </div>



                        </form>
                    </div>
                </div>
            </div>



        </div>

    </body>
</html>