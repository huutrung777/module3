<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tính chiết khấu sản phẩm</title>
</head>
<body>
<h2>Product Discount Calculator</h2>

<form action="/discount" method="post">
    <label>Mô tả sản phẩm:</label><br>
    <input type="text" name="mota"><br><br>

    <label>Giá niêm yết (List Price):</label><br>
    <input type="number" name="giaNiemYet"><br><br>

    <label>Tỷ lệ chiết khấu (%):</label><br>
    <input type="number" name="tyLeChietKhau"><br><br>

    <button type="submit">Tính chiết khấu</button>
</form>
</body>
</html>