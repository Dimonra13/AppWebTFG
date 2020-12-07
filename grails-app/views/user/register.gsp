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
    <div class="row">
        <div class="col-2"></div>

        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <h2><g:message code="register.user.title"/></h2>
                    <br>

                    <g:form url="[controller: 'User', action: 'registerUser']">
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="username"><g:message code="register.user.username.label"/></label>
                                <br>
                                <g:field type="text" name="username" id="username" value="" required="true"/>
                                <br><br>
                            </div>

                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="email"><g:message code="register.user.email.label"/></label>
                                <br>
                                <g:field type="email" name="email" id="email" value="" required="true"/>
                                <br><br>
                            </div>

                            <g:if test="${isregistered}">
                                <div class="col-1"></div>
                                <div class="col-11">
                                    <p style="color:red"><g:message code="register.user.isRegistered"/></p>
                                </div>
                            </g:if>

                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="password"><g:message code="register.user.password.label"/></label>
                                <br>
                                <g:field type="password" name="password" id="password" value="" required="true"/>
                                <br><br>
                            </div>

                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="confirmPassword"><g:message
                                        code="register.user.confirmPassword.label"/></label>
                                <br>
                                <g:field type="password" name="confirmPassword" id="confirmPassword" value="" required="true"/>
                                <br><br>
                            </div>

                            <g:if test="${diferentPass}">
                                <div class="col-1"></div>
                                <div class="col-11">
                                    <p style="color:red"><g:message code="register.user.diferentPass"/></p>
                                </div>
                            </g:if>

                            <div class="col-1"></div>
                            <div class="col-8">
                                <g:submitButton name="submit"
                                                value="${message(code: 'register.user.submit')}"></g:submitButton>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
<br>

<div>
    <h1>FOOTER</h1>
</div>
</body>
</html>