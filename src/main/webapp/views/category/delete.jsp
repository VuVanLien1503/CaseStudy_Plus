<%--
  Created by IntelliJ IDEA.
  User: HieuHip
  Date: 10/02/2023
  Time: 08:26
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Delete Category</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Delete category</h1>--%>
<%--<p>--%>
<%--  <a href="/CategoryServlet">Back to list category</a>--%>
<%--</p>--%>
<%--<form action="/CategoryServlet?action=delete&id=${category.id}" method="post">--%>
<%--  <h2>Are you sure?</h2>--%>
<%--  <fieldset>--%>
<%--    <legend>Category Information</legend>--%>
<%--    <table>--%>
<%--      <tr>--%>
<%--        <td>Name: </td>--%>
<%--        <td>${category.getName()}</td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <td colspan="2" style="text-align: center"><input type="submit" value="Delete category"></td>--%>
<%--      </tr>--%>
<%--    </table>--%>
<%--  </fieldset>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>


<html>
<head>
  <title>Delete Category</title>
</head>
<body style="background-image:url('https://img.freepik.com/free-photo/wooden-table-with-blurred-background_1134-14.jpg?w=826&t=st=1676021833~exp=1676022433~hmac=295542dd4427e03888a7f4e9585fe7c6b24fedcdb08c969abf112e2da826b62c');" >
<fieldset style="display: flex; justify-content: center ; width: 20% ; margin-left: 550px;margin-top: 200px;background-color: antiquewhite">
  <div style="text-align: center">
    <h1 >Delete Form</h1>
    <form action="/CategoryServlet?action=delete&id=${category.id}" method="post">
      <h2>Are You Sure?</h2>
      <div class="form-group" style="margin-bottom: 10px">
        <tr>
          <label for="name">Name: </label>
          <input type="text" class="form-group" name="name" id="name" value="${category.name}">
        </tr>
      </div>
      <tr>
        <td colspan="2">
          <button type="submit" class="btn btn-primary">Delete</button>
          <a href="/CategoryServlet" style="text-decoration: none">
            <button type="button" class="btn btn-primary">Back to list category</button>
          </a>
        </td>
      </tr>
    </form>
  </div>
</fieldset>
</body>
</html>