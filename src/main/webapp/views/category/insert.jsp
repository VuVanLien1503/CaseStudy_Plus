<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Category</title>
</head>
<body>
<h1>Create Form</h1>
<form action="/CategoryServlet?action=insert" method="post">
  <table>
    <tr>
      <td><label for="name">Name: </label></td>
      <td><input type="text" name="name" id="name"></td>
    </tr>
    <tr>
      <td colspan="2">
        <button type="submit">Insert</button>
        <a href="/CategoryServlet" style="text-decoration: none">
        <button type="button">Back to Book</button>
        </a>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
