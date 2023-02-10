<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang Chu</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<style>
  {
    box-sizing: border-box;
  }
  body {
    margin: 0;
  }
  .header {
    background: rgba(255, 255, 255, 0.71);
    /*width: 150px;*/
    height: 400px;
    color: #58257b;
  }
  .topnav {
    position: sticky;
    top: 0px;
    width: 100%;
    height: 55px;
    overflow: hidden;
    background-color: #58257b;
    /*position: fixed;*/
  }
  .topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }
  .topnav a:hover {
    background-color: #db7093;
    color: white;
    font-weight: bold
  }
  .column {
    height:auto;
    float: left;
    padding: 0px;
  }
  .column.side {
    text-align: center;
    background: rgba(144, 190, 143, 0.33);
    width: 20%;
    position: sticky;
    top: 55px;
  }
  .column.middle {
    width: 80%;
    background: rgba(55, 232, 217, 0.11);
  }
  .footer {
    background-color: rgba(212, 197, 222, 0.42);
    text-align: center;
    padding-top: 10px;
  }
  .imgHot {
    width: 100%;
    height: 400px;
  }
  .colum-sell{
    position: sticky;
    top: 55px;
  }
  .colum-sort{
    position: sticky;
    top: 55px;
  }
  td,th{
    border: 1px solid rgba(59, 222, 22, 0.66);
  }
  .row-life-dow{
  }
  #row-life-dow{
    width: 255px;
    height: 350px;
  }
</style>

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
<div>

  <div class="header">
    <img name="myimage" src="${path}.png" class="imgHot"/>
  </div>
  <div class="topnav">
    <a href="#">
      <i class="fa fa-fw fa-home"></i>Home</a>
    <a href="/CategoryServlet" >Category</a>
    <a href="/BookPositionServlet" >position</a>
    <a href="/ProducerServlet" >producer</a>


    <div id="loginShow">
      <a href="/login/login.jsp" style="float: right" id="login">login
        <i class="fa fa-fw fa-user"></i>
      </a>

    </div>
    <div id="payMentHome"></div>
  </div>


  <div class="row">
    <div class="column side">
      <div class="row-life-top">

        <div class="colum-sort">
          <div class="search-container" style="margin-top: 20px">
            <input type="text" placeholder="Search.." name="search" id="search">
            <button style="width: 30px;height: 23px;background: chartreuse"><i class="fa fa-search" ></i></button>

          </div>
          <div style="float: right ;margin-right: 35px" id="loginHome">
          </div>
        </div>

        <div style="padding-top: 30px">
              <h1>Nội Dung Phụ</h1>
        </div>

      </div>

    </div>
    <div class="column middle">
      <div class="colum-show">
        <div id="result">
          <h1> Nội Dung chính</h1>
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
