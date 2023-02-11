<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Book</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/home/home.css">
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
                    <li class="nav-item">
                        <a class="nav-link" href="/HomeServlet">
                            <span style="color: #14ee0c">Home</span></a>
                    </li>

                    <form class="d-flex" style="margin-left: 300px;margin-bottom: 0px">
                        <input style="width: 400px" class="form-control me-2" type="text" placeholder="Search By Category">
                        <button class="btn btn-primary" type="button">Search</button>
                    </form>
                </ul>
                <div>
                    <button>Create New Book</button>
                </div>
            </div>

        </div>
    </nav>
    <div>
        <h1 style="margin-left: 350px">
            <i>----------List Book Detail--------------</i>
        </h1>
        <div style="margin-left: 200px">
            <table border="5" style="margin-top: 50px">
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
                        <td><b>${element.name}</b></td>
                        <td><sub>${element.descriptions}</sub></td>
                        <td><img src="${element.image}" alt="error" style="width: 100px;height: 120px"></td>
                        <td>
                            <c:choose>
                                <c:when test="${element.status_book ==true}">
                                    <i>Sách Mới</i>
                                </c:when>
                                <c:otherwise>
                                    <i>Sách Cũ</i>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${element.quantity}</td>
                        <td>${element.producer_id}</td>
                        <td>${element.category_id}</td>
                        <td>${element.book_position}</td>
                    </tr>
                </c:forEach>
            </table>
            <div style="margin-left: 400px;margin-top: 30px">
                <div>
                    <a href="/BookServlet?page=${currentPage-1}" style="margin-right: 20px"><b>Back</b></a>
                    <span style="color: red"> [ ${currentPage} ]</span>
                    <a href="/BookServlet?page=${currentPage+1}" style="margin-left: 20px"><b>Next</b></a>
                    <a href="/BookServlet?page=${totalPages+1}"><i>[${totalPages+1}]</i></a>
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
