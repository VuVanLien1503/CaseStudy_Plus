<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CREATE</title>
</head>
<body>
<h1>---------------CREATE BOOK--------------</h1>
<form action="/BookServlet?action=creat">
    <table border="1" style="border-collapse: collapse">
        <tr>
            <th><label for="name"></label><i>Name</i></th>
            <td><input type="text" id="name" name="name"></td>
        </tr>
        <tr>
            <th><label for="descriptions"><i>Descriptions</i></label></th>
            <td><input type="text" name="descriptions" id="descriptions"></td>
        </tr>
        <tr>
            <th><label for="image"><i>Image</i></label></th>
            <td><input type="file" name="image" id="image"></td>
        </tr>
        <tr>
            <th><label for="radio2"><i>Status_Book</i></label></th>
            <td>
                <input type="radio" id="radio2" name="status_book" value="1">Sách Mới <br>
                <input type="radio" id="radio3" name="status_book" value="0">Sách Cũ
            </td>
        </tr>
        <tr>
            <td><label for="quantity">Quantity:</label></td>
            <td><input type="text" name="quantity" id="quantity"></td>
        </tr>
        <tr>
            <th><label for="producer">Producer:</label></th>
            <td>
                <select name="category" id="producer">
                    <c:forEach items="${producer}" var="element">
                        <option value="${element.id}">${element.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th><label for="category">Category:</label></th>
            <td>
                <select name="category" id="category">
                    <c:forEach items="${category}" var="element">
                        <option value="${element.id}">${element.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th><label for="book_position">book_position:</label></th>
            <td>
                <select name="category" id="book_position">
                    <c:forEach items="${book_position}" var="element">
                        <option value="${element.id}">${element.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button>Create New</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
