<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Data Tables</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<script
  src="http://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
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

 

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>profile</title>
</head>
<body>
<jsp:include page="Agnav.jsp"/>
<script>
        $(document).ready(function () {
            $("#booking").DataTable({
                scrollY : '50vh',
                scrollCollapse : true
            });
        });
</script>

<div class="ScriptTop">
<div class="rt-container">
<div class="col-rt-4" id="float-center">

<!-- Ad Here -->

</div>
<div class="col-rt-4">

<center>  <h5><b>Booking Details List</b> </h5></center>

</div>
</div>
</div>
<jsp:useBean id="beanDAO" class="com.infinite.insuranceNew.bookingDAO"/>
<div class="container">
<table id="booking" border="2"  >
<thead>
<tr> 
<th style="background-color:#B0CCD3">Booking Id</th>
<th style="background-color:#B0CCD3">Customer Id</th>
<th style="background-color:#B0CCD3">Policy Id</th>
<th style="background-color:#B0CCD3">Pay Mode</th>
<th style="background-color:#B0CCD3">Booking Date</th>
<th style="background-color:#B0CCD3">Expiry Date</th>
<th style="background-color:#B0CCD3">Status</th>    
</tr></thead>
<tbody>
<c:forEach var="bok" items="${beanDAO.showBooking()}">
<tr>
<td>${bok.bookingId }</td>
<td>${bok.customerId}</td>
<td>${bok.policyID}</td> 
<td>${bok.payMode}</td> 
<td>${bok.bookingDate}</td> 
<td>${bok.expiryDate}</td> 
<td>${bok.status}</td>      
</tr>        
</c:forEach> 
</tbody> 
</table>
</div>


</body>
</html>