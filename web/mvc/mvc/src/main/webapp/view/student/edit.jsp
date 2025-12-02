<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30/11/2025
  Time: 8:13 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="./layout/library.jsp"/>
</head>
<body>
<form action="/students?action=update" method="post">
    <input type="hidden" name="id" value="${student.id}">

    Name:
    <input type="text" name="name" class="form-control" value="${student.name}">

    Gender:
    <select name="gender" class="form-control">
        <option value="true" ${student.gender ? "selected" : ""}>Nam</option>
        <option value="false" ${!student.gender ? "selected" : ""}>Nữ</option>
    </select>

    Score:
    <input type="number" name="score" class="form-control" value="${student.score}" step="0.1">

    <button type="submit" class="btn btn-primary mt-2">Update</button>
</form>

</body>
</html>
