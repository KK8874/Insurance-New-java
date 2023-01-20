<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<meta charset="utf-8" >
</meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
</meta>
<title>Data Tables</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</meta>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</link>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style.css">
</link>
   <link href="css/bootstrap.min.css" rel="stylesheet"/>

        <link href="css/bootstrap-icons.css" rel="stylesheet"/>

        <link href="css/templatemo-kind-heart-charity.css" rel="stylesheet"/>
<script
         src="http://code.jquery.com/jquery-3.3.1.min.js"
         integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
         crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
</link>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script>
<style type="">
         table {
         border-collapse: collapse;
         width: 100%;
         }
         th, td {
         padding: 8px;
         text-align: left;
         border-bottom: 1px solid #DDD;
         }
         tr:hover {background-color: #D6EEEE;}
         .topnav {
         background-color: #333;
         overflow: hidden;
         }
         /* Style the links inside the navigation bar */
         .topnav a {
         float: left;
         color: #f2f2f2;
         text-align: center;
         padding: 14px 16px;
         text-decoration: none;
         font-size: 17px;
         }
         /* Change the color of links on hover */
         .topnav a:hover {
         background-color: #ddd;
         color: black;
         }
         /* Create a right-aligned (split) link inside the navigation bar */
         .topnav a.split {
         float: right;
         background-color: #04AA6D;
         color: white;
         }
</style>
<style>

 

          h1{
          text-align: center;}



          .col-75 {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 200px;
  margin-top: 6px;
  margin-left: 50px;

}
          .container1{

          text-align:center;
          border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  margin-left:200px;
  margin-right: 200px;
   }
</style>
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
</head>
<body>
 <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">
                 <a class="nav-link click-scroll" href="#fixed">
                    
                     <h4>Policy Details</h4> 
                  
                </a>


                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                     <li class="nav-item">
                            <a class="nav-link click-scroll" href="#fixed"></a>
                        </li>

                       
                      
 						 <li class="nav-item">
                            <a class="nav-link click-scroll" href="ShowPolicyJsf1.xhtml" onclick="alert('Back to Policy Details!!')">Back
                           
                            </a>
                        </li>
                     
                    </ul>
                </div>
            </div>
        </nav>
<c:if test="${param.id!=null }">
<c:set var="pid" value="${param.id }"/>
</c:if> 
<c:if test="${param.policyId!=null }">
<c:set var="pid" value="${param.policyId }"/>
</c:if>
<jsp:useBean id="dao" class="com.infinite.insuranceNew.PolicyDAO"/>
<c:set var="policy1" value="${dao.searchById(pid)}" />

 
<center>
<div id="login-form-wrap" class="center">
<h5>Update Policy</h5>
<form action="UpdatePolicy.jsp"  id="login-form" >

<input type="text" name="policyId" value="${pid}" readonly><br/><br/>
         
<input type="text" name="policyName" value="${policy1.policyName}" readonly/><br/><br/>

<input type="text" name="policyType" value="${policy1.policyType}" placeholder="Policy Type" readonly /><br/><br/>

<input type="text" name="premiumAmount" value="${policy1.premiumAmount}" placeholder="Premium Amount" required /><br/><br/>


<select name="payMode" id="payMode">
	<option value="QUARTERLY">Quarterly</option>
	<option value="HALFYEARLY">Half Yearly</option>
</select>

<input type="number" name="term" value="${policy1.term}" placeholder="Term" required/><br/><br/>
<input type="submit" class="form-control" value="Update"/>

</form>
</div>

 

      <c:if test="${param.policyId !=null && param.policyName !=null}">
<jsp:useBean id="beanPolicy" class="com.infinite.insuranceNew.Policy"/>

<jsp:setProperty property="*" name="beanPolicy"/>
<jsp:useBean id="daoPolicy" class="com.infinite.insuranceNew.PolicyDAO" />

 

      <c:out value="${dao.updatePolicy(beanPolicy) }"></c:out>
<c:redirect url="ShowPolicyJsf1.xhtml"></c:redirect>
</c:if>

 </center>

 
<script type="text/javascript">
	if("${policy1.payMode}" == "QUARTERLY"){
		document.getElementById("payMode").children[0].setAttribute("selected", "selected");
	}else{
		document.getElementById("payMode").children[1].setAttribute("selected", "selected");
	}
</script>
 

</body>
</html>