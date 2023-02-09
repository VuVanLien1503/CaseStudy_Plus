<%--
  Created by IntelliJ IDEA.
  User: HieuHip
  Date: 09/02/2023
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Category</title>
    <style>
        .message2{
            color: green;
        }
    </style>
</head>
<body>
<h1>DELETE CATEGORY</h1>
<p>
    <a href="/CategoryServlet">Back to category list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Category information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${requestScope["category"].getName()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete category"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
