<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
   <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">
        <link href="./Style.css" rel="stylesheet">
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./Style.css">

 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>profile</title>

</head>
<body>
<jsp:include page="cslaps.jsp"/>
		
			         <div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-center">
 
            <!-- Ad Here -->
            
        </div>
        <div class="col-rt-4">
           
        </div>
    </div>
</div>
<jsp:useBean id="bid" class="com.infinite.insuranceNew.BookingDetails"></jsp:useBean>
<jsp:useBean id="dao" class="com.infinite.insuranceNew.bookingDAO"/>
<div id="login-form-wrap">

	<form method="get"    id="login-form" action="LapsCheck.jsp">
		<h2>Lapse Check</h2>
		
	
		Booking ID:
		<select name="bookingId" >
		
		<c:forEach var="id" items="${dao.showBookingDetails1(cid)}">
		
		 <option value="${id.bookingId}">
		<c:out value=" ${id.bookingId}"/>
		 </option>
		</c:forEach>
		</select>
			</br></br>
	
		<input type='submit'  class="form-control" value="Show Info" />
	</form>
	</div>
	<c:if test="${param.bookingId!=null}">
		<jsp:useBean id="beanDao" class="com.infinite.insuranceNew.InsuranceDAO"/>
		<c:set var="bid" value="${param.bookingId}"/>
		<c:out value="${beanDao.lapsCheck(bid)}"/>
		<c:set var="clearAmount" value="${beanDao.lapsRenewAmount(bid)}"/>
		<c:set var="booking" value="${beanDao.searchByBookId(bid)}"/>
		
		
		<div id="login-form-wraps">
	<form    id="login-form"  action="LapsUpdate.jsp">
		<center>
		<h5>View Details</h5>
			Booking Id : 
			<input type="text" name="bookingId" value="${param.bookingId}"  required/><br/><br/>
			Policy Id : 
			<input type="text" name="policyId" value="${booking.policyID}"  required/> <br/><br/>
			Customer Id : 
			<input type="text" name="customerId" value="${booking.customerId}" required /> <br/><br/>
			Clearance Payment : 
			<input type="number" name="paymentClear" value="${clearAmount}"  required/> <br/><br/>
			
			<input type="submit"  class="form-control" value="Finalize" onclick="alert('PolicyLapsed Amount Refunded')"/>
		</center>
	</form>
	</c:if>
	
</body>
</html>
