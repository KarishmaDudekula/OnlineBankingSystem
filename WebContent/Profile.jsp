<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerProfile</title>
</head>
<body>
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/bankingsystem"
        user="root" password="pooja10"
    />
     
    <sql:query var="users"   dataSource="${myDS}">
    
        select first_name,last_name,gender,email_id,pancard_number,aadhaarcard_number,date_of_birth,occupation,marital_status,address,city,state,country,pincode from customer_details where customer_id = <%=request.getSession().getAttribute("currentcustomerid")%>;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption> Customer Details </caption>
            <c:forEach var="row" items="${users.rows}">
            <td>
                <tr><th>First Name</th><td> <c:out value="${row.first_name}" /></td></tr>    
                <tr><th>Last Name</th><td> <c:out value="${row.last_name}" /></td></tr>
                <tr><th>Gender</th><td> <c:out value="${row.gender}" /></td></tr>
                <tr><th>Email id</th><td> <c:out value="${row.email_id}" /></td></tr>
                <tr><th>Pan Card Number</th><td> <c:out value="${row.pancard_number}" /></td></tr>
                <tr><th>Aadhaar Card Number</th><td> <c:out value="${row.aadhaarcard_number}" /></td></tr>
                <tr><th>Date of Birth</th><td> <c:out value="${row.date_of_birth}" /></td></tr>
                <tr><th>Occupation</th><td> <c:out value="${row.occupation}" /></td></tr>
                <tr><th>Marital Status</th><td> <c:out value="${row.marital_status}" /></td></tr>
                <tr><th>Address</th><td> <c:out value="${row.address}" /></td></tr>
                <tr><th>City</th><td> <c:out value="${row.city}" /></td></tr>
                <tr><th>State</th><td> <c:out value="${row.state}" /></td></tr>
                <tr><th>Country</th><td> <c:out value="${row.country}" /></td><br></tr>
                <tr><th>Pin Code</th><td> <c:out value="${row.pincode}" /></td><br></tr>              
            </td>
</c:forEach>
        </table>
    </div>
    
<br>
<br>
    
<sql:query var="account"   dataSource="${myDS}">
    
        select account_number, account_type, open_date, branch_id, balance from account_details where customer_id = <%=request.getSession().getAttribute("currentcustomerid")%>;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption> Account Details </caption>
            <c:forEach var="row" items="${account.rows}">
            <td>
                <tr><th>Account Number</th>
                <td> <c:out value="${row.account_number}" /></td></tr>
                <tr><th>Account Type</th>
                <td> <c:out value="${row.account_type}" /></td></tr>
                <tr><th>Account Opened Date</th>
                <td> <c:out value="${row.open_date}" /></td></tr>
                <tr><th>Branch id</th>
                <td> <c:out value="${row.branch_id}" /></td></tr>
                <tr><th>Balance</th> 
                <td> <c:out value="${row.balance}" /></td></tr>            
            </td>
            
              <td>
   
   
   
   
   
   </td>
</c:forEach>
        </table>
    </div>
</body>
</html>