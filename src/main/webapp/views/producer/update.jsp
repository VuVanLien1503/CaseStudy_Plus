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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Producer</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
        height: 80vh;
        scroll-snap-align: center;
        background: url('https://toigingiuvedep.vn/wp-content/uploads/2022/11/anh-nen-ke-sach-doc-dao.jpg') no-repeat center center/cover;;
    }
    .footer {
        background-color: rgba(212, 197, 222, 0.42);
        text-align: center;
        padding-top: 10px;
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
            <li><a href="/ProducerServlet">Back to list producer</a></li>
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
                            <td style="font-size: 20px; text-align: center; ">
                            <th colspan="2" style="color: blue">Update Producer</th>
                        </div>
                        <div>
                            <p STYLE="color: #1c66a9">
                                <c:if test='${requestScope["message"] != null}'>
                                    <span class="message">${requestScope["message"]}</span>
                                </c:if>
                            </p>
                        </div>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th style="color: #211d1d">Name</th>
                        <td><input type="text" name="name" value="${requestScope["update"].getName()}"></td>
                    </tr>
                        <td>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </section>
    <div class="footer">
        <footer class="text-center text-lg-start bg-light text-muted">
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                <div class="me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>
                </div>
                <div>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-github"></i>
                    </a>
                </div>
            </section>
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                <i class="fas fa-gem me-3"></i>Thông-Tin CodeGym:
                            </h6>
                            <p>
                                Công ty CP CodeGym Việt Nam - MST: 010 810 4526<br><br><br>

                                Đ/c: Căn hộ TT01.23 dự án Hải Đăng city, phường Mỹ Đình 2, quận Nam Từ Liêm, thành phố Hà Nội
                            </p>
                        </div>
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                Tại sao chọn CodeGym?
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Angular</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Java</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">PHP</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">C#</a>
                            </p>
                        </div>
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                            <h6 class="text-uppercase fw-bold mb-4">
                                Cộng đồng lập trình THPT
                            </h6>
                            <p>
                                <a href="#!" class="text-reset"> Nhóm Học lập trình</a>

                            </p>
                            <p>
                                <a href="#!" class="text-reset">  CLB Coding Dojo</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">  CodeGym Huế </a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">CodeGym Đà Nẵng</a>
                            </p>
                        </div>
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p><i class="fas fa-home me-3"></i> CodeGym-HN-VN</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                codegym@Gmail.Com
                            </p>
                            <p><i class="fas fa-phone me-3"></i> + Hotline: 0989 965 376</p>
                            <p><i class="fas fa-print me-3"></i> + Hotline: 0989 965 376</p>
                        </div>

                    </div>

                </div>
            </section>


            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022-11-20
                <a class="text-reset fw-bold" href="https://online.codegym.vn/">CodeGym-HN</a>
            </div>
        </footer>
    </div>
    </div>
</body>
</html>
