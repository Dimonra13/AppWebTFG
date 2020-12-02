
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="register.user.title"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
</head>

<body>
<h1>HEADER</h1>
</div>
<br>

<div class="container">
    <div class="card">
        <div class="card-body">
                <h2><g:message code="register.user.title"/></h2>
            <br>

            <g:form url="[controller: 'User', action: 'registerUser']">
                <label for="username"><g:message code="register.user.username.label"/></label>
                <br>
                <g:field type="text" name="username" id="username" value=""/>
                <br><br>
                <label for="email"><g:message code="register.user.email.label"/></label>
                <br>
                <g:field type="email" name="email" id="email" value=""/>
                <br><br>
                <label for="password"><g:message code="register.user.password.label"/></label>
                <br>
                <g:field type="password" name="password" id="password" value=""/>
                <br><br>
                <label for="confirmPassword"><g:message code="register.user.confirmPassword.label"/></label>
                <br>
                <g:field type="password" name="confirmPassword" id="confirmPassword" value=""/>
                <br><br>
                    <g:submitButton name="submit" value="${message(code: 'register.user.submit')}"></g:submitButton>
            </g:form>
        </div>
    </div>
</div>
<br>

<div>
    <h1>FOOTER</h1>
</div>
</body>
</html>