<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Add Student</title>
  <c:import url="../layout/library.jsp"/>
</head>
<body class="bg-light">
<c:import url="../layout/navbar.jsp"/>

<div class="container mt-4">

  <div class="card shadow-sm">
    <div class="card-header bg-primary text-white">
      <h3 class="mb-0">Thông tin thêm mới</h3>
    </div>

    <div class="card-body">

      <form action="/students?action=add" method="post">

        <!-- ID -->
        <div class="mb-3">
          <label class="form-label">ID</label>
          <input type="number" name="id" class="form-control" required>
        </div>

        <!-- Name -->
        <div class="mb-3">
          <label class="form-label">Name</label>
          <input name="name" class="form-control" required>
        </div>

        <!-- Gender -->
        <div class="mb-3">
          <label class="form-label">Gender</label><br>
          <div class="form-check form-check-inline">
            <input type="radio" value="true" name="gender" class="form-check-input" id="male">
            <label class="form-check-label" for="male">Male</label>
          </div>

          <div class="form-check form-check-inline">
            <input type="radio" value="false" name="gender" class="form-check-input" id="female">
            <label class="form-check-label" for="female">Female</label>
          </div>
        </div>

        <!-- Score -->
        <div class="mb-3">
          <label class="form-label">Score</label>
          <input type="number" value="0" name="score" class="form-control">
        </div>

        <button class="btn btn-success">Save</button>

      </form>

    </div>
  </div>

</div>

</body>
</html>
