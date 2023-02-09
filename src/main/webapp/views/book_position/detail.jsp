<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product detail</title>
</head>
<style>
    table,td,th{
        border: black solid 1px;
    }
    table{
        border-collapse: collapse;
    }
</style>
<body>
<h2>PRODUCT DETAIL</h2>
<form>
    <fieldset style="width: 20%">
        <legend>The detail information of product</legend>
        <table>
            <tr>
                <th>ID</th>
                <td>${requestScope["views"].getId()}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${requestScope["views"].getName()}</td>
            </tr>
            <tr>
                <th>Quantity</th>
                <td>${requestScope["views"].getQuantity()}</td>
            </tr>
            <tr>
                <th>Position</th>
                <td>${requestScope["views"].getPosition()}</td>
            </tr>
            <tr>
                <th>QuantityNow</th>
                <td>${requestScope["views"].getQuantityNow()}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>${requestScope["views"].isStatus()}</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="/BookPositionServlet"><button type="button">Back list position</button></a>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
