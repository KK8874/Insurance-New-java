<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

 <script>  
function validateform(){  
var name=document.myform.customerName.value;  
var password=document.myform.passWord.value;
var desg=document.myform.customerDesignation.value;
var email=document.myform.customerEmail.value;
var address=document.myform.customerAddress.value;
var phn=document.myform.customerContact.value;


if (name==null || name==""|| password==null ||password==""|| desg==null || desg=="" || email==null || email=="" || address==null || address=="" || phn==null || phn==""){  
  alert("Please enter missing values!");  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long with special characters ");  
  return false;  
  } 
else{
	alert("Your Details Updated Successfully ");
}

}
</script>
 

</head>
<body>
<jsp:include page="CustomerDashboard.jsp"/>
    <jsp:useBean id="dao" class="com.infinite.insuranceNew.CustomerDAO" />
<c:set var="customer" value="${dao.searchCustomerById(sessionScope.user) }" />

    <c:if test="${param.customerId!=null }">
<c:set var="pid" value="${param.customerId }"/>
</c:if>

<div id="login-form-wrap" class="center">
<center>
<form  action="UpdateCustomer.jsp"  id="login-form" name="myform" onsubmit="return validateform()" >
<h5>Update Details</h5>

<input type="text" name="customerId" placeholder="Customer Id" value="${sessionScope.user }" required readonly/><br/><br/>

<input type="text" name="customerName" placeholder="Customer Name" value="${customer.customerName }" required readonly/><br/><br/>

<input type="text" name="customerDesignation" placeholder="Customer Designation"  value="${customer.customerDesignation }" required/><br/><br/>

<input type="email" name="customerEmail" placeholder="Customer Email"  value="${customer.customerEmail }" required/><br/><br/>

<input type="text" name="customerAddress" placeholder="Customer Address"  value="${customer.customerAddress }" required/><br/><br/>

<input type="text" name="customerContact" placeholder="Customer Contact" maxlength="10"  value="${customer.customerContact }" required/><br/><br/>

<input type="submit"  class="form-control" value="Update Customer"/>

</form>
</div>

<c:if test="${param.customerId !=null && param.customerName !=null}">
<jsp:useBean id="beanCustomer" class="com.infinite.insuranceNew.Customer"/>

<jsp:setProperty property="*" name="beanCustomer"/>
<c:out value="${dao.updateCustomer(beanCustomer) }"></c:out>
<jsp:forward page="DummyProfile1.jsp"></jsp:forward>
</c:if>
</body>
</html>