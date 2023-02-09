<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Category</title>
    <style>
        .message {
            color: darkred;
        }
        .message1{
            color: green;
        }
    </style>
</head>
<body>
<h1>List Category</h1>
<a href="/CategoryServlet?action=insert"><button>Create new category</button></a>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <i class="message">${requestScope["message"]}</i>
    </c:if>
</p>
<p>
    <c:if test='${requestScope["message1"] != null}'>
        <i class="message1">${requestScope["message1"]}</i>
    </c:if>
</p>
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
