<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</style>

<style>

</style>


 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>profile</title>


</head>
<body>
<jsp:include page="cd.jsp"/>

    <jsp:useBean id="beanDAO" class="com.infinite.insuranceNew.PolicyDAO"/>
                  <div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-center">
 
            <!-- Ad Here -->
            
        </div>
        <div class="col-rt-4">
         
                <center>  <h5><b>View  policy list</b> </h5></center>
           
        </div>
    </div>
</div>
<center>

        <table border="2">
        <tr> 
        <th>Policy Id</th>
        <th>Policy Name</th>
        <th>Policy Type</th>
        <th>Premium Amount</th>
        <th>Matured Amount</th>
        <th>Book the policy</th>
       
        </tr>
        <c:forEach var="pol" items="${beanDAO.showPolicy()}">
        <tr>
        <td>${pol.policyId }</td>
        <td>${pol.policyName}</td>
        <td>${pol.policyType}</td> 
        <td>${pol.premiumAmount}</td> 
        <td>${pol.maturedAmount}</td> 
        <td><a href="BookingPolicy.jsp" style="color:#00e6e6">Book</a></td>
        
        </tr>        
        </c:forEach>
       
        </table>
            
   
</body>
</html>