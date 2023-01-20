<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page buffer="16kb" %>
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
	<style>

/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 10px;
  margin-top: 0px;
}
#message1 {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 10px;
  margin-top: 0px;
}

#message p {
  padding: 0.5px;
  font-size: 12px;
}


/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "*";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "*";
}
.email span{
position: absolute;
font-size: 14px;
color: red;

}
</style> 
<script>  
function validateform(){  
var name=document.myform.username.value;  
var password=document.myform.email.value;  
  var confrim= document.myform.confrim.value
if (name==null || name==""|| password==null ||password==""){  
  alert("Please enter values!");  
  return false;  
} else if(password != confrim){
	alert("Password and confrim Password is not matching");
	return false;
}else
	alert("Password updated successfully..! ");
}  
/* var check = function() {
	  if (document.getElementById('psw').value ==
	    document.getElementById('confrim').value) {
	    document.getElementById('message1').style.color = 'green';
	    document.getElementById('message1').innerHTML = 'matching';
	  } else {
	    document.getElementById('message1').style.color = 'red';
	    document.getElementById('message1').innerHTML = 'not matching';
	  }
	} */
</script>
</head>
<body>
<jsp:include page="nav1.jsp"/>
<!-- partial:index.partial.html -->
<center>
<div id="login-form-wrapss">
  <h3>Customer Change Password</h3>
  <form id="login-form"  name="myform" onsubmit="return validateform()">
    <p>
    <input type="text" id="username" name="username" placeholder="Customer ID" ><span></span><span></span></i>
    </p>
   <p>
    <input type="password"  name="email" placeholder=" New Password"  id="psw"   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
  title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"><span></span><span></span></i>
    <i class="fa fa-eye-slash" id="togglePassword1" onclick="togglePassword()"></i>
    </p>
             <div id="message">
  <h6>Password must contain the following:</h6>
  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  <p id="number" class="invalid">A <b>number</b></p>
  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>
    <p>
    <input type="password" id="confrim" name="confrim" placeholder=" Confrim Password"  ><span></span><span></span></i>
    <i class="fa fa-eye-slash" id="togglePassword2" onclick="togglePassword1()"></i>
    
    </p>
    <p>
    <input type="submit" id="login" value="Update Password">
    
    </p>
  </form>
</div><!--login-form-wrap-->
<!-- partial -->
 <c:if test="${param.username!=null && param.email!=null}">
		<jsp:useBean id="beanCustomerLogin" class="com.infinite.insuranceNew.Customer"/>
		<jsp:setProperty property="*" name="beanCustomerLogin"/>
		<jsp:useBean id="beanDao" class="com.infinite.insuranceNew.InsDAO"/>
		<c:set var="user" value="${param.username}"/>
		<c:set var="pwd" value="${param.email}"/>
		<c:set var="count" value="${beanDao.forgetPassword(user,pwd)}"/>
		<jsp:forward page="CustomerLogin.jsp"></jsp:forward>
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

	 	function togglePassword1() {
	        let passwordType1 = document.getElementById("confrim").type;
	
	        if (passwordType1 === "password") {
	            document.getElementById("togglePassword2").className = "fa fa-eye";
	            document.getElementById("confrim").setAttribute('type', "text")
	        }
	        else {
	            document.getElementById("confrim").setAttribute('type', "password")
	            document.getElementById("togglePassword2").className = "fa fa-eye-slash";
	        }
	    }
 	</script>
 	<script>
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");




// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>
</body>
</html>
