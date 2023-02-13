<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book Login</title>
  <link rel="stylesheet" media="all" href="https://cpwebassets.codepen.io/assets/global/global-0b932d80445462f790a3461ec6768eb7290edbe769dd2e1c4efaedafa5582d5c.css">
  <link rel="stylesheet" media="screen" href="https://cpwebassets.codepen.io/assets/packs/css/everypage-b6b2efde.css">
  <link rel="stylesheet" media="all" href="https://cpwebassets.codepen.io/assets/page/page-345d2661188ccfb81d8d25dc1f6081b1116e59e3b4e5eb5955e430d5ac0b787a.css">
  <link rel="stylesheet" media="screen" href="https://cpwebassets.codepen.io/assets/accounts/form-776ea921c2b1e16b31b143a01c75e69304b29401d144d89a624cdeabf7ed9749.css">
</head>
<style>

</style>
<body class="body-login logged-out not-team" data-sidebar-collapsed="false" data-mobile-nav-open="false">
<div class="login-wrap">
  <header class="login-header">
    <h3 style="color: #14ee0c"> R E G I S T E R </h3>
  </header>
  <div class="flex-grid">
    <div class="login-half left">
      <div class="login-area">
        <form class="login-form top-label-form" action="/UsersServlet?action=create" method="post">
          <div id="login-name" class="field">
            <label for="login-email-field"> Name</label>
            <input type="text" name="name" id="login-name-field">
          </div>
          <div id="login-email" class="field">
            <label for="login-email-field"> Email</label>
            <input type="text" name="email" id="login-email-field">
          </div>
          <div >
            <c:if test='${requestScope["error-email"] != null}'>
              <span class="error" style="color: red">${requestScope["error-email"]}</span>
            </c:if>
          </div>
          <div id="login-password" class="field">
            <label for="login-password-field">Password</label>
            <input type="password" name="password" id="login-password-field">
          </div>
          <div id="login-passwordConfirm" class="field">
            <label for="login-password-field">Confirm</label>
            <input type="password" name="passwordConfirm" id="login-passwordConfirm-field">
          </div>
          <div >
            <c:if test='${requestScope["error1-password"] != null}'>
              <span class="error" style="color: red">${requestScope["error1-password"]}</span>
            </c:if>
          </div>
          <div >
            <c:if test='${requestScope["error2-password"] != null}'>
              <span class="error" style="color: red">${requestScope["error2-password"]}</span>
            </c:if>
          </div>
          <div>
            <button id="log-in-button" class="recaptcha-trigger-button button green action-button expand-right" type="submit">
              <span class="label">Register</span>
              <span class="spinner"></span>
            </button>
          </div>
        </form>
        <div>
          <a href="/HomeServlet">
            <button  class="recaptcha-trigger-button button red action-button expand-right">
              <span class="label"><<< Back</span>
              <span class="spinner"></span>
            </button></a>
        </div>
        <form class="module login-form top-label-form" id="forgot-password-form" action="#0">
          <h3>Reset Your Password</h3>
          <div class="field">
            <label for="forgot-email"> Email</label>
            <input type="text" id="forgot-email" name="forgot-email" placeholder="your@email.com" required="">
          </div>
          <div class="field">
            <input id="forgot-email-btn" type="submit" value="Send Password Reset Email" class="button button-medium button-fullwidth">
          </div>
          <div id="sent-message">
            <div id="sent-message-message"></div>
          </div>
        </form>
      </div>
    </div>
    <div class="login-divider">
      <div class="bar bar-top"></div>
      <span class="login-or">H  L  S</span>
      <div class="bar bar-bottom"></div>
    </div>
    <div class="login-half right">
      <div>
        <img src="https://cf.shopee.vn/file/9f1ce36e753e6bc87fbec5abcb52a0af_tn" alt="error" style="width: 500px;height: 400px;background: red">
      </div>
    </div>
  </div>
</div>
</body>
</html>