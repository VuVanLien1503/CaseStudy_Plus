<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Book</title>
</head>
<body>
<h1>----------List Book--------------</h1>
<div>
  <div>
    <form action="/BookServlet?action=findByCategory" method="post">
      <input type="text" name="find" placeholder="Find By Category">
      <button>Find</button>
    </form>
  </div>
  <div>
    <button> <a href="/BookServlet?action=create" >Create New Book</a></button>
  </div>
  <div style="margin: 5px">
    <button><a href="/BookPositionServlet">BookPositionServlet</a></button>
  </div>
  <div style="margin: 5px">
    <button><a href="/CategoryServlet">CategoryServlet></a></button>
  </div>
  <div style="margin: 5px">
    <button><a href="/ProducerServlet">ProducerServlet></a></button>
  </div>
</div>
<div>
    <table border="1" style="border-collapse: collapse;margin-top: 20px">
      <tr>
        <th>STT</th>
        <th>name</th>
        <th>descriptions</th>
        <th>image</th>
        <th>status_book</th>
        <th>quantity</th>
        <th>producer_id</th>
        <th>category_id</th>
        <th>book_position</th>
      </tr>
      <c:forEach items="${listBooks}" var="element" varStatus="stt">
        <tr>
          <td>${stt.index+1}</td>
          <td>${element.name}</td>
          <td>${element.descriptions}</td>
          <td><img src="${element.image}" alt="error" style="width: 100px;height: 120px"></td>
          <td>${element.status_book}</td>
          <td>${element.quantity}</td>
          <td>${element.producer_id}</td>
          <td>${element.category_id}</td>
          <td>${element.book_position}</td>
        </tr>
      </c:forEach>
    </table>
</div>
</body>
</html>