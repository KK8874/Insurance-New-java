<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CustomerLogin</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./Style.css">

<!--Fontawesome CDNs-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	 
<script>  
function validateform(){  
var name=document.myform.username.value;  
var password=document.myform.email.value;  
  
if (name==null || name==""|| password==null ||password==""){  
  alert("Please enter valid values!");  
  return false;  
} 
}  
</script>
</head>
<body>
<jsp:include page="nav1.jsp"/>
<!-- partial:index.partial.html -->
<center>
<div id="login-form-wrapss">
  <h3>Customer Login</h3>
  <form id="login-form"  name="myform" onsubmit="return validateform()">
    <p>
    <input type="text" id="username" name="username" placeholder="Customer Id" ><span></span><span></span></i>
    </p>
    <p>
    <input type="password" id="email" name="email" placeholder="Password" ><span></span><span></span></i>
    <i class="fa fa-eye-slash" id="togglePassword1" onclick="togglePassword()"></i>
    </p>
    
    <p>
    <input type="submit" id="login" value="Login" onclick="login()">
    <a href="ForgetPassword.jsp">Forget Password</a><p>
    </p>
  </form>
  <div id="create-account-wrap">
    <p>Not a member? <a href="AddCustomer.jsp">Create Account</a><p>
  </div><!--create-account-wrap-->
</div><!--login-form-wrap-->
<!-- partial -->
 <c:if test="${param.username!=null && param.email!=null}">
		<jsp:useBean id="beanCustomerLogin" class="com.infinite.insuranceNew.Customer"/>
		<jsp:setProperty property="*" name="beanCustomerLogin"/>
		<jsp:useBean id="beanDao" class="com.infinite.insuranceNew.InsDAO"/>
		<c:set var="user" value="${param.username}"/>
		<c:set var="pwd" value="${param.email}"/>
		<c:set var="count" value="${beanDao.Customerlogin(user,pwd)}"/>
		<c:if test="${count==1}">
		
		<c:set var="user" value="${user}" scope="session" />
					<jsp:forward page="CustomerDashboard1.jsp"/>
		
		</c:if>
		<c:if test="${count==0}">
				<script>
        alert("Invalid Credentails.... Please login with correct details");
    </script>
		</c:if>
	</c:if>
	<!--login-form-wrap-->
<!-- partial -->
  
 	<script type="text/javascript">
	 	function togglePassword() {
	        let passwordType = document.getElementById("email").type;
	
	        if (passwordType === "password") {
	            document.getElementById("togglePassword1").className = "fa fa-eye";
	            document.getElementById("email").setAttribute('type', "text")
	        }
	        else {
	            document.getElementById("email").setAttribute('type', "password")
	            document.getElementById("togglePassword1").className = "fa fa-eye-slash";
	        }
	    }
 	</script>
</body>
</html>
