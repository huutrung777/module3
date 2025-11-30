<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 27/11/2025
  Time: 8:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <c:import url="../layout/library.jsp"/>
</head>
<body>
<c:import url="../layout/navbar.jsp"/>
<h1>Danh Sách khách hàng</h1>
<a class="btn btn-sm btn-success" href="/customer?action=add">Add new customer</a>
<table class="table table-dark table-striped">
  <tr>
    <th>STT</th>
    <th>Id</th>
    <th>Name</th>
    <th>Date</th>
    <th>Address</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach var="customer" items="${customerList}" varStatus="status">
    <tr>
      <td>${status.count}</td>
      <td>${customer.id}</td>
      <td>${customer.name}</td>
      <td>${customer.date}</td>
      <td>${customer.address}</td>
      <td>
        <img src="/img/cr7.jpg"
             alt="avatar"
             width="60"
             height="60"
             style="object-fit: cover; border-radius: 10px;">
      </td>

    </tr>
  </c:forEach>
  <tr>
    <c:if test="${customerList.isEmpty()}">
      <td colspan="5">Danh sách trống</td>
    </c:if>
  </tr>
</table>
</body>
</html>
