<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GomBang - Administrator</title>
    <!-- Favicon -->
    <link rel="icon" href="resources/adminBoot/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="resources/adminBoot/assets/plugins/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />

    <!-- Animate.css Css -->
    <link href="resources/adminBoot/assets/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Font Awesome Css -->
    <link href="resources/adminBoot/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <!-- iCheck Css -->
    <link href="resources/adminBoot/assets/plugins/iCheck/skins/flat/_all.css" rel="stylesheet" />

    <!-- Switchery Css -->
    <link href="resources/adminBoot/assets/plugins/switchery/dist/switchery.css" rel="stylesheet" />

    <!-- Metis Menu Css -->
    <link href="resources/adminBoot/assets/plugins/metisMenu/dist/metisMenu.css" rel="stylesheet" />

    <!-- Jquery Datatables Css -->
    <link href="resources/adminBoot/assets/plugins/DataTables/media/css/dataTables.bootstrap.css" rel="stylesheet" />

    <!-- Pace Loader Css -->
    <link href="resources/adminBoot/assets/plugins/pace/themes/white/pace-theme-flash.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="resources/adminBoot/assets/css/style.css" rel="stylesheet" />

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="resources/adminBoot/assets/css/themes/allthemes.css" rel="stylesheet" />

    <!-- Demo Purpose Only -->
    <link href="resources/adminBoot/assets/css/demo/setting-box.css" rel="stylesheet" />
</head>
<body>
    <div class="all-content-wrapper">
        <!-- Top Bar -->
        <header>
            <nav class="navbar navbar-default">
                <!-- Search Bar -->
                <!-- #END# Search Bar -->

                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <i class="material-icons">swap_vert</i>
                        </button>
                        <a href="javascript:void(0);" class="left-toggle-left-sidebar js-left-toggle-left-sidebar">
                            <i class="material-icons">menu</i>
                        </a>
                        <!-- Logo -->
                        <a class="navbar-brand" href="GomBangAdmin">
                            <span class="logo-minimized">G.B</span>
                            <span class="logo">GomBang-Administrator</span>
                        </a>
                        <!-- #END# Logo -->
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="javascript:void(0);" class="toggle-left-sidebar js-toggle-left-sidebar">
                                    <i class="material-icons">menu</i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <!-- Call Search -->
                            <!-- #END# Call Search -->
                            <!-- Fullscreen Request -->
                            <!-- #END# Fullscreen Request -->
                            <!-- Email -->
                            <li class="dropdown email-menu">
                            <!-- #END# Email -->
                            <!-- Notifications -->
                            <!-- #END# Notifications -->
                            <!-- Tasks -->
                            <!-- #END# Tasks -->
                            <!-- User Menu -->
                            <li class="dropdown user-menu">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="resources/adminBoot/assets/images/avatars/face2.jpg" alt="User Avatar" />
                                    <span class="hidden-xs">${sessionScope.admin.admin_Name }</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">
                                        <img src="resources/adminBoot/assets/images/avatars/face2.jpg" alt="User Avatar" />
                                        <div class="user">
                                            ${sessionScope.admin.admin_Name }
                                            <div class="title">Front-end Developer</div>
                                        </div>
                                    </li>
                                    <li class="body">
                                        <ul>
                                            <li>
                                                <a href="../miscellaneous/profile.html">
                                                    <i class="material-icons">account_circle</i> Profile
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    <i class="material-icons">lock_open</i> Change Password
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <div class="row clearfix">
                                            <div class="col-xs-5">
                                                <a href="../examples/locked-screen.html" class="btn btn-default btn-sm btn-block">Log Off</a>
                                            </div>
                                            <div class="col-xs-2"></div>
                                            <div class="col-xs-5">
                                                <a href="javascript:void(0);" class="btn btn-default btn-sm btn-block">Log Out</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- #END# User Menu -->
                            <li class="pull-right">
                                <a href="javascript:void(0);" class="js-right-sidebar" data-close="true">
                                    <i class="material-icons">more_vert</i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- #END# Top Bar -->
        <!-- Left Menu -->
        <aside class="sidebar">
            <nav class="sidebar-nav">
                <ul class="metismenu">
                    <li class="title">
                        MAIN NAVIGATION
                    </li>
                    <li class="active">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">dashboard</i>
                            <span class="nav-label">GomBang</span>
                        </a>
                        <ul>
                            <li>
                                <a href="GomBangAdmin">Main Page</a>
                            </li>
                            <li >
                                <a href="#">Administrator</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">widgets</i>
                            <span class="nav-label">Basic Menu</span>
                        </a>
                        <ul>
                          
                            <li>
                                <a href="adminMessage">Message</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">assignment</i>
                            <span class="nav-label">Question Board Manage</span>
                        </a>
                        <ul>
                            <li>
                                <a href="adminEnterpriseBoardList">Enterprise</a>
                            </li>
                            <li>
                                <a href="adminCustomerBoardList">Customer</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">view_list</i>
                            <span class="nav-label">List Information</span>
                        </a>
                        <ul>
                             <li>
                                <a href="customerList">Customer List</a>
                            </li>
                            <li>
                                <a href="allEnterprisePrint">Enterprise List</a>
                            </li>
                            <li>
                                <a href="adminItemList">ForSale List</a>
                            </li>
                            <li>
                                <a href="adminReservationList">Reservation List</a>
                            </li>
                            <li>
                                <a href="adminTradeList">Trade List</a>
                            </li>
                        </ul>
                    </li>
                   
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">pie_chart</i>
                            <span class="nav-label">Static Information</span>
                        </a>
                         <ul>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">Enterprise Static </a>
                                	<ul>
                                		<li>
                                			 <a href="staticEnterprisePage" >Check </a>
                                		</li>
                                	</ul>
                            </li>
                            <li>
                               <a href="javascript:void(0);" class="menu-toggle">Customer Static </a>
                                	<ul>
                                		<li>
                                			 <a href="staticCustomerPage" >Check</a>
                                		</li>
                                	</ul>
                            </li>
                           <li>
                               <a href="javascript:void(0);" class="menu-toggle">ForSale Static</a>
                                	<ul>
                                		<li>
                                			 <a href="staticForSalePage" >Check</a>
                                		</li>
                                	</ul>
                            </li>
                            <li>
                               <a href="javascript:void(0);" class="menu-toggle">Board Static</a>
                                	<ul>
                                		<li>
                                			 <a href="staticBoardPage" >Check</a>
                                		</li>
                                	</ul>
                            </li>
                            <li>
                               <a href="javascript:void(0);" class="menu-toggle">Reservation Static</a>
                                	<ul>
                                		<li>
                                			 <a href="staticReservationPage" >Check</a>
                                		</li>
                                	</ul>
                            </li>
                        </ul> 
                    </li>
                    
                </ul>
            </nav>
        </aside>
        <!-- #END# Left Menu -->
        <!-- Right Sidebar -->
        <aside class="right-sidebar">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#tab_overview" data-toggle="tab">OVERVIEW</a></li>
                <li role="presentation"><a href="#tab_settings" data-toggle="tab">SETTINGS</a></li>
            </ul>
            <div class="tab-content">
                <div class="right-sidebar-close">
                    <i class="fa fa-times"></i>
                </div>
                <div role="tabpanel" class="tab-pane fade in active" id="tab_overview">
                    <div class="tab-container">
                        <label>UPCOMING EVENTS</label>
                        <ul>
                            <li>
                                <b class="display-block">Business Meeting</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Dinner With John</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Deadline Project For E-Commerce</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Last Check For E-Comerce</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Ask For Vacation</b> Lorem ipsum dolor sit amet
                            </li>
                        </ul>

                        <label>TODO LIST</label>
                        <ul>
                            <li>
                                <b class="display-block">Get To Know More HTML5</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Get To Know More CSS3 - Transitions</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Learn AngularJS</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Learn AngularJS Routing</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Get To Know More jQuery v3</b> Lorem ipsum dolor sit amet
                            </li>
                        </ul>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="tab_settings">
                    <div class="tab-container">
                        <label>GENERAL SETTINGS</label>
                        <ul>
                            <li>
                                <span>Report Panel Usage</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                            <li>
                                <span>Email Redirect</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" />
                                </div>
                            </li>
                        </ul>

                        <label>SYSTEM SETTINGS</label>
                        <ul>
                            <li>
                                <span>Notifications</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                            <li>
                                <span>Auto Updates</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                        </ul>

                        <label>ACCOUNT SETTINGS</label>
                        <ul>
                            <li>
                                <span>Offline</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" />
                                </div>
                            </li>
                            <li>
                                <span>Location Permission</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </aside>
        <!-- #END# Right Sidebar -->
        <section class="content">
            <div class="page-heading">
                <h1>?????? ??????</h1>  
                <ol class="breadcrumb">
                    <li><a href="GomBangAdmin">Main Page</a></li>
                    <li><a href="javascript:void(0);">Static</a></li>
                    <li class="active">Reservation</li>
                </ol>
            </div>
            <div class="page-body">
                <div class="row clearfix">
                    <!-- Line Chart -->
                    <!-- #END# Line Chart -->
                    <!-- Bar Chart -->
                    <!-- #END# Bar Chart -->
                    <!-- Area Chart -->
                    <!-- #END# Area Chart -->
                    <!-- Donut Chart -->
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                       	 <div class="panel panel-default">
                            <div class="panel-heading">Reservation - Visa</div>
                            <div class="panel-body">
                                <div id="bar_chart"></div>
                            </div>
                        </div>
                   	  </div>
               		
               		   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                       	 <div class="panel panel-default">
                            <div class="panel-heading">BookMark Popular ForSale</div>
                            <div class="panel-body">
                                <div id="bar_chart2"></div>
                            </div>
                        </div>
                   	  </div>
                   	  
                   	  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                       	 <div class="panel panel-default">
                            <div class="panel-heading">Resrvation Popular ForSale</div>
                            <div class="panel-body">
                                <div id="bar_chart3"></div>
                            </div>
                        </div>
                   	  </div>
                   	  
                   	  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                       	 <div class="panel panel-default">
                            <div class="panel-heading">Reservation Progress</div>
                            <div class="panel-body">
                                <div id="donut_chart"></div>
                            </div>
                        </div>
                   	  </div>
                    <!-- #END# Donut Chart -->
                </div>
            </div>
        </section>
        <!-- Footer -->
         <footer>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-sm-6">
                        Copyright &copy; 2019, <b>GomBang - SC_IT_MASTER C - 3</b>
                    </div>
                    <div class="col-sm-6 align-right">
                       GomBang - SC_IT_MASTER C - 3
                    </div>
                </div>
            </div>
        </footer>
        <!-- #END# Footer -->

    <!-- Jquery Core Js -->
    <script src="resources/adminBoot/assets/plugins/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/adminBoot/assets/plugins/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Pace Loader Js -->
    <script src="resources/adminBoot/assets/plugins/pace/pace.js"></script>

    <!-- Screenfull Js -->
    <script src="resources/adminBoot/assets/plugins/screenfull/src/screenfull.js"></script>

    <!-- Metis Menu Js -->
    <script src="resources/adminBoot/assets/plugins/metisMenu/dist/metisMenu.js"></script>

    <!-- Jquery Slimscroll Js -->
    <script src="resources/adminBoot/assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Switchery Js -->
    <script src="resources/adminBoot/assets/plugins/switchery/dist/switchery.js"></script>

    <!-- Morris.js Chart Js -->
    <script src="resources/adminBoot/assets/plugins/raphael/raphael.js"></script>
    <script src="resources/adminBoot/assets/plugins/morris.js/morris.js"></script>
	
	<!-- JQuery Datatables Js -->
    <script src="resources/adminBoot/assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/media/js/dataTables.bootstrap.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/dataTables.buttons.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.bootstrap.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.flash.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/jszip.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/pdfmake.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/vfs_fonts.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.html5.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.print.min.js"></script>
   
    <!-- Custom Js -->
    <script src="resources/adminBoot/assets/js/admin.js"></script>
    <script src="resources/adminBoot/assets/js/pages/charts/morris.js"></script>
    <script src="resources/adminBoot/assets/js/reservationStats.js"></script>
	<script src="resources/adminBoot/assets/js/pages/tables/jquery-datatables.js"></script>
	
    <!-- Google Analytics Code -->
    <script src="resources/adminBoot/assets/js/google-analytics.js"></script>

    <!-- Demo Purpose Only -->
    <script src="resources/adminBoot/assets/js/demo.js"></script>
    
</body>
</html>
</html>