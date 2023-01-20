<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>profile</title>

    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>

    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="css/demo.css" />
    
	    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="CustomerDashboard.jsp"/>
   <jsp:useBean id="beanDao" class="com.infinite.insuranceNew.CustomerDAO"/>
   
   
<div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">
 
           
            
        </div>
    </div>
</div>

<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<!-- Student Profile -->
<div class="student-profile py-4">
  <div class="container">
   
      
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          
              
              <jsp:useBean id="customer" class="com.infinite.insuranceNew.CustomerDAO"/>
  	  <c:set var="cid" value="${param.customerId}"/>
    <c:set var="cusId" value="${cid}" scope="session"/>
    
    <c:forEach var="c" items="${beanDao.showCustomerUser(sessionScope.user)}">
        
      <%--   <tr><td width="2%">${c.customerId}</td></tr>
           <tr>  <td width="2%">${c.customerName}</td></tr>
            <tr> <td width="2%">${c.customerDesignation}</td></tr>
            <tr> <td width="2%">${c.customerEmail}</td></tr>
             <tr><td width="2%">${c.customerAddress}</td></tr>
             <tr><td width="2%">${c.customerContact}</td></tr> --%>
             
             
             <div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
              <th width="5%">Customer Id</th>
                <td width="2%">${c.customerId}</td>
              </tr>
              <tr>
               <th width="5%">Customer Name</th>
               <td width="2%">${c.customerName}</td>
              </tr>
              <tr>
                 <th width="5%">Customer Designation</th>
               <td width="2%">${c.customerDesignation}</td>
              </tr>
              <tr>
                 <th width="5%">Customer Email</th>
                <td width="2%">${c.customerEmail}</td>
              </tr>
               <tr>
                 <th width="5%">Customer Address</th>
                <td width="2%">${c.customerAddress}</td>
              </tr>
              
              <tr>
                 <th width="5%"> Customer Contact</th>
                <td width="2%">${c.customerContact}</td>
              </tr>
     	</c:forEach>
            </table>
            
         <div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">
 
            <!-- Ad Here -->
            
        </div>
        <div class="col-rt-2">
            <ul>
                <li><a href="UpdateCustomer.jsp" >Update</a></li>
            </ul>
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
     


    <!-- Analytics -->

	</body>
</html>