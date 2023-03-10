<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Book</title>
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
        <h1 style="margin-left: 300px">
            <i>----------Edit Book--------------</i>
        </h1>
        <div style="margin-left: 400px">
            <form action="/BookServlet?action=edit&id=${book.id}" method="post">
                <table border="1" style="border-collapse: collapse">
                    <tr>
                        <th><label for="name"></label><i>Name</i></th>
                        <td><input type="text" id="name" name="name" placeholder="${book.name}"></td>
                    </tr>
                    <tr>
                        <th><label for="descriptions"><i>Descriptions</i></label></th>
                        <td><input type="text" name="descriptions" id="descriptions" placeholder="${book.descriptions}"></td>
                    </tr>
                    <tr>
                        <th><label for="image"><i>Image</i></label></th>
                        <td><input type="file" name="imagePath" id="image" value="${book.image}"></td>
                    </tr>
                    <tr>
                        <th><i>Status_Book</i></th>
                        <td>
                            <label for="radio1"><input type="radio" id="radio1" name="status_book" value="true">S??ch M???i</label>
                            <br>
                            <label for="radio2"><input type="radio" id="radio2" name="status_book" value="false">S??ch C??</label>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="quantity">Quantity:</label></td>
                        <td><input type="text" name="quantity" id="quantity" placeholder="${book.quantity}"></td>
                    </tr>
                    <tr>
                        <th><label for="producer">Producer:</label></th>
                        <td>
                            <select name="producer" id="producer">
                                <c:forEach items="${listProducer}" var="producer">
                                    <option value="${producer.id}">${producer.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="category">Category:</label></th>
                        <td>
                            <select name="category" id="category">
                                <c:forEach items="${listCategory}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="book_position">book_position:</label></th>
                        <td>
                            <select name="position" id="book_position">
                                <c:forEach items="${listPosition}" var="element">
                                    <option value="${element.id}">${element.position}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr style="text-align: center;color: red">
                        <td colspan="9">
                            <h6>
                                <i>
                                    <c:if test="${message!=null}">
                                        ${message}
                                    </c:if>
                                </i>
                            </h6>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" style="text-align: center">
                            <c:choose>
                                <c:when test="${message1 == null}">
                                    <button><span style="color: blue">Update Book ${book.name}</span></button>
                                </c:when>
                                <c:otherwise>
                                    <h3 style="color: blue"><a href="/BookServlet">Back To List Book</a></h3>
                                </c:otherwise>
                            </c:choose>
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
                            <i class="fas fa-gem me-3"></i>Th??ng-Tin CodeGym:
                        </h6>
                        <p>
                            C??ng ty CP CodeGym Vi???t Nam - MST: 010 810 4526<br><br><br>

                            ??/c: C??n h??? TT01.23 d??? ??n H???i ????ng city, ph?????ng M??? ????nh 2, qu???n Nam T??? Li??m, th??nh
                            ph???
                            H?? N???i
                        </p>
                    </div>
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">
                            T???i sao ch???n CodeGym?
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
                            C???ng ?????ng l???p tr??nh THPT
                        </h6>
                        <p>
                            <a href="#!" class="text-reset"> Nh??m H???c l???p tr??nh</a>

                        </p>
                        <p>
                            <a href="#!" class="text-reset"> CLB Coding Dojo</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset"> CodeGym Hu??? </a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">CodeGym ???? N???ng</a>
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
            ?? 2022-11-20
            <a class="text-reset fw-bold" href="https://online.codegym.vn/">CodeGym-HN</a>
        </div>

    </footer>

</div>
</body>

</html>

