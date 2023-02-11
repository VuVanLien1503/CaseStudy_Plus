<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang Chu</title>
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
        document.images['myimage'].src = '${path}' + current + '.png';
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
        <img name="myimage" src="${path}.png" class="imgHot"/>
    </div>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${Name_User==null}">
                                <a class="nav-link" href="#"><span style="color: #14ee0c">List-Detail</span></a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="/BookServlet"><span style="color: #14ee0c">List-Detail</span></a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${Name_User==null}">
                                <a class="nav-link" href="#">
                                    <span style="color: #ea0a46">CategoryServlet</span></a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="/CategoryServlet">
                                    <span style="color: #ea0a46">CategoryServlet</span></a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${Name_User==null}">
                                <a class="nav-link" href="#">
                                    <span style="color: #ac0fe0">ProducerServlet</span></a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="/ProducerServlet">
                                    <span style="color: #ac0fe0">ProducerServlet</span></a>
                            </c:otherwise>
                        </c:choose>

                    </li>
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${Name_User==null}">
                                <a class="nav-link" href="#">
                                    <span style="color: #e0b60f">PositionServlet</span></a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="/BookPositionServlet">
                                    <span style="color: #e0b60f">PositionServlet</span></a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <form class="d-flex" style="margin-left: 100px;margin-bottom: 0px">
                        <input class="form-control me-2" type="text" placeholder="Search By Category">
                        <button class="btn btn-primary" type="button">Search</button>
                    </form>
                </ul>

            </div>
            <c:choose>
                <c:when test="${Name_User==null}">
                    <span style="color: palegreen;margin-right: 30px"><a href="/login/login.jsp">Đăng Nhập</a></span>
                    <a class="navbar-brand" href="#">
                        <img src="../image/imageUser/user_0.png" alt="lol" style="width:40px;height: 40px"
                             class="rounded-pill">
                    </a>

                </c:when>
                <c:otherwise>
                    <span style="color: palegreen;margin-right: 30px">
                        <a href="/login/login.jsp" style="color: red">Đăng Xuất</a>
                    </span>
                    <a class="navbar-brand" href="/UsersServlet?action=edit&id=${Name_User.id}">
                        <img src="${Name_User.image}" alt="lol" style="width:40px;height: 40px" class="rounded-pill">
                    </a>

                </c:otherwise>
            </c:choose>
        </div>
    </nav>
    <div class="container" style="margin-left: 122px">
        <div class="column middle">
            <div class="colum-show">
                <div>
                    <table>
                        <div class="row">
                            <c:forEach items="${listBooks}" var="element">
                                <div class="container col-md-4" style="width: 18rem; margin: 15px">
                                    <img src="${element.image}" class="card-img-top" alt="error"
                                         style="width: 250px;height: 300px">
                                    <div class="card-body" style="text-align: center">
                                        <h5 style="margin-top: 10px;color: #ee940c"
                                            class="card-title">${element.name}</h5>
                                        <p class="card-text"></p>
                                        <c:choose>
                                            <c:when test="${Name_User==null}">
                                                <span class="btn btn-primary">Detail</span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/BookServlet?action=detail$id=${element.id} "
                                                   class="btn btn-primary">Detail</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </table>
                    <div style="margin-left: 400px;margin-top: 30px">
                        <div>
                            <a href="/HomeServlet?page=${currentPage-1}" style="margin-right: 20px"><b>Back</b></a>
                            <span style="color: red"> [ ${currentPage} ]</span>
                            <a href="/HomeServlet?page=${currentPage+1}" style="margin-left: 20px"><b>Next</b></a>
                            <a href="/HomeServlet?page=${totalPages+1}"><i>[${totalPages+1}]</i></a>
                        </div>
                    </div>
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
                    <i class="fab fa-facebook-f">Facebook</i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="button social-account-button twitter-button button-fullwidth"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google">Google</i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram">Instagram</i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin">Linkedin</i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github">Github</i>
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
