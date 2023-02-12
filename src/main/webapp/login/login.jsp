<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Login</title>
    <link rel="stylesheet" media="all"
          href="https://cpwebassets.codepen.io/assets/global/global-0b932d80445462f790a3461ec6768eb7290edbe769dd2e1c4efaedafa5582d5c.css">
    <link rel="stylesheet" media="screen" href="https://cpwebassets.codepen.io/assets/packs/css/everypage-b6b2efde.css">
    <link rel="stylesheet" media="all"
          href="https://cpwebassets.codepen.io/assets/page/page-345d2661188ccfb81d8d25dc1f6081b1116e59e3b4e5eb5955e430d5ac0b787a.css">
    <link rel="stylesheet" media="screen"
          href="https://cpwebassets.codepen.io/assets/accounts/form-776ea921c2b1e16b31b143a01c75e69304b29401d144d89a624cdeabf7ed9749.css">
</head>
<body class="body-login logged-out not-team" data-sidebar-collapsed="false" data-mobile-nav-open="false">
<div class="login-wrap">
    <header class="login-header">
        <h2 class="little-big-header"> L o g i n </h2>
    </header>
    <div class="flex-grid">
        <div class="login-half left">
            <div class="login-area">
                <form class="login-form top-label-form" action="/UsersServlet?action=checkLogin" method="post">
                    <div id="login-email" class="field">
                        <label for="login-email-field">Enter Email</label>
                        <span>
                            <c:if test='${requestScope["error-email"] != null}'>
                                <span class="error" style="color: red">${requestScope["error-email"]}</span>
                            </c:if>
                       </span>
                        <input type="text" name="email" id="login-email-field">
                    </div>
                    <div id="login-password" class="field">
                        <label for="login-password-field">Password</label>
                        <span>
                            <c:if test='${requestScope["error-password"] != null}'>
                                <span class="error" style="color: red">${requestScope["error-password"]}</span>
                            </c:if>
                       </span>

                        <input type="password" name="password" id="login-password-field">
                    </div>
                    <div>
                        <button id="log-in-button"
                                class="recaptcha-trigger-button button green action-button expand-right">
                            <span class="label">Log In</span>
                            <span class="spinner"></span>
                        </button>

                        <a href="#" id="forgot-password-link" class="forgot-password-link" style="margin-top: 20px">
                            Forgot Password?
                        </a>
                    </div>
                </form>
                <form class="module login-form top-label-form" id="forgot-password-form" action="#0">
                    <h3>Reset Your Password</h3>
                    <div class="field">
                        <label for="forgot-email">Username Or Email</label>
                        <input type="text" id="forgot-email" name="forgot-email" placeholder="your@email.com"
                               required="">
                    </div>
                    <div class="field">
                        <input id="forgot-email-btn" type="submit" value="Send Password Reset Email"
                               class="button button-medium button-fullwidth">
                    </div>
                    <div id="sent-message">
                        <div id="sent-message-message"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="login-divider">
            <div class="bar bar-top"></div>
            <span class="login-or">OR</span>
            <div class="bar bar-bottom"></div>
        </div>
        <div class="login-half right">
            <div class="login-social-buttons">
                <form action="/auth/twitter" method="post">
                    <button id="login-with-twitter" type="submit"
                            class="button social-account-button twitter-button button-fullwidth">
                        <span>Log In with Twitter</span>
                    </button>
                </form>
                <form action="/auth/github" method="post">
                    <button id="login-with-github" type="submit"
                            class="button github-button social-account-button button-fullwidth">
                        <span>Log In with GitHub</span>
                    </button>
                </form>
                <form action="/auth/facebook" method="post">
                    <button id="login-with-facebook" type="submit"
                            class="button social-account-button facebook-button button-fullwidth">
                        <span>Log In with Facebook</span>
                    </button>
                </form>
            </div>
        </div>
        <div>
            <button type="button" class="btn btn-primary"
                    style="background-color: rgb(255,255,255);width: 100px;height: 30px">
                <a href="/HomeServlet" style="color: red"> <b>Back To Home</b></a>
            </button>
        </div>
    </div>
    <div class="signup-callout">
        Need an account? <a href="/login/register.jsp">Sign up now!</a>
    </div>
</div>
</body>
</html>