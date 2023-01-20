<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!--Data table CDNs-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>

 

<script>  
function logout(){  
alert("logout successfull..")
</script>

 

    </head>

<body>

 

        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
<div class="container">
<a class="nav-link click-scroll" href="#fixed">
 
<img src="images/agentlogo.jpg" class="logo img-fluid" alt="Kind Heart Charity">
<h4>AGENT DASHBOARD</h4> 

Welcome to  : 
<b>
<c:out value="${sessionScope.user}" />
</b>

</a>

 


<div class="collapse navbar-collapse" id="navbarNav">
<ul class="navbar-nav ms-auto">
<li class="nav-item">
<a class="nav-link click-scroll" href="#fixed"></a>
</li>
                        <li class="nav-item">
<a class="nav-link click-scroll" href="AgentDashboard1.jsp">Home</a>
</li>
 

                        <li class="nav-item">
<a class="nav-link click-scroll" href="ShowPolicyJsf1.xhtml">Policy Details</a>
</li>

 

                        <li class="nav-item">
<a class="nav-link click-scroll" href="ShowCustomer1.jsp">Customer Details</a>
</li>

 

                        <li class="nav-item">
<a class="nav-link click-scroll" href="ShowBooking.jsp">Booking Details</a>
</li>
<li class="nav-item">
<a class="nav-link click-scroll" href="ShowPayment.xhtml">Payment Details</a>
</li>
<li class="nav-item">
<a class="nav-link click-scroll" href="AgentLogin1.jsp" onclick="alert('You are going to be logged out!!')">Logout

</a>
</li>

</ul>
</div>
</div>
</nav>
 <section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<!-- Student Profile -->
<div class="student-profile py-4">
  <div class="container">
   
      
      <div class="col-lg-12">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
           
          </div>
          
      
             <div class="card-body pt-0">
            <!--  -->
             <div class="col-rt-4" id="float-right">
 
            <!-- Ad Here -->
            <center>
            <h4  > "A Smart investment today for Secure Tomorrow"</h4>
            
        </div>
             <center>
            <img alt="Not Available" src="images/c1.png">
           
            
         <div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">
 
            <!-- Ad Here -->
            
        </div>
       
    </div>
</div>
          </div>
        </div>
        
        
         
    </div>
  </div>
</div>
<!-- partial -->
           
    		</div>
		</div>
    </div>
</section>

 

        <!-- JAVASCRIPT FILES -->
<!--         <script src="js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/click-scroll.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>

 

    </body>
</html>