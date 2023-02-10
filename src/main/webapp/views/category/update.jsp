<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>UPDATE FORM</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Update form</h1>--%>
<%--<form action="/CategoryServlet?action=update&id=${category.id}" method="post">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><label for="name">Name: </label></td>--%>
<%--            <td><input type="text" name="name" id="name" value="${category.name}"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2">--%>
<%--                <button type="submit">Update</button>--%>
<%--                <a href="/CategoryServlet" style="text-decoration: none">--%>
<%--                    <button>Back to book</button>--%>
<%--                </a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Category</title>
    <style>
        .footer3 {
            background-color: rgba(212, 197, 222, 0.42);
            text-align: center;
            padding-top: 10px;}
    </style>
</head>
<body style="background-image:url('https://img.freepik.com/free-photo/wooden-table-with-blurred-background_1134-14.jpg?w=826&t=st=1676021833~exp=1676022433~hmac=295542dd4427e03888a7f4e9585fe7c6b24fedcdb08c969abf112e2da826b62c');" >
<fieldset style="display: flex; justify-content: center ; width: 20% ; margin-left: 550px;margin-top: 200px;background-color: antiquewhite">
    <div style="text-align: center">
        <h1 >Create Form</h1>
        <form action="/CategoryServlet?action=update&id=${category.id}" method="post">
            <div class="form-group" style="margin-bottom: 10px">
                <tr>
                    <label for="name">Name: </label>
                    <input type="text" class="form-group" name="name" id="name" value="${category.name}">
                </tr>
            </div>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="/CategoryServlet" style="text-decoration: none">
                        <button type="button" class="btn btn-primary">Back to list category</button>
                    </a>
                </td>
            </tr>
        </form>
    </div>
</fieldset>
<div class="footer3">
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
</body>
</html>