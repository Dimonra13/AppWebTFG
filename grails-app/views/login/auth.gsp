<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title>COURSING.ME | Log in</title>
</head>
<!-- Body-->
<body>

<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-3"></div>
        <div class="col-md-6 pt-6 pt-sm-3">
            <div class="card">
                <div class="card-body">
                    <h2 class="h4 mb-1"><g:message code="login.user.title"></g:message></h2>
                    <h3 class="h6 font-weight-semibold opacity-70 pt-4 pb-2"><g:message code="login.user.publi"></g:message></h3>
                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="needs-validation"  autocomplete="off" novalidate>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="user"></i></span></div>
                            <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="${message(code: 'login.user.username')}" required autocapitalize="none"/>
                            <div class="invalid-feedback"><g:message code="login.user.username.error"></g:message></div>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="lock"></i></span></div>
                            <input class="form-control" type="password" placeholder="${message(code: 'login.user.password')}" name="${passwordParameter ?: 'password'}" id="password" required/>
                            <span class="input-group-text"><i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i></span>
                            <div class="invalid-feedback"><g:message code="login.user.password.error"></g:message></div>
                        </div>
                        <g:if test="${flash.message}">
                                <!-- Warning alert -->
                                <div class="alert alert-warning" role="alert">
                                    <g:message code="login.user.error"></g:message> <a href="/register" class="alert-link"><g:message code="login.user.register"/></a>.
                                </div>
                        </g:if>
                        <hr class="mt-4">
                        <div class="text-right pt-4">
                            <button class="btn btn-primary" type="submit">Sign In</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['username'].focus();
    });

    function passwordDisplayToggle() {
        var toggleEl = document.getElementById("passwordToggler");
        var eyeIcon = '\u{1F441}';
        var xIcon = '\u{2715}';
        var passEl = document.getElementById("password");

        if (passEl.type === "password") {
            toggleEl.innerHTML = xIcon;
            passEl.type = "text";
        } else {
            toggleEl.innerHTML = eyeIcon;
            passEl.type = "password";
        }
    }
</script>

</body>
</html>