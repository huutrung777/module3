<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sửa thông tin sản phẩm</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<div class="container mt-5">
    <h2>Sửa thông tin sản phẩm</h2>
    <form action="/sanphams?action=update" method="post">
        <input type="hidden" name="action" value="update">

        <div class="mb-3">
            <label for="id" class="form-label">ID sản phẩm</label>
            <input type="number" class="form-control" id="id" name="id" value="${sanPham.id}" readonly>
        </div>

        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" name="tenSanPham" value="${sanPham.tenSanPham}" required>
        </div>

        <div class="mb-3">
            <label for="gia" class="form-label">Giá</label>
            <input type="number" step="0.01" class="form-control" id="gia" name="gia" value="${sanPham.gia}" required>
        </div>

        <div class="mb-3">
            <label for="moTa" class="form-label">Mô tả</label>
            <textarea class="form-control" id="moTa" name="moTa" rows="3">${sanPham.moTa}</textarea>
        </div>

        <div class="mb-3">
            <label for="nhaSanXuat" class="form-label">Nhà sản xuất</label>
            <input type="text" class="form-control" id="nhaSanXuat" name="nhaSanXuat" value="${sanPham.nhaSanXuat}">
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="/sanphams" class="btn btn-secondary">Quay lại danh sách</a>
    </form>
</div>
</body>
</html>
