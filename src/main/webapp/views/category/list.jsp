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
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/HomeServlet">
                            <span style="color: #14ee0c">Home</span></a>
                    </li>

<%--                    <div style="margin-left: 100px">--%>
<%--                        <input type="text"name="search " placeholder="Enter Category"style="width: 350px;height: 40px;border-radius: 55px" >--%>
<%--                        <button style="border-radius: 30px ;width: 40px; height: 40px;background-color: #0c39ee">Tìm</button>--%>
<%--                    </div>--%>
                    </form>
                </ul>
                <div>
                    <button>
                        <a href="/CategoryServlet?action=insert">Create New Category</a>
                    </button>
                </div>
            </div>

        </div>
    </nav>

    <div style="margin-left: 450px;margin-top: 50px">
        <c:if test="${message1 != null}">
            <i style="color: red">${message1}</i>
        </c:if>
        <c:if test="${message2 != null}">
            <i style="color: blue">${message2}</i>
        </c:if>
        <table border="1" style="width: 350px;text-align: center">
            <tr>
                <th>STT</th>
                <th>Name</th>
                <th colspan="2">Action</th>
            </tr>
            <tr>
                <c:forEach items="${categories}" var="element" varStatus="stt">
            <tr>
                <td><i>${stt.index+1}</i></td>
                <td><i>${element.name}</i></td>
                <td><b><a href="/CategoryServlet?action=edit&id=${element.id}">Edit</a></b></td>
                <td><b><a href="/CategoryServlet?action=delete&id=${element.id}">Delete</a></b></td>
            </tr>
            </c:forEach>
            </tr>
        </table>
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
