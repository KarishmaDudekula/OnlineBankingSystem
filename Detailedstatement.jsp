<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="w3.css">
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body,h1,h5 {font-family: "Raleway", sans-serif}

.w3-allerta {
  font-family: "Allerta Stencil", Sans-serif;
  font-size: 80px;
}

body, html{height: 100%}

h4, .close {
    background-color: black;
    color:white !important;
    text-align: center;
    font-size: 30px;
    height: 100%
}

.container{
  width: 532px;
  margin-left: auto;
  margin-right: auto;
  background: white;
  align-content: center;
  padding-right: 0px;
  padding-left: 0px;
}

.container-header {
    background-color: black;
    color:white !important;
    text-align: center;
    font-size: 30px;
	border: 5px solid white;
}
button {
	float :right;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 10%;
}
.container-footer {
      background-color: #f9f9f9;
}

</style>
</head>
<body>

<body class = "w3-black">
<!-- Icon Bar (Sidebar - hidden on small screens) -->

<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">

  <!-- Avatar image in top left corner -->

   <img id = "logo_img" src= "Images/logo(1).jpeg" >
<br><br><br><br>

  <a href="home.html" class="w3-bar-item w3-button w3-padding-large w3-hover-black">

    <i class="fa fa-home w3-xxlarge"></i>

    <p>HOME</p>
  </a>
 
 <a href="about.html" class="w3-bar-item w3-button w3-padding-large w3-hover-black">

    <i class="fa fa-user w3-xxlarge"></i>

    <p>ABOUT</p>
  </a>

 
  <a href="contact.html" class="w3-bar-item w3-button w3-padding-large w3-hover-black">

    <i class="fa fa-envelope w3-xxlarge"></i>

    <p>CONTACT</p>
  </a>
</nav>


<!-- Navbar on small screens (Hidden on medium and large screens) -->

<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">

  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">

    <a href="home.html" class="w3-bar-item w3-button">HOME</a>

    <a href="about.html" class="w3-bar-item w3-button">ABOUT</a>

    <a href="contact.html" class="w3-bar-item w3-button">CONTACT</a>

  </div>
</div>
<div class="w3-container">
<header class="w3-container w3-padding-12 w3-center w3-black" id="home">
<form method="get" action="home.html">
    <p><button type="submit" class="w3-button w3-light-grey" > Logout</button></p>
</form>
</header>
</div>
<div class="w3-padding-large" id="main">

  <!-- Header/Home -->
 
 <header class="w3-container w3-padding-12 w3-center w3-black" id="home">
 
   <h1 class="w3-jumbo"><span class="w3-hide-small">Gringotts </span>Bank</h1>
 
  <p> All at your fingertips.</p>

  </header>
  </div>
  
  
   <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/onlinebank"
        user="root" password="akhil"
    />
   
   <%
   String f = request.getParameter("FromDate");
   session.setAttribute("fromdate", f);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
   String t = request.getParameter("ToDate"); 
   session.setAttribute("todate", t);
   %>  
    <sql:query var="users"   dataSource="${myDS}">  
        select * from transaction_details where customer_id = <%=request.getSession().getAttribute("currentcustomerid")%> and transaction_date >= '<%=request.getSession().getAttribute("fromdate")%>' and transaction_date <= '<%=request.getSession().getAttribute("todate")%>';
    </sql:query>
    
    
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h4> Detailed Statement </h4></caption>
            <tr>
                <th>Transaction id</th>
               
                <th>Transaction date</th>
                <th>Transaction type</th>
                <th>Transaction amount</th>
            </tr>
            <c:forEach var="row" items="${users.rows}">
              <tr>
   <td> <c:out value="${row.transaction_id}" /></td>
 <td>   <c:out value="${row.transaction_date}" /></td>
    <td> <c:out value="${row.transaction_type}" /></td>
   <td> <c:out value="${row.transaction_amount}" /></td>
   </tr>
</c:forEach>
        </table>
    </div>
</body>
</html>