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
            <tr>
                <th>first_name</th>
                <th>last_name</th>
                <th>gender</th>
                <th>email_id</th>
                <th>pancard_number</th>
                <th>aadhaarcard_number</th>
                <th>date_of_birth</th>
                <th>occupation</th>
                <th>marital_status</th>
                <th>address</th>
                <th>city</th>
                <th>state</th>
                <th>country</th>
                <th>pincode</th>                
            </tr>
            <c:forEach var="row" items="${users.rows}">
              <tr>
   <td> <c:out value="${row.first_name}" /></td>
   <td> <c:out value="${row.last_name}" /></td>
   <td> <c:out value="${row.gender}" /></td>
   <td> <c:out value="${row.email_id}" /></td>
   <td> <c:out value="${row.pancard_number}" /></td>
   <td> <c:out value="${row.aadhaarcard_number}" /></td>
   <td> <c:out value="${row.date_of_birth}" /></td>
   <td> <c:out value="${row.occupation}" /></td>
   <td> <c:out value="${row.marital_status}" /></td>
   <td> <c:out value="${row.address}" /></td>
   <td> <c:out value="${row.city}" /></td>
   <td> <c:out value="${row.state}" /></td>
   <td> <c:out value="${row.country}" /></td>
   <td> <c:out value="${row.pincode}" /></td>
   </tr>
</c:forEach>
        </table>
    </div>
</body>
</html>