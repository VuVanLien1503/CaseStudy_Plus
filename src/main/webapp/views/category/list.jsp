<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Category</title>
</head>
<body>
<h1>List Category</h1>
<a href="/categories?action=create"><button>Create new category</button></a>
<table border="1" style="border-collapse: collapse">
    <tr>
        <th>STT: </th>
        <th>Name: </th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach var="c" items="${categories}" varStatus="status">
        <tr>
            <td>${status.index+1}</td>
            <td>${c.name}</td>
            <td><a href="/CategoryServlet?action=update&id=${c.id}">
                <button>Update</button>
            </a></td>
            <td><a href="/CategoryServlet?action=delete&id=${c.id}">
                <button>DELETE</button>
            </a></td>
        </tr>

    </c:forEach>
</table>
</body>
</html>
