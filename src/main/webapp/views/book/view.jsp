<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Book</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<div style="background-color: rgba(234,192,192,0.29)">
    <div class="header">
        <img name="myimage" src="home/img/img_3.png" class="imgHot"/>
    </div>
    <div>
        <h1 style="margin-left: 350px">
            <i>----------List Book Detail--------------</i>
        </h1>
        <div style="margin-left: 250px">
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
                </tr>
                <tr>
                    <td>${listBooks.id}</td>
                    <td><b>${listBooks.name}</b></td>
                    <td><sub>${listBooks.descriptions}</sub></td>
                    <td><img src="${listBooks.image}" alt="error" style="width: 100px;height: 120px"></td>
                    <td>
                        <c:choose>
                            <c:when test="${listBooks.status_book ==true}">
                                <i>Sách Mới</i>
                            </c:when>
                            <c:otherwise>
                                <i>Sách Cũ</i>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><b>${listBooks.quantity}</b></td>
                    <td>
                        <c:forEach items="${listProducer}" var="producer">
                            <c:if test="${listBooks.producer_id == producer.id}">
                                <i style="color: #14ee0c">${producer.name}</i>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${listCategory}" var="category">
                            <c:if test="${listBooks.category_id == category.id}">
                                <i style="color: #0f7ee0">${category.name}</i>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${listPosition}" var="position">
                            <c:if test="${listBooks.position_id == position.id}">
                                <i style="color: #03A9F4">${position.position}</i>
                            </c:if>
                        </c:forEach>
                    </td>

            </table>
            <div  style="margin-top: 40px;margin-right: 400px">

                    <div colspan="9"style="text-align: center">
                        <h3 style="color: #0c39ee">
                            <a href="/HomeServlet">Back To Home</a>
                        </h3>
                    </div>

            </div>
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
