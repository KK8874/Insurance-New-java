<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Insurance Policy </title>

        <!-- CSS FILES -->        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">
<!--


-->

    </head>
    
    <body> 
<jsp:useBean id="dao" class="com.infinite.insuranceNew.CustomerDAO" />
<c:set var="cust" value="${dao.searchCustomerById(sessionScope.user)}" />
        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">
                 <a class="nav-link click-scroll" href="#fixed">
                    <img src="images/agentlogo.jpg" class="logo img-fluid" alt="Kind Heart Charity">
                     <h4>CUSTOMER DASHBOARD</h4> 
                      <small>Booking Policy </small>
                  
                </a>


                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                     <li class="nav-item">
                            <a class="nav-link click-scroll" href="#fixed"></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="BookingPolicy.jsp">Book Policy</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="BookingDetailsUser.jsp">Booking Details</a>
                        </li>

 						 <li class="nav-item">
                            <a class="nav-link click-scroll" href="CustomerDashboard1.jsp" onclick="alert('You are now back to Customer Dashboard!!')">Back
                           
                            </a>
                        </li>
                     
                    </ul>
                </div>
            </div>
        </nav>
<%--  Welcome to  : 
<b>
<c:out value="${sessionScope.user}" />
</b> --%>
Welcome to  : 
<b>
<c:out value="${cust.customerName}" />
</b>

        <!-- JAVASCRIPT FILES -->
        <!-- <script src="js/jquery.min.js"></script> -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/click-scroll.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>