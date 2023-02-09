<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2/9/2023
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UPDATE PRODUCER</title>
</head>
<body>
<h1>UPDATE PRODUCER</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form action="ProducerServlet?action=update&id=${producer.id}" method="post">
    <fieldset style="width: 20%">
        <legend>Book Position Information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" value="${producer.name}"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">Create</button>
                    <a href="/ProducerServlet"><button type="button">Back to home</button></a>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
