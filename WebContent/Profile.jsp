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
    
        select first_name,last_name,gender,email_id,pancard_number,aadharcard_number,date_of_birth,occupation,marital_status,address,city,state,country,pincode from customer_details where customer_id = <%=request.getSession().getAttribute("currentcustomerid")%>;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h3> Mini Statement </h3></caption>
            <tr>
                <th>transaction_id</th>
               
                <th>transaction_date</th>
                <th>transaction_type</th>
                <th>transaction_amount</th>
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