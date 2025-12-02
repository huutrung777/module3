<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<div class="container mt-5">
    <h2>Thêm sản phẩm mới</h2>
    <form action="/sanphams?action=add" method="post">
        <input type="hidden" name="action" value="add">

        <div class="mb-3">
            <label for="id" class="form-label">ID sản phẩm</label>
            <input type="number" class="form-control" id="id" name="id" required>
        </div>

        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" name="tenSanPham" required>
        </div>

        <div class="mb-3">
            <label for="gia" class="form-label">Giá</label>
            <input type="number" step="0.01" class="form-control" id="gia" name="gia" required>
        </div>

        <div class="mb-3">
            <label for="moTa" class="form-label">Mô tả</label>
            <textarea class="form-control" id="moTa" name="moTa" rows="3"></textarea>
        </div>

        <div class="mb-3">
            <label for="nhaSanXuat" class="form-label">Nhà sản xuất</label>
            <input type="text" class="form-control" id="nhaSanXuat" name="nhaSanXuat">
        </div>

        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
        <a href="/sanphams" class="btn btn-secondary">Quay lại danh sách</a>
    </form>
</div>
</body>
</html>
