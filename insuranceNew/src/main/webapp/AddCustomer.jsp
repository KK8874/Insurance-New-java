<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

/* The message box is shown when the user clicks on the password field */
#message {
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
  alert("Please Enter missing values!");  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long with special characters ");  
  return false;  
  }else if(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){
	  alert("Enter Valid Email eg:xx@gmail.com ");  
	  return false;
	   }
else{
	alert("Customer Registrated Successfully ,PLease remember the CUSTOMER ID given on screen for login UserName");
}

}

</script>


</head>
<body>
<jsp:include page="nav1.jsp"/>


	<c:if test="${param.customerName != null }">
		<jsp:useBean id="dao" class="com.infinite.insuranceNew.CustomerDAO" />
		<jsp:useBean id="customer" class="com.infinite.insuranceNew.Customer" />
		<jsp:setProperty property="*" name="customer"/>
		<c:out value="${dao.addcustomer(customer)}" />
	</c:if>
	<center>
<div id="login-form-wrapss">
<h2> Account Registration </h2>
<p>Please enter your details carefully!</p>
  <form id="login-form" action="AddCustomer.jsp"  name="myform" onsubmit="return validateform()">
 <input type="text" name="customerName" placeholder="Name" /><br/><br/>
<input type="text" name="customerDesignation" placeholder="Designation" /><br/><br/>
<div class="email"> <input type="email"  name="customerEmail" placeholder="Email" /><br/><br/>
 <span id="email-error"></span></div>

 <input type="text" name="customerAddress" placeholder="Address" ><br/><br/>
 <input type="text"  name="customerContact" placeholder="Contact" maxlength="10" /><br/><br/>
  <input type="password"  name="passWord"  id="psw" placeholder="PassWord"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
  title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" /><br/><br/>
                <div id="message">
  <h6>Password must contain the following:</h6>
  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  <p id="number" class="invalid">A <b>number</b></p>
  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>
<input  type="submit"  id="login"value="Register" >

                            </form>
	                    </div>
	                     <div id="login-form-wrapss">
	       
	                     </div>
	           <script>
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");
var Email=document.getElementById("email");



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