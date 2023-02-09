<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2/9/2023
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CREATE PRODUCER</title>
</head>
<body>
<h1>CREATE PRODUCER</h1>
<form method="post">
    <fieldset style="width: 20%">
        <legend>Book Position Information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name"></td>
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
