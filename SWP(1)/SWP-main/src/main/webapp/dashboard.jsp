<%-- 
    Document   : dashboard
    Created on : Jun 18, 2023, 3:55:13 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

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

        <script>
            showNotification: function (from, align) {
                var type = ['success', 'info', 'warning', 'danger'];
                var color = Math.floor((Math.random() * 4) + 1);

                $.notify({
                    icon: "nc-icon nc-app",
                    message: "Welcome to <b>Sell card phone</b> - an online phone card sales system."

                }, {
                    type: type[color],
                    timer: 8000,
                    placement: {
                        from: from,
                        align: align
                    }
                });
                function logout() {
                    // Clearing the session attribute
                    session.removeAttribute("account");
                    // Redirecting to the login page
                    window.location.href = "logout";
                }
                $(document).ready(function () {
                    // Get the current page URL
                    var url = window.location.href;

                    // If the URL matches the dashboard link, add the "active" class to its <li> element

                });


        </script>
        <style>
            table {
                border-collapse: collapse;
            }

            th,
            td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
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
                        <li class="nav-item ">
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
                <!-- End Navbar -->


                <div class="content">
                    <c:if test="${check==2}">
                        <table border="1">
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Mệnh giá</th>
                            <th>Số lượng</th>
                            <th>Nhà mạng</th>
                            <th>Ngày hết hạn</th>
                            <th>Mô tả</th>
                            <th>Ngày mua</th>
                                <c:forEach items="${products}" var="p">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.name}</td>
                                    <td>${p.sellPrice}</td>
                                    <td>${p.amount}</td>
                                    <td>${p.supplier}</td>
                                    <td>${p.expirationDate}</td>
                                    <td>${p.description}</td>
                                    <td>${p.createdAt}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${check==3}">
                        <h3 style="color: red;">Total money: ${total}</h3>
                        <table border="1">
                            <th>STT</th>
                            <th>Mệnh giá</th>
                            <th>Số lượng</th>
                            <th>Ngày mua</th>
                            <th>Description</th>
                            <th>Account</th>
                            <th>Details</th>
                                <c:forEach items="${requestScope.transactions}" var="p">
                                <tr>
                                    <td>${p.id}</td>
                                    <td>${p.buyPrice}</td>
                                    <td>${p.buyAmount}</td>
                                    <td>${p.createdAt}</td>
                                    <td>${p.description}</td>
                                    <td>${p.accountId}</td>
                                    <td><a class="btn btn-primary" href="detailHistory?id=${p.id}">Xem chi tiết</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                        
                    </c:if>
                    <c:forEach begin="${1}" end="${soTrang}" var="i">
                        <a class="${i==page?"active":""}" href="myhistorybill?page=${i}"> ${i} </a>
                    </c:forEach>

                    <c:if test="${check==1}">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card ">
                                        <div class="card-header ">
                                            <h4 class="card-title">Email Statistics</h4>
                                            <p class="card-category">Last Campaign Performance</p>
                                        </div>
                                        <div class="card-body ">
                                            <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
                                            <div class="legend">
                                                <i class="fa fa-circle text-info"></i> Open
                                                <i class="fa fa-circle text-danger"></i> Bounce
                                                <i class="fa fa-circle text-warning"></i> Unsubscribe
                                            </div>
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-clock-o"></i> Campaign sent 2 days ago
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card ">
                                        <div class="card-header ">
                                            <h4 class="card-title">Users Behavior</h4>
                                            <p class="card-category">24 Hours performance</p>
                                        </div>
                                        <div class="card-body ">
                                            <div id="chartHours" class="ct-chart"></div>
                                        </div>
                                        <div class="card-footer ">
                                            <div class="legend">
                                                <i class="fa fa-circle text-info"></i> Open
                                                <i class="fa fa-circle text-danger"></i> Click
                                                <i class="fa fa-circle text-warning"></i> Click Second Time
                                            </div>
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-history"></i> Updated 3 minutes ago
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card ">
                                        <div class="card-header ">
                                            <h4 class="card-title">2023 Sale Card</h4>
                                            <p class="card-category">All products </p>
                                        </div>
                                        <div class="card-body ">
                                            <div id="chartActivity" class="ct-chart"></div>
                                        </div>
                                        <div class="card-footer ">
                                            <div class="legend">
                                                <i class="fa fa-circle text-info"></i> Viettel
                                                <i class="fa fa-circle text-danger"></i> Mobiphone
                                            </div>
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-check"></i> Data information certified
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card  card-tasks">
                                        <div class="card-header ">
                                            <h4 class="card-title">Tasks</h4>
                                            <p class="card-category">Backend development</p>
                                        </div>
                                        <div class="card-body ">
                                            <div class="table-full-width">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-check">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox" value="">
                                                                        <span class="form-check-sign"></span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                            <td class="td-actions text-right">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-check">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox" value="" checked>
                                                                        <span class="form-check-sign"></span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                            <td class="td-actions text-right">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-check">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox" value="" checked>
                                                                        <span class="form-check-sign"></span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                            </td>
                                                            <td class="td-actions text-right">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-check">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox" checked>
                                                                        <span class="form-check-sign"></span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>Create 4 Invisible User Experiences you Never Knew About</td>
                                                            <td class="td-actions text-right">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-check">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox" value="">
                                                                        <span class="form-check-sign"></span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>Read "Following makes Medium better"</td>
                                                            <td class="td-actions text-right">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-check">
                                                                    <label class="form-check-label">
                                                                        <input class="form-check-input" type="checkbox" value="" disabled>
                                                                        <span class="form-check-sign"></span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>Unfollow 5 enemies from twitter</td>
                                                            <td class="td-actions text-right">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="card-footer ">
                                            <hr>
                                            <div class="stats">
                                                <i class="now-ui-icons loader_refresh spin"></i> Updated 3 minutes ago
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav>
                            <ul class="footer-menu">
                                <li>
                                    <a href="#">
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Company
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Portfolio
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Blog
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </footer>
            </div>
        </div>

    </body>

    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/plugins/bootstrap-switch.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <script src="assets/js/plugins/chartist.min.js"></script>
    <script src="assets/js/plugins/bootstrap-notify.js"></script>
    <script src="assets/js/light-bootstrap-dashboard.js" type="text/javascript"></script>
    <script src="assets/js/demo.js"></script>
    <script type="text/javascript">
                $(document).ready(function () {
                    // Javascript method's body can be found in assets/js/demos.js
                    demo.initDashboardPageCharts();

                    demo.showNotification();

                });
    </script>

</html>

