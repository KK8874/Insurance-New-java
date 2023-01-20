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
	<c:set var="bid" value="${param.bookingId}"/>
	<jsp:useBean id="beanDao" class="com.infinite.insuranceNew.InsuranceDAO"/>
	<jsp:useBean id="lapsedPolicy" class="com.infinite.insuranceNew.LapsedPolicy"/>
	<jsp:setProperty property="bookingId" name="lapsedPolicy" value="${param.bookingId}"/>
	<jsp:setProperty property="customerId" name="lapsedPolicy" value="${param.customerId}"/>
	<c:out value="${beanDao.lapsMe(lapsedPolicy)}"/>
<jsp:forward page="ViewRefunds.jsp"></jsp:forward>
	
</body>
</html>