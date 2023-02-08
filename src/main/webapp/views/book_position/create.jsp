
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new book position</title>
</head>
<style>
    .message{
        color:green;
    }
    .error{
        color: red;
    }
</style>
<body>
<h1>CREATE NEW BOOK POSITION</h1>
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
                <td>Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><input type="number" name="quantity"></td>
            </tr>
            <tr>
                <td>Position</td>
                <td><input type="text" name="position"></td>
            </tr>
            <tr>
                <td>QuantityNow</td>
                <td><input type="number" name="quantityNow"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">Create</button>
                    <a href="/BookPositionServlet"><button type="button">Back to home</button></a>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
