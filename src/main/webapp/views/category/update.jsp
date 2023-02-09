
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UPDATE FORM</title>
</head>
<body>
<h1>Update form</h1>
<form action="/CategoryServlet?action=update&id=${category.id}" method="post">
    <table>
        <tr>
            <td><label for="name">Name: </label></td>
            <td><input type="text" name="name" id="name" value="${category.name}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Update</button>
                <a href="/CategoryServlet" style="text-decoration: none">
                    <button>Back to book</button>
                </a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
