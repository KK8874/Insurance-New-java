<%@page import="com.infinite.insuranceNew.DummyDAO"%>
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
<center>

<div id="login-form-wrapss">
<h5>Confirmation of payment</h5>

<form method="get"  id="login-form" >
 Payment Id : 
	<input type="text" name="paymentntId" value="${param.paymentId}" readonly required/> <br/><Br/>
	Booking Id : 
	<input type="text" name="bookingId" value="${param.bookingId}"  readonly required/> <Br/><br/>
	Customer Id :
	<input type="text" name="customerId" value="${param.customerId}" readonly required/><Br/><br/> 
	Policy ID : 
	<input type="text" name="policyId" value="${param.policyId}" readonly required/> <br/><br/> 
	
   policy name : 
		<input type="text" name="policyName" value="${param.policyName}"  readonly required/> <br/><br/>
	Installment : 
	<input type="text" name="totalAmountToPayInEveryMode" value="${param.installment}"  readonly required/> <br/><br/> 
	Payment Date : 
	<input type="text" name="paymentDate" value="${param.paymentDate}" readonly required /> <br/><br/> 
	Next Payment Date : 
	<input type="text" name=nextDayPayment value="${param.nextPayment}" readonly required/> <br/><br/> 
	<input type="submit" class="form-control" value="Confirm Payment" onclick="alert('Payment  has done Successfully')";/>
	<a href="PaymentDetailsNew.jsp">Cancel payment</a>
	
		
</form>
</div>
<c:if test="${param.paymentntId!=null}">
<jsp:useBean id="beanDao" class="com.infinite.insuranceNew.DummyDAO"/>
	<c:set var="sqlPaymentDate" value="${beanDao.convertDate(param.paymentDate)}"/>
	<c:set var="sqlnextDayPayment" value="${beanDao.convertDate(param.nextDayPayment)}"/>
	
	
	
	<jsp:useBean id="beanPayment" class="com.infinite.insuranceNew.Payment"/>
	<jsp:setProperty property="paymentntId" name="beanPayment" value="${param.paymentntId}"/>
	<jsp:setProperty property="policyName" name="beanPayment" value="${param.policyName}"/>
	
	<jsp:setProperty property="bookingId" name="beanPayment" value="${param.bookingId}"/>
  
	<jsp:setProperty property="customerId" name="beanPayment" value="${param.customerId}"/>
	<jsp:setProperty property="policyId" name="beanPayment" value="${param.policyId}"/>
	<jsp:setProperty property="totalAmountToPayInEveryMode" name="beanPayment" value="${param.totalAmountToPayInEveryMode}"/>
	<jsp:setProperty property="paymentDate" name="beanPayment" value="${sqlPaymentDate}"/>
	<jsp:setProperty property="nextDayPayment" name="beanPayment" value="${sqlnextDayPayment}"/>
	
	 <c:out value="${beanDao.confirmPayment(beanPayment)}"/> 
	 <jsp:forward page="ShowParticularPayment.jsp"></jsp:forward>
</c:if>
</body>
</html>