
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>DELETE PRODUCT</h1>
<form method="post">
    <fieldset style="width: 20%">
        <legend>Are you sure?</legend>
        <table>
            <tr>
                <th>Id</th>
                <td>${delete.id}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${requestScope["delete"].getName()}</td>
            </tr>
            <tr>
                <th>Quantity</th>
                <td>${requestScope["delete"].getQuantity()}</td>
            </tr>
            <tr>
                <th>Position</th>
                <td>${requestScope["delete"].getPosition()}</td>
            </tr>
            <tr>
                <th>QuantityNow</th>
                <td>${requestScope["delete"].getQuantityNow()}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>${requestScope["delete"].isStatus()}</td>
            </tr>
            <tr>
                <td><a href="/BookPositionServlet"><button type="button">Back list position</button></a></td>
                <td><button type="submit">Delete</button> </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
