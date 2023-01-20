<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./Style.css">
<title>Booking policy</title>
<link rel="stylesheet" href="style.css" >

 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>profile</title>
<script type="text/javascript">
 function validation()
{
if(document.login-form.select-pid.selectedIndex==0)
{ alert("Please select your  policyID");
document.login-form.select-pid.focus();
return false;
}
return true;
}

 function fun(){
var id=document.getElementById('select-pid').value;
if(id=="Select Policy ID"){
	alert("Select the valid ID..");
	return false;
}
return true;


	 }
 </script>
<style type="text/css">
new TomSelect('#select-pid',{
	create: true,
	sortField: {
		field: 'text',
		direction: 'asc'
	}
});
</style>
</head>
<body>
<jsp:include page="cd.jsp"/>
<div class="float-container">
<jsp:useBean id="dao" class="com.infinite.insuranceNew.PolicyDAO"></jsp:useBean>
<div id="login-form-wrap" >
<h5>Book details</h5>

<form id="login-form" action="BookingPolicy.jsp" onsubmit="return validation()">     
    
    <jsp:useBean id="cid" class="com.infinite.insuranceNew.Customer"></jsp:useBean>
    
<input type="text" name="customerId" placeholder="Enter Customer Id"  value="${sessionScope.user }" readonly >                           
</br></br>
PolicyName:
<select name="policyName" id="select-pid" required="required" >
<c:forEach var="id" items="${dao.showPolicy()}">

<option value="${id.policyName}">
<c:out value=" ${id.policyName}"/>
</option>
</c:forEach>
</select>
</br></br>    

 

<input type="submit" class="form-control" onclick="fun()" value="view Details "  />
</form>
 </div>
            </div>
    
           <c:set var="pid" value="0"/>
<c:set var="cid" value="0"/>
<c:if test="${param.customerId!= null && param.policyName!= null}">
<jsp:useBean id="beanDAO" class="com.infinite.insuranceNew.bookingDAO"/>
<c:set  var="pname" value="${param.policyName }"/>
<c:set var="cid" value="${param.customerId}"/>
<c:set var="polname" value="${pname}" scope="session"/>
<c:set var="cusId" value="${cid}" scope="session"/>
<c:set var="search" value="${beanDAO.searhByPolicyName1(pname)}"/>
     <%-- <c:out value=" PolicyDetails"/> --%>
      
       <div id="login-form-wraps">
   <form id="login-form" >
   <h5>Policy details</h5>
              Policy ID:
              <input type="text" name="policyID" value="${search.policyId}" readonly required>
               Policy Name:
               <input type="text" name="policyName" value="${search.policyName }" readonly required>
                Policy Type:
               <input type="text" name="type" value="${search.policyType }" readonly required>
               PayMode:
               <input type="text" name="paymode" value="${search.payMode }" readonly required>
                Premium Amount:
               <input type="text" name="premium" value="${search.premiumAmount }" readonly required>
               Term in Years:
               <input type="text" name="term" value="${search.term }" readonly required>
               Installment Amount
               <input type="text" name="installmentAmountPerPayMode" value="${search.installmentAmountPerPayMode }" readonly  required>
              Matured Amount
               <input type="text" name="term" value="${search.maturedAmount }" readonly required>
               <input type="submit" class="form-control" value="Book" />
               </form>
                         </div>
   
    </c:if>
   <%--  <c:out value="${sessionScope.polId}"/>
    <c:out value="${sessionScope.cusId}"/> --%>
            <c:if test="${param.paymode!=null}">
            
  <%--   <c:out value="${sessionScope.polId}"/>
    <c:out value="${sessionScope.cusId}"/> --%>
    
    <jsp:useBean id="booking" class="com.infinite.insuranceNew.BookingDetails"/>
 <jsp:setProperty property="policyName" name="booking" value="${sessionScope.polname}"/>
 
   Booking Details:
<%-- <jsp:getProperty property="policyName" name="booking"/> --%>
<jsp:setProperty property="customerId" name="booking" value="${sessionScope.cusId}"/>
<%--  <jsp:getProperty property="customerId" name="booking"/> --%>
<jsp:setProperty property="payMode" name="booking" value="${param.paymode}"/>
<jsp:setProperty property="policyID" name="booking" value="${param.policyID}"/>
<jsp:useBean id="bookingDao" class="com.infinite.insuranceNew.bookingDAO"/>
<c:out value="${bookingDao.addBooking(booking)}"/>
</c:if>

              <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/click-scroll.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
</body>
</html>