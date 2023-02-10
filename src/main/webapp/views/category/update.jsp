<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>UPDATE FORM</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Update form</h1>--%>
<%--<form action="/CategoryServlet?action=update&id=${category.id}" method="post">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><label for="name">Name: </label></td>--%>
<%--            <td><input type="text" name="name" id="name" value="${category.name}"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2">--%>
<%--                <button type="submit">Update</button>--%>
<%--                <a href="/CategoryServlet" style="text-decoration: none">--%>
<%--                    <button>Back to book</button>--%>
<%--                </a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>


<html>
<head>
    <title>Update Category</title>
</head>
<body style="background-image:url('https://img.freepik.com/free-photo/wooden-table-with-blurred-background_1134-14.jpg?w=826&t=st=1676021833~exp=1676022433~hmac=295542dd4427e03888a7f4e9585fe7c6b24fedcdb08c969abf112e2da826b62c');" >
<fieldset style="display: flex; justify-content: center ; width: 20% ; margin-left: 550px;margin-top: 200px;background-color: antiquewhite">
    <div style="text-align: center">
        <h1 >Create Form</h1>
        <form action="/CategoryServlet?action=update&id=${category.id}" method="post">
            <div class="form-group" style="margin-bottom: 10px">
                <tr>
                    <label for="name">Name: </label>
                    <input type="text" class="form-group" name="name" id="name" value="${category.name}">
                </tr>
            </div>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-primary">Update</button>
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