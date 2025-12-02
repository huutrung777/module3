<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/11/2025
  Time: 8:52 CH
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
<h1>San pham List</h1>
<a class="btn btn-sm btn-success" href="/sanphams?action=add">Thêm mới sản phẩm</a>
<h2>${param.mess}</h2>
<form action="/sanphams" method="get" class="d-flex mb-3" style="gap:5px;">
    <input type="hidden" name="action" value="find">
    <input type="text" name="tenSanPham" class="form-control" placeholder="Nhập Tên cần tìm">
    <button class="btn btn-primary btn-sm">Tìm kiếm</button>
</form>



<table class="table table-dark table-striped">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Tên Sản phẩm</th>
        <th>Giá</th>
        <th>Mô Tả</th>
        <th>Nhà sản xuất</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    <c:forEach var="sanpham" items="${sanPhamList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${sanpham.getId()}</td>
            <td>${sanpham.getTenSanPham()}</td>
            <td>${sanpham.getGia()}</td>
            <td>${sanpham.getMoTa()}</td>
            <td>${sanpham.getNhaSanXuat()}</td>

            <td>
                <button onclick="getInfoToDelete('${sanpham.id}','${sanpham.tenSanPham}')" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td>
                <a href="/sanphams?action=edit&id=${sanpham.id}" class="btn btn-warning btn-sm">Update</a>

            </td>

        </tr>

    </c:forEach>
    <tr>
        <c:if test="${sanPhamList.isEmpty()}">
            <td colspan="6">Danh sách trống</td>
        </c:if>

    </tr>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/sanphams?action=delete" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="deleteId" id="deleteId">
                    <span>Bạn có muốn xoá </span><span id="deleteName" class="text-danger"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function getInfoToDelete(id, tenSanPham){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerHTML = tenSanPham;
    }
</script>

</body>
</html>
