<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Book Position</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--    <link rel="stylesheet" href="display.css">--%>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #333;
        color: #fff;
        height: 100vh;
        line-height: 1.6;
        overflow: hidden;
    }

    .container {
        width: 100%;
        height: 100%;
        overflow-y: scroll;
        scroll-behavior: smooth;
        scroll-snap-type: y mandatory;
    }

    .navbar {
        position: fixed;
        top: 0;
        z-index: 1;
        display: flex;
        width: 100%;
        height: 60px;
        background: rgba(0,0,0,0.7);
    }

    .navbar ul {
        display: flex;
        list-style: none;
        width: 100%;
        justify-content: center;
    }

    .navbar ul li {
        margin: 0 1rem;
        padding: 1rem;
    }

    .navbar ul li a {
        text-decoration: none;
        text-transform: uppercase;
        color: #f4f4f4;
    }

    .navbar ul li a:hover {
        color: skyblue;
    }
    section {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 100%;
        height: auto;
        scroll-snap-align: center;
    }
    section#home {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 100%;
        height: 20pc;
        scroll-snap-align: center;
        background: url('https://thuthuatnhanh.com/wp-content/uploads/2021/11/Hinh-anh-cuon-sach-mo-ra-doc-dao-an-tuong-day-tam-trang.jpg') no-repeat center center/cover;;
    }
    section#service {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 100%;
        height: 60pc;
        scroll-snap-align: center;
        background: url('https://toigingiuvedep.vn/wp-content/uploads/2022/11/anh-nen-ke-sach-doc-dao.jpg') no-repeat center center/cover;;
    }
    section#contact {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 100%;
        height: 20vh;
        scroll-snap-align: center;
        background: url('https://source.unsplash.com/2aAHlfDOhJM/1600x900') no-repeat center center/cover;;
    }
    body {
        color: #d0309a;
        background: #f5f5f5;
        font-family: 'Varela Round', sans-serif;
        font-size: 25px;
    }
    .table-wrapper {
        background: #fff;
        padding: 0px 25px;
        margin: 30px 0;
        border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
        width: auto;
        height: auto;
    }
    .table-title {
        background: #435d7d;
        color: #fff;
        padding: 16px 30px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }
    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }
    table.table tr th, table.table tr td {
        border-color: #1c66a9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    table.table tr th:first-child {
        width: 100px;
    }
    table.table tr th:last-child {
        width: 100px;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }
    table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
    }
    table.table td a {
        font-weight: bold;
        color: #189ed7;
        display: inline-block;
        text-decoration: none;
        outline: none !important;
    }
    table.table td a:hover {
        color: #2196F3;
    }
    table.table td a.edit {
        color: #FFC107;
    }
    table.table td i {
        font-size: 25px;
    }
</style>
<body>
<div class="container">
    <nav class="navbar">
        <ul>
            <li><a href="/BookServlet">Home</a></li>
            <li><td><a href="/BookPositionServlet">Back to list position</a></td></li>
        </ul>
    </nav>
    <section id="home">
        <h1 style="color: #0f7ee0; font-size:70px"><b>Welcome To The Place For Books </b></h1>
    </section>
    <section id="service">
        <div class="table-wrapper">
            <div class="table-title">
            </div>
            <form method="post">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <div>
                            <th colspan="2" style="color: blue">Delete Book Position</th>
                        </div>
                    </tr>

                    </thead>
                    <tbody>
                    <tr>
                        <th style="color: #654747">Id</th>
                        <td>${delete.id}</td>
                    </tr>
                    <tr>
                        <th style="color: #654747">Name</th>
                        <td>${requestScope["delete"].getName()}</td>
                    </tr>
                    <tr>
                        <th style="color: #654747">Quantity</th>
                        <td>${requestScope["delete"].getQuantity()}</td>
                    </tr>
                    <tr>
                        <th style="color: #654747">Position</th>
                        <td>${requestScope["delete"].getPosition()}</td>
                    </tr>
                    <tr>
                        <th style="color: #654747">QuantityNow</th>
                        <td>${requestScope["delete"].getQuantityNow()}</td>
                    </tr>
                    <tr>
                        <th style="color: #654747">Amount</th>
                        <td>${requestScope["delete"].getQuantity() -requestScope["delete"].getQuantityNow()}</td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="btn btn-danger">Delete</button> </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </section>
    <section id="contact">
        <h1>Hoàng Liên Sơn</h1>
    </section>
</div>
</body>
</html>
