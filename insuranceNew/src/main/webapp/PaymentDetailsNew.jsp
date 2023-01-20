<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment</title>
<style>
   <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">
        <link href="./Style.css" rel="stylesheet">
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./Style.css">
<link rel="stylesheet" href="style.css" >
<style>

</style>


 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>profile</title>


<body>
<jsp:include page="cdpay.jsp"/>
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
<div id="login-form-wrapss">
<h2>Payment Check</h2>
	<form method="get"  id="login-form" action="PaymentDetailsNew.jsp" style="align:center;">
	Booking ID:
		<select name="bookingId"  required>
		
		<c:forEach var="id" items="${dao.showBookingDetails1(cid)}">
		
		 <option value="${id.bookingId}">
		<c:out value=" ${id.bookingId}"/>
		 </option>
		</c:forEach>
		</select><br/><br/>
			
			<input type="submit"  class="form-control" value="Search" />
		
	</form>
	</div>
<c:if test="${param.bookingId!=null}">
		<jsp:useBean id="beanDao" class="com.infinite.insuranceNew.InsuranceDAO"/>
		<c:set var="bid" value="${param.bookingId}"/>
		<c:set var="paymentInfo" value="${beanDao.paymentInfo(bid)}"/>
		
		
	
		
	<div class="container p-3 my-4 border">
		<div class="container-fluid">
		          <form method="get"    id="login-form" action="PaymentDone2Dummy.jsp">
  		<div class="row" style="width: 80%">
  		<div class="col-sm-6">
  		<h5 style="align:Center;"> View the Details </h5>
            <table class="table table-bordered" style="align-content: center">
            <tr>
     <th width="2%">
		    Payment Id : </th>
	<td width="2%">
			<input type="text" name="paymentId" value="${paymentInfo.paymentntId}" readonly required/> </td></tr>
		 <tr>
    <th width="2%">
    	 Booking Id : </th>
	<td width="2%">
		<input type="text" name="bookingId" value="${paymentInfo.bookingId}"  readonly required/> </td></tr>
		 <tr>
     <th width="2%">
     	Customer Id : </th>
	<td width="2%">
		<input type="text" name="customerId" value="${paymentInfo.customerId}"  readonly required/></td></tr>
		</table>
		</div></div>
		 <div class="column">
  
            <table class="table table-bordered">
            <tr>
	 <th width="2%"> 
	 	Policy Id : </th>
	<td width="2%">
		<input type="text" name="policyId" value="${paymentInfo.policyId}"  readonly required/> </td></tr>
            <tr>
     <th width="2%">
		Policy name : </th>
		<td width="2%">
		<input type="text" name="policyName" value="${paymentInfo.policyName}"  readonly required/> </td></tr>
	 <tr>
     <th width="2%">
		Installment to be Paid Now :</th> 
		<td width="2%">
		<input type="number" name="installment" value="${paymentInfo.totalAmountToPayInEveryMode}" readonly required/></td></tr>
		 <tr>
     <th width="2%">
		Payment Date :</th> 
		<td width="2%">
		<input type="date" name="paymentDate" value="${paymentInfo.paymentDate}"  readonly required/> </td></tr>
		 <tr>
     <th width="2%">
		Next Payment Date : </th>
		<td width="2%">
		<input type="date" name="nextPayment" value="${paymentInfo.nextDayPayment}"   readonly required/> </td></tr>
		</table></div>
		 <div class="col-rt">
		<input type="submit"    class="form-control" value="Pay" /></div></div></div>
	</form>
	</table>
	</c:if>
</body>
</html>