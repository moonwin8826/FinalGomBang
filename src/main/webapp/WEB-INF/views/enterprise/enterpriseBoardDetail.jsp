<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://geoapi.heartrails.com/api/geoapi.js"></script>
	<script src="./resources/ckeditor/ckeditor.js"></script>
    <title>The Nest - Real Estate HTML Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">

    <!-- External CSS libraries -->
    <link rel="stylesheet" type="text/css" href="resources/user/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/user/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="resources/user/css/bootstrap-submenu.css">
    <link rel="stylesheet" type="text/css" href="resources/user/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="resources/user/css/leaflet.css" type="text/css">
    <link rel="stylesheet" href="resources/user/css/map.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/user/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="resources/user/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" type="text/css" href="resources/user/fonts/linearicons/style.css">
    <link rel="stylesheet" type="text/css"  href="resources/user/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" type="text/css"  href="resources/user/css/dropzone.css">
    <link rel="stylesheet" type="text/css"  href="resources/user/css/magnific-popup.css">

    <!-- Custom stylesheet -->
    <link rel="stylesheet" type="text/css" href="resources/user/css/style.css">
    <link rel="stylesheet" type="text/css" id="style_sheet" href="resources/user/css/skins/default.css">

    <!-- Favicon icon -->
    <link rel="shortcut icon" href="resources/user/img/favicon.ico" type="image/x-icon" >

    <!-- Google fonts -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPlayfair+Display:400,700%7CRoboto:100,300,400,400i,500,700">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link rel="stylesheet" type="text/css" href="resources/user/css/ie10-viewport-bug-workaround.css">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script type="text/javascript" src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="resources/user/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.min.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="page_loader"></div>

<!-- Top header start -->
<header class="top-header hidden-xs" id="top">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="list-inline">
                   <!--  <a href="tel:1-8X0-666-8X88"><i class="fa fa-phone"></i>1-8X0-666-8X88</a>
                    <a href="tel:info@themevessel.com"><i class="fa fa-envelope"></i>info@themevessel.com</a> -->
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <ul class="top-social-media pull-right">
                   <c:if test="${sessionScope.enterpriseLoginID==null}">
                    <li>
                        <a href="customerLogingo" class="sign-in"><i class="fa fa-sign-in"></i> Login</a>
                    </li>
                    <li>
                        <a href="customerSignupgo" class="sign-in"><i class="fa fa-user"></i> Register</a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.enterpriseLoginID!=null}">
                    <li>
                        <a href="enterpriseLogout" class="sign-in"><i class="fa fa-sign-in"></i> Logout</a>
                    </li>
                    <li>
                        <a href="goUpdate?enterprise_ID=${sessionScope.enterpriseLoginID}" class="sign-in"><i class="fa fa-user">
                        
                        </i> Enterprise Modify
                        </a>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- Top header end -->

<!-- Main header start -->
<header class="main-header">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navigation" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="goHome">
                   <img src="/GomBang/img/gombangLogo.png" style="margin-right:50px;padding:19px 0;">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown active">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Profile<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                              <li><a href="enterpriseMyProfile">User profile</a></li>
                              <li><a href="myproperties">My Properties</a></li>
                              <li><a href="submitProperty">Submit New Property</a></li>
                              <li><a href="goprofilepassword">Forgot Password</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Reservation<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="reservationwait">Reservation Wait</a></li> 
                            <li><a href="reservationcomplete">Reservation Complete</a></li> 
                             <li><a href="tradeCompleteList?enterprise_ID=${sessionScope.enterpriseLoginID}">Trade complete</a></li>  
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Board<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goEnterpriseboard">EnterpriseBoard</a></li> 
                        </ul>
                    </li>
                      <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Map<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goFullMap">Map</a></li> 
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right rightside-navbar">
                    <li>
                        <a href="submitProperty" class="button"> 
                            Submit Property
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- Main header end -->
<!-- Sub banner start -->
<div class="sub-banner overview-bgi">
    <div class="overlay">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Enterprise Board Detail</h1>
                <ul class="breadcrumbs">
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Sub Banner end -->

<!-- Properties details page start -->
<div class="content-area  properties-details-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <!-- Header -->
                <div class="heading-properties clearfix sidebar-widget" style="margin-bottom:0px;">
                    <div class="pull-left">
                    	<h3 style="font-size:40px;"><span>TITLE : </span>${enterpriseBoard.enterpriseBoard_Title}</h3>
                    </div>
                </div>
                <div class="heading-properties clearfix sidebar-widget">
                    <div class="pull-right" style="float:left! important;">
                    	<h3 style="font-size:15px; margin-right:20px;"><span>NUMBER : </span>${enterpriseBoard.enterpriseBoard_Seq}</h3>
                    </div>
                    <div class="pull-right" style="float:left! important;">
                    	<h3 style="font-size:15px; margin-right:20px;"><span>WRITER : </span>${enterpriseBoard.enterprise_ID}</h3>
                    </div>
                    <div class="pull-right" style="float:left! important;">
                    	<h3 style="font-size:15px; margin-right:20px;"><span>DATE : </span>${enterpriseBoard.enterpriseBoard_Indate}</h3>
                    </div>
                    <div class="pull-right" style="float:left! important;">
                        <h3 style="font-size:15px;"><span>HITCOUNT : </span>${enterpriseBoard.enterpriseBoard_HitCount}</h3> 
                    </div>
                </div>
                <!-- Properties details section start -->
                <div class="Properties-details-section sidebar-widget">
                    <!-- Properties detail slider start -->
                    <div class="properties-detail-slider simple-slider mb-40">
                        <div id="carousel-custom" class="carousel slide" data-ride="carousel">
                            <div class="carousel-outer">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    ${enterpriseBoard.enterpriseBoard_Content}
                                    <!-- <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item active">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div> -->
                                </div>
                                <!-- Controls -->
                                <!-- <a class="left carousel-control" href="#carousel-custom" role="button" data-slide="prev">
                                    <span class="slider-mover-left no-bg t-slider-r pojison" aria-hidden="true">
                                        <i class="fa fa-angle-left"></i>
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-custom" role="button" data-slide="next">
                                    <span class="slider-mover-right no-bg t-slider-l pojison" aria-hidden="true">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a> -->
                            </div>
                            <!-- Indicators -->
                            <!-- <ol class="carousel-indicators thumbs visible-lg visible-md">
                                <li data-target="#carousel-custom" data-slide-to="0" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="1" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="2" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="3" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="4" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="5" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="6" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="7" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                            </ol> -->
                        </div>
                    </div>
                    <!-- Properties detail slider end -->

                    <!-- Advanced search start -->
                    <div class="advabced-search hidden-lg hidden-md">
                        <div class="main-title-2">
                            <h1><span>Advanced</span> Search</h1>
                        </div>

                        <form method="GET">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-status" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Property Status</option>
                                    <option>For Sale</option>
                                    <option>For Rent</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="location" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Location</option>
                                    <option>United States</option>
                                    <option>United Kingdom</option>
                                    <option>American Samoa</option>
                                    <option>Belgium</option>
                                    <option>Cameroon</option>
                                    <option>Canada</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-types" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Property Types</option>
                                    <option>Residential</option>
                                    <option>Commercial</option>
                                    <option>Land</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="area-from" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Area From</option>
                                    <option>1000</option>
                                    <option>800</option>
                                    <option>600</option>
                                    <option>400</option>
                                    <option>200</option>
                                    <option>100</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bedrooms">
                                            <option>Bedrooms</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bathroom">
                                            <option>Bathroom</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="balcony">
                                            <option>Balcony</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" data-live-search="true" name="garage">
                                            <option>Garage</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="range-slider">
                                <label>Area</label>
                                <div data-min="0" data-max="10000" data-unit="Sq ft" data-min-name="min_area" data-max-name="max_area" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="range-slider">
                                <label>Price</label>
                                <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="form-group">
                                <button class="search-button">Search</button>
                            </div>
                        </form>
                    </div>
                    <!-- Advanced search end -->

                    <!-- Property description start -->
                    <!-- <div class="panel-box properties-panel-box Property-description">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab" aria-expanded="true">Description</a></li>
                            <li class=""><a href="#tab2default" data-toggle="tab" aria-expanded="false">Condition</a></li>
                            <li class=""><a href="#tab3default" data-toggle="tab" aria-expanded="false">Amenities</a></li>
                            <li class=""><a href="#tab4default" data-toggle="tab" aria-expanded="false">Floor Plans</a></li>
                            <li class=""><a href="#tab5default" data-toggle="tab" aria-expanded="false">Video</a></li>
                        </ul>
                        <div class="panel with-nav-tabs panel-default">
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="tab1default">
                                        <div class="main-title-2">
                                            <h1><span>Description</span></h1>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla. Nulla posuere sapien vitae lectus suscipit, et pulvinar nisi tincidunt. Aliquam erat volutpat. Curabitur convallis fringilla diam sed aliquam. Sed tempor iaculis massa faucibus feugiat. In fermentum facilisis massa, a consequat purus viverra a. Aliquam pellentesque nibh et nibh feugiat gravida. Maecenas ultricies, diam vitae semper placerat, velit risus accumsan nisl, eget tempor lacus est vel nunc. Proin accumsan elit sed neque euismod fringilla. Curabitur lobortis nunc velit, et fermentum urna dapibus non. Vivamus magna lorem, elementum id gravida ac, laoreet tristique augue. Maecenas dictum lacus eu nunc porttitor, ut hendrerit arcu efficitur.</p>
                                        <br>
                                        <p>Nam mattis lobortis felis eu blandit. Morbi tellus ligula, interdum sit amet ipsum et, viverra hendrerit lectus. Nunc efficitur sem vel est laoreet, sed bibendum eros viverra. Vestibulum finibus, ligula sed euismod tincidunt, lacus libero lobortis ligula, sit amet molestie ipsum purus ut tortor. Nunc varius, dui et sollicitudin facilisis, erat felis imperdiet felis, et iaculis dui magna vitae diam. Donec mattis diam nisl, quis ullamcorper enim malesuada non. Curabitur lobortis eu mauris nec vestibulum. Nam efficitur, ex ac semper malesuada nisi odio consequat dui, hendrerit vulputate odio dui vitae massa. Aliquam tortor urna, tincidunt</p>
                                    </div>
                                    <div class="tab-pane fade features" id="tab2default">
                                        Properties condition start
                                        <div class="properties-condition">
                                            <div class="main-title-2">
                                                <h1><span>Condition</span></h1>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="condition">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>3 Beds
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Bathroom
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="condition">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>4800 sq ft
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>TV
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="condition">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>1 Garage
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Balcony
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        Properties condition end
                                    </div>
                                    <div class="tab-pane fade technical" id="tab3default">
                                        Properties amenities start
                                        <div class="properties-amenities">
                                            <div class="main-title-2">
                                                <h1><span>Amenities</span></h1>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="amenities">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Air conditioning
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Balcony
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Pool
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>TV
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Gym
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="amenities">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Wifi
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Parking
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Double Bed
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Iron
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="amenities">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Telephone
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Jacuzzi
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Alarm
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Garage
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        Properties amenities end
                                    </div>
                                    <div class="tab-pane fade" id="tab4default">
                                        Floor Plans start
                                        <div class="floor-plans">
                                            <div class="main-title-2">
                                                <h1><span>Floor Plans</span></h1>
                                            </div>
                                            <table>
                                                <tbody><tr>
                                                    <td><strong>Size</strong></td>
                                                    <td><strong>Rooms</strong></td>
                                                    <td><strong>2 Bathrooms</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>1600</td>
                                                    <td>3</td>
                                                    <td>2</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <img src="http://placehold.it/708x359" alt="floor-plans" class="img-responsive">
                                        </div>
                                        Floor Plans end
                                    </div>
                                    <div class="tab-pane fade" id="tab5default">
                                        Inside properties start 
                                        <div class="inside-properties">
                                            Main Title 2
                                            <div class="main-title-2">
                                                <h1><span>Video</span></h1>
                                            </div>
                                            <iframe src="https://www.youtube.com/embed/5e0LxrLSzok" allowfullscreen=""></iframe>
                                        </div>
                                        Inside properties end
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- Property description end -->
                </div>
                <!-- Properties details section end -->

                <!-- Location start -->
                <!-- <div class="location sidebar-widget">
                    <div class="map">
                        Main Title 2
                        <div class="main-title-2">
                            <h1><span>Location</span></h1>
                        </div>
                        <div id="map" class="contact-map"></div>
                    </div>
                </div> -->
                <!-- Location end -->

                <!-- Properties details section start -->
                <div class="Properties-details-section sidebar-widget">
                    <!-- Properties comments start -->
                    <div class="properties-comments mb-40" id="replyContent2">
                        <!-- Comments section start -->
                        
                        <div class="comments-section" >
                            <!-- Main Title 2 -->
                            <div class="main-title-2">
                                <h1><span>Comments </span> Section</h1>
                            </div>
							<!-- cf:foreach ?????? ?????? -->
							<c:forEach var="enterpriseCommentList" items="${enterpriseCommentList3}">
							
                            <ul class="comments">
                                <li>
                                    <div class="comment">
                                        <!-- <div class="comment-author">
                                            <a href="#">
                                                <img src="http://placehold.it/60x60" alt="avatar-5">
                                            </a>
                                        </div> -->
                                        <div class="comment-content">
                                            <div class="comment-meta">
                                                <%-- <div class="comment-meta-author">
                                                    ${customerCommentList.customerComment_Title}
                                                </div> --%>
                                                <div class="comment-body">
                                                ${enterpriseCommentList.enterpriseComment_Content}
                                                	<div class="comment-meta-reply">
                                                    <a href="#">Reply</a>
	                                                </div>
	                                                <div class="comment-meta-date">
	                                                    <span class="hidden-xs">${enterpriseCommentList.enterpriseComment_Indate}</span>
	                                                </div>
                                            	</div>
                                                
                                            </div>
                                            <div class="clearfix"></div>
                                            
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>    
                        </div>
                        <!-- Comments section end -->
                    </div>
                    <!-- Properties comments end -->

                    <!-- Contact 1 start -->
                    <div class="contact-1">
                        <div class="contact-form">
                            <!-- Main Title 2 -->
                            <div class="main-title-2">
                                <h1><span>INSERT</span>REPLY</h1>
                            </div>
                            <form id="contact_form" action="insertEnterpriseComment" method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group subject">
                                            <input type="text" name="enterpriseComment_Title" id="enterpriseComment_Title" class="input-text" placeholder="??????">
                                        </div>
                                    </div> -->
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group message">
                                            <textarea class="input-text" name="enterpriseComment_Content" id="enterpriseComment_Content" placeholder="Content"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <div class="form-group send-btn mb-0">
                                            <button type="button" id="submitReply2" class="button-md button-theme" data-val="${enterpriseBoard.enterpriseBoard_Seq}">?????? ??????</button>
                                            <input type="hidden" id="enterprise_ID" name="enterprise_ID" value="${enterpriseBoard.enterprise_ID}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Contact 1 end -->
                </div>
                <!-- Properties details section end -->
            </div>
            <!-- <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                Sidebar start
                <div class="sidebar right">
                    Search contents sidebar start
                    <div class="sidebar-widget hidden-xs hidden-sm">
                        <div class="main-title-2">
                            <h1><span>Advanced</span> Search</h1>
                        </div>

                        <form method="GET">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-status" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Property Status</option>
                                    <option>For Sale</option>
                                    <option>For Rent</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="location" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Location</option>
                                    <option>United States</option>
                                    <option>United Kingdom</option>
                                    <option>American Samoa</option>
                                    <option>Belgium</option>
                                    <option>Cameroon</option>
                                    <option>Canada</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-types" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Property Types</option>
                                    <option>Residential</option>
                                    <option>Commercial</option>
                                    <option>Land</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="area-from" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Area From</option>
                                    <option>1000</option>
                                    <option>800</option>
                                    <option>600</option>
                                    <option>400</option>
                                    <option>200</option>
                                    <option>100</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bedrooms">
                                            <option>Bedrooms</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bathroom">
                                            <option>Bathroom</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="balcony">
                                            <option>Balcony</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" data-live-search="true" name="garage">
                                            <option>Garage</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="range-slider">
                                <label>Area</label>
                                <div data-min="0" data-max="10000" data-unit="Sq ft" data-min-name="min_area" data-max-name="max_area" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="range-slider">
                                <label>Price</label>
                                <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="form-group mb-0">
                                <button class="search-button">Search</button>
                            </div>
                        </form>
                    </div>
                    Search contents sidebar end

                    Popular posts start
                    <div class="sidebar-widget popular-posts">
                        <div class="main-title-2">
                            <h1><span>Recently</span> Properties</h1>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-1">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Sweet Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-2">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Modern Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-3">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Beautiful Single Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                    </div>

                    Category posts start
                    <div class="sidebar-widget category-posts">
                        <div class="main-title-2">
                            <h1><span>Popular</span> Category</h1>
                        </div>
                        <ul class="list-unstyled list-cat">
                            <li><a href="#">Single Family </a> <span>(45)  </span></li>
                            <li><a href="#">Apartment  </a> <span>(21)  </span></li>
                            <li><a href="#">Condo </a> <span>(23)  </span></li>
                            <li><a href="#">Multi Family </a> <span>(19)  </span></li>
                            <li><a href="#">Villa </a> <span>(19)  </span></li>
                            <li><a href="#">Other  </a> <span>(22)  </span></li>
                        </ul>
                    </div>

                    Social media start
                    <div class="social-media sidebar-widget clearfix">
                        Main Title 2
                        <div class="main-title-2">
                            <h1><span>Social</span> Media</h1>
                        </div>
                        Social list
                        <ul class="social-list">
                            <li><a href="#" class="facebook-bg"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="linkedin-bg"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#" class="google-bg"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#" class="rss-bg"><i class="fa fa-rss"></i></a></li>
                        </ul>
                    </div>

                    Mortgage calculator start
                    <div class="sidebar-widget contact-1 mortgage-calculator">
                        <div class="main-title-2">
                            <h1><span>Mortgage</span> Calculator</h1>
                        </div>
                        <div class="contact-form">
                            <form id="agent_form" action="index.html" method="GET" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Property Price</label>
                                            <input type="text" class="input-text" placeholder="$87.000">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Interest Rate (%)</label>
                                            <input type="text" class="input-text" placeholder="10%">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Period In Months</label>
                                            <input type="text" class="input-text" placeholder="10 Months">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Down Payment</label>
                                            <input type="text" class="input-text" placeholder="$36,300">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-0">
                                            <button class="search-button">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                Sidebar end
            </div> -->
        </div>
    </div>
</div>
<!-- Properties details page end -->



<!-- Footer start -->
<footer class="main-footer clearfix">
    <div class="container">
        <!-- Footer info-->
        <div class="footer-info">
            <div class="row">
                <!-- About us -->
                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Contact Us</h1>
                        </div>
                        <p>
                            SCITMASTERS, 36rd C class Group no.3,
                        </p>
                        <ul class="personal-info">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                Address: ????????????????????? SCIT??????????????????
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                Email:<a href="sjydiablo@naver.com">sjydiablo@naver.com</a>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                Phone: <a href="tel:+82-00-0000-0000">+82-00-0000-0000</a>
                            </li>
                            <li>
                                <!-- <i class="fa fa-fax"></i>
                                Fax: +55 4XX-634-7071 -->
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- <!-- Links -->
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Links</h1>
                        </div>
                        <ul class="links">
                            <li>
                                <a href="goHome">Home</a>
                            </li>
                            <li>
                                <a href="goFullMap">Property-list-fullmap</a>
                            </li>
                            <li>
                                <a href="searchItem3">Advanced Search</a>
                            </li>
                            <li>
                                 <a href="goCustomerboard">Q&A</a>
                            </li>
                            <li>
                            	<a href="customerMyProfile?customer_ID=${sessionScope.customer.customer_ID }">User profile</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Recent cars -->
                 <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-item popular-posts">
                        <div class="main-title-2">
                            <h1>Popular Posts</h1>
                        </div>
                         <c:forEach var="popularlist" items="${popularlist}" varStatus="status">
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="/GomBang/img/${popularlist.saveName}" alt="small-properties-1" class="img-responsive hidden-xs" style="width: 90px; height: 63px;">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="customerItemDetail?forSale_Seq=${popularlist.forSale_Seq}">${popularlist.forSale_Title}</a>
                                </h3>
                                <p>${popularlist.forSale_Indate}</p>
                                <div class="price">
                                   ${popularlist.forSale_Rent}
                                </div>
                            </div>
                        </div>
                       <!--  <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-2">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Modern Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-3">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Beautiful Single Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div> -->
                        </c:forEach>
                    </div>
                </div>
                <!-- Subscribe -->
                <!-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Subscribe</h1>
                        </div>
                        <div class="newsletter clearfix">
                            <p>
                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                            </p>

                            <form action="#" method="post">
                                <div class="form-group">
                                    <input class="nsu-field btn-block" id="nsu-email-0" type="text" name="email" placeholder="Enter your Email Address" required="">
                                </div>
                                <div class="form-group mb-0">
                                    <button type="submit" class="button-sm button-theme btn-block">
                                        Subscribe
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</footer>
<!-- Footer end -->

<!-- Copy right start -->
<div class="copy-right">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 col-sm-12">
                &copy;  2019 <a href="http://themevessel.com/" target="_blank"></a>.  SCITMASTERS, 36rd C class Group no.3,
            </div>
            <div class="col-md-4 col-sm-12">
                <ul class="social-list clearfix">
                    <!-- <li>
                        <a href="https://www.facebook.com/profile.php?id=100008832071756" class="facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://twitter.com/SimJinyong?lang=ko" class="twitter">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="linkedin">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="google">
                            <i class="fa fa-google-plus"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="rss">
                            <i class="fa fa-rss"></i>
                        </a>
                    </li> -->
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Copy end right-->

<!-- Car Video Modal -->
<div class="modal property-modal fade" id="propertyModal" tabindex="-1" role="dialog" aria-labelledby="carModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="carModalLabel">
                    Find Your Dream House
                </h5>
                <p>
                    123 Kathal St. Tampa City,
                </p>
                <span class="ratings">
                    <i class="fa fa-star s1 active" data-score="1"></i>
                    <i class="fa fa-star s2 active" data-score="2"></i>
                    <i class="fa fa-star s3 active" data-score="3"></i>
                    <i class="fa fa-star s4 active" data-score="4"></i>
                    <i class="fa fa-star s5 active" data-score="5"></i>
                </span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row modal-raw">
                    <div class="col-lg-5 modal-left">
                        <div class="modal-left-content">
                            <div class="bs-example" data-example-id="carousel-with-captions">
                                <div class="carousel slide" id="properties-carousel" data-ride="carousel">
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item">
                                            <img src="http://placehold.it/450x300 " alt="best-properties">
                                        </div>
                                        <div class="item">
                                            <img src="http://placehold.it/450x300 " alt="best-properties">
                                        </div>
                                        <div class="item active">
                                            <iframe class="modalIframe" src="https://www.youtube.com/embed/5e0LxrLSzok" allowfullscreen></iframe>
                                        </div>
                                    </div>

                                    <a class="control control-prev" href="#properties-carousel" role="button" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="control control-next" href="#properties-carousel" role="button" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="description">
                                <h3>Description</h3>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.But also the leap into electronic typesetting, remaining,</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 modal-right">
                        <div class="modal-right-content bg-white">
                            <strong class="price">
                                $178,000
                            </strong>
                            <section>
                                <h3>Features</h3>
                                <div class="features">
                                    <ul class="bullets">
                                        <li><i class="flaticon-air-conditioner"></i>Air conditioning</li>
                                        <li><i class="flaticon-wifi"></i>Wifi</li>
                                        <li><i class="flaticon-transport"></i>Parking</li>
                                        <li><i class="flaticon-people-2"></i>Pool</li>
                                        <li><i class="flaticon-weightlifting"></i>Gym</li>
                                        <li><i class="flaticon-building"></i>Alarm</li>
                                        <li><i class="flaticon-old-telephone-ringing"></i>Balcony</li>
                                        <li><i class="flaticon-monitor"></i>TV</li>
                                    </ul>
                                </div>
                            </section>
                            <section>
                                <h3>Overview</h3>
                                <dl>
                                    <dt>Model</dt>
                                    <dd>Maxima</dd>
                                    <dt>Condition</dt>
                                    <dd>Brand New</dd>
                                    <dt>Year</dt>
                                    <dd>2018</dd>
                                    <dt>Price</dt>
                                    <dd>$178,000</dd>
                                </dl>
                            </section>
                            <section>
                                <h3>Last Review</h3>
                                <div class="ratings" data-rating="5">
                                    <span>
                                        <i class="fa fa-star s1 active" data-score="1"></i>
                                        <i class="fa fa-star s2 active" data-score="2"></i>
                                        <i class="fa fa-star s3 active" data-score="3"></i>
                                        <i class="fa fa-star s4 active" data-score="4"></i>
                                        <i class="fa fa-star s5 active" data-score="5"></i>
                                    </span>
                                </div>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's </p>
                            </section>
                            <a href="properties-details.html" class="btn button-sm button-theme">Show Detail</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="resources/user/js/jquery-2.2.0.min.js"></script>
<script src="resources/user/js/bootstrap.min.js"></script>
<script src="resources/user/js/bootstrap-submenu.js"></script>
<script src="resources/user/js/rangeslider.js"></script>
<script src="resources/user/js/jquery.mb.YTPlayer.js"></script>
<script src="resources/user/js/wow.min.js"></script>
<script src="resources/user/js/bootstrap-select.min.js"></script>
<script src="resources/user/js/jquery.easing.1.3.js"></script>
<script src="resources/user/js/jquery.scrollUp.js"></script>
<script src="resources/user/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="resources/user/js/leaflet.js"></script>
<script src="resources/user/js/leaflet-providers.js"></script>
<script src="resources/user/js/leaflet.markercluster.js"></script>
<script src="resources/user/js/dropzone.js"></script>
<script src="resources/user/js/jquery.filterizr.js"></script>
<script src="resources/user/js/jquery.magnific-popup.min.js"></script>
<script src="resources/user/js/maps.js"></script>
<script src="resources/user/js/app.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>
<!-- Custom javascript -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0N5pbJN10Y1oYFRd0MJ_v2g8W2QT74JE"></script>
<script>
$("#submitReply2").on("click",function(){
	$.ajax({
		
		url:"insertEnterpriseComment",
		data:{
			enterpriseBoard_Seq:$(this).attr("data-val"),
			enterpriseComment_Content:$("#enterpriseComment_Content").val(),
			enterprise_ID:$("#enterprise_ID").val()	
		},
		type:"post",
		success:function(data){
			console.log("here : " + data);
			$("#replyContent2").html(data);
			$("#enterpriseComment_Content").val("");
		},
		error:function(data){
			console.log("error : " + data);
		}
		
	});
	
});

    function LoadMap(propertes) {
        var defaultLat = 40.7110411;
        var defaultLng = -74.0110326;
        var mapOptions = {
            center: new google.maps.LatLng(defaultLat, defaultLng),
            zoom: 15,
            scrollwheel: false,
            styles: [
                {
                    featureType: "administrative",
                    elementType: "labels",
                    stylers: [
                        {visibility: "off"}
                    ]
                },
                {
                    featureType: "water",
                    elementType: "labels",
                    stylers: [
                        {visibility: "off"}
                    ]
                },
                {
                    featureType: 'poi.business',
                    stylers: [{visibility: 'off'}]
                },
                {
                    featureType: 'transit',
                    elementType: 'labels.icon',
                    stylers: [{visibility: 'off'}]
                },
            ]
        };
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
        var infoWindow = new google.maps.InfoWindow();
        var myLatlng = new google.maps.LatLng(40.7110411, -74.0110326);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map
        });
        (function (marker) {
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent("" +
                        "<div class='map-properties contact-map-content'>" +
                        "<div class='map-content'>" +
                        "<p class='address'>123 Kathal St. Tampa City, </p>" +
                        "<ul class='map-properties-list'> " +
                        "<li><i class='fa fa-phone'></i>  +0477 8556 552</li> " +
                        "<li><i class='fa fa-envelope'></i>  info@themevessel.com</li> " +
                        "<li><a href='index.html'><i class='fa fa-globe'></i>  http://http://themevessel.com</li></a> " +
                        "</ul>" +
                        "</div>" +
                        "</div>");
                infoWindow.open(map, marker);
            });
        })(marker);
    }
    LoadMap();
    
   
</script>
</body>
