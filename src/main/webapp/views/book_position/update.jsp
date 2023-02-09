
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Book Position </title>
</head>
<style>
    .message{
        color:green;
    }
</style>
<body>
<h1>UPDATE BOOK POSITION</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <c:if test='${requestScope["error"] != null}'>
        <span class="error">${requestScope["error"]}</span>
    </c:if>
</p>
<form method="post">
    <fieldset style="width: 20%">
        <legend>Book Position Information</legend>
        <table>
            <tr>
                <th>Name</th>
                <td><input type="text" name="name" value="${requestScope["update"].getName()}"></td>
            </tr>
            <tr>
                <th>Position</th>
                <td><input type="text" name="position" value="${requestScope["update"].getPosition()}"></td>
            </tr>
            <tr>
                <td><button type="submit">Update</button></td>
                <td><a href="/BookPositionServlet"><button type="button">Back to home</button> </a> </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
