<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Book</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<script type="text/javascript">
    let current = 0;
    let numIMG = 4;

    function switchImage() {
        current++;
        document.images['myimage'].src = 'home/img/img_' + current + '.png';
        if (current <= numIMG) {
            setTimeout("switchImage()", 2000);
        } else {
            current = 0;
            setTimeout("switchImage()", 2000);
        }
    }

    setTimeout("switchImage()", 2000);


</script>
<body>
<div style="background-color: rgba(42,231,13,0.1)">
    <div class="header">
        <img name="myimage" src="home/img/img_3.png" class="imgHot"/>
    </div>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item" style="margin-left: 500px">
                        <a class="nav-link" href="/HomeServlet">
                            <h3 style="color: red"><i>Back To Home</i></h3></a>
                    </li>
                </ul>
            </div>

        </div>
    </nav>
    <div>
        <h1 style="margin-left: 300px"><i>----------DELETE--------------</i></h1>

        <h3 style="margin-left: 400px">
            <c:if test="${message == null}">
                <i style="color: red">Xóa Thành Công</i>
            </c:if>
        </h3>
        <div style="margin-left: 300px">
            <form action="/BookServlet?action=delete&id=${book.id}" method="post">
                <table border="5" style="margin-top: 50px;text-align: center">
                    <tr>
                        <th>ID</th>
                        <th>name</th>
                        <th>descr</th>
                        <th>image</th>
                        <th>status</th>
                        <th>quantity</th>
                        <th>producer</th>
                        <th>category</th>
                        <th>position</th>
                        <th colspan="2">Action</th>
                    </tr>
                    <tr>
                        <td>${book.id}</td>
                        <td><b>${book.name}</b></td>
                        <td><sub>${book.descriptions}</sub></td>
                        <td><img src="${book.image}" alt="error" style="width: 100px;height: 120px"></td>
                        <td>
                            <c:choose>
                                <c:when test="${book.status_book ==true}">
                                    <i>Sách Mới</i>
                                </c:when>
                                <c:otherwise>
                                    <i>Sách Cũ</i>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><b>${book.quantity}</b></td>

                        <c:forEach items="${listProducer}" var="producer">
                            <c:if test="${book.producer_id == producer.id}">
                                <td><i style="color: #14ee0c">${producer.name}</i></td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${listCategory}" var="category">
                            <c:if test="${book.category_id == category.id}">
                                <td><i style="color: #0f7ee0">${category.name}</i></td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${listPosition}" var="position">
                            <c:if test="${book.position_id == position.id}">
                                <td><i style="color: #03A9F4">${position.position}</i></td>
                            </c:if>
                        </c:forEach>

                    </tr>
                    <tr>
                        <td colspan="11">
                            <button><span style="color: red">DELETE</span></button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </div>
</div>
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
        <section class="content">
            <div class="container text-center text-md-start mt-5">
                <div class="row mt-3">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>Thông-Tin CodeGym:
                        </h6>
                        <p>
                            Công ty CP CodeGym Việt Nam - MST: 010 810 4526<br><br><br>

                            Đ/c: Căn hộ TT01.23 dự án Hải Đăng city, phường Mỹ Đình 2, quận Nam Từ Liêm, thành
                            phố
                            Hà Nội
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
                            <a href="#!" class="text-reset"> CLB Coding Dojo</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset"> CodeGym Huế </a>
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
</body>

</html>

