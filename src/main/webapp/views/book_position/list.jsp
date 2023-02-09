
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
</head>
<style>
    table,td,th{
        border: black solid 1px;
    }
    table{
        border-collapse: collapse;
        text-align: center;
    }
</style>
<body>
<h1>LIST POSITION</h1>
<form>
    <a href="/BookPositionServlet?action=create"><button type="button">Create new product</button></a>
</form>
<form action="/BookPositionServlet?action=search" method="post">
    <input type="text" name="search">
    <button type="submit">Search</button>
</form>
<form>
    <a href="/BookServlet"><button type="button">Back to home</button></a>
</form>
<table>
    <tr>
        <th colspan="8"><h2>LIST POSITION</h2></th>
    </tr>
    <tr>
        <th>STT</th>
        <th>NAME</th>
        <th>QUANTITY</th>
        <th>POSITION</th>
        <th>QUANTITY NOW</th>
        <th>STATUS</th>
        <th>ACTION</th>
    </tr>
    <c:forEach var="element" items='${requestScope["listBookPosition"]}' varStatus="STT">
        <tr>
            <td>${STT.index+1}</td>
            <td><a href="/BookPositionServlet?action=views&id=${element.getId()}">${element.getName()}</a></td>
            <td>${element.getQuantity()}</td>
            <td>${element.getPosition()}</td>
            <td>${element.getQuantityNow()}</td>
            <td>${element.isStatus()}</td>
            <td colspan="2">
                <a href="/BookPositionServlet?action=update&id=${element.getId()}"><button type="button>">Update</button> </a>
                <a href="/BookPositionServlet?action=delete&id=${element.getId()}"><button type="button">Delete</button> </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
