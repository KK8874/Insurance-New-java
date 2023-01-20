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

<script>  
function logout(){  
alert("logout successfull..")
</script>

    </head>
    
    <body> 
<jsp:useBean id="dao" class="com.infinite.insuranceNew.CustomerDAO" />
<c:set var="cust" value="${dao.searchCustomerById(sessionScope.user)}" />
        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">
                 <a class="nav-link click-scroll" href="#fixed">
                    <img src="images/agentlogo.jpg" class="logo img-fluid" alt="Kind Heart Charity">
                     <h4>CUSTOMER DASHBOARD</h4> 
                  
                </a>


                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                     <li class="nav-item">
                            <a class="nav-link click-scroll" href="#fixed"></a>
                        </li>

<li class="nav-item">
                            <a class="nav-link click-scroll" href="CustomerDashboard1.jsp">Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="CustomerBookPolicy.jsp">Book Policy</a>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="PaymentDetailsNew.jsp"> Payment Details </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link click-scroll"  href="LapsCheck.jsp"> Lapsed Details</a>
                        </li>
                             <li class="nav-item">
                            <a class="nav-link click-scroll"  href="DummyProfile1.jsp">Profile</a>
                        </li>
 						 <li class="nav-item">
                            <a class="nav-link click-scroll" href="CustomerLogin.jsp" onclick="alert('You are going to be logged out!!')">Logout
                           
                            </a>
                        </li>
                     
                    </ul>
                </div>
            </div>
        </nav>
 <%-- Welcome to  : 
<b>
<c:out value="${sessionScope.user}" />
</b>
<c:set var="cid" value="${sessionScope.user}" scope="session" /> --%>
Welcome to  : 
<b>
<c:out value="${cust.customerName}" />
</b>
<c:set var="cid" value="${sessionScope.user}" scope="session" />
<c:set var="name" value="${cust.customerName}" scope="session" />
<!-- partial -->
           
    		</div>
		</div>
    </div>
</section>
        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/click-scroll.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>