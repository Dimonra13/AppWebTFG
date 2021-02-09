<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="update.user.title"/></title>
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
                    <h2><g:message code="update.user.title"/></h2>
                    <br>

                    <g:form url="[controller: 'User', action: 'edit']">
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="username"><g:message code="update.user.username.label"/></label>
                                <br>
                                <g:field type="text" name="username" id="username" value="${user.username}" required="true"/>
                                <br><br>
                            </div>

                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="email"><g:message code="update.user.email.label"/></label>
                                <br>
                                <g:field type="email" name="email" id="email" value="${user.email}" required="true"/>
                                <br><br>
                            </div>

                            <g:if test="${isregistered}">
                                <div class="col-1"></div>
                                <div class="col-11">
                                    <p style="color:red"><g:message code="update.user.isRegistered"/></p>
                                </div>
                            </g:if>

                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="password"><g:message code="update.user.password.label"/></label>
                                <br>
                                <g:field type="password" name="password" id="password" value=""/>
                                <br><br>
                            </div>

                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="confirmPassword"><g:message
                                        code="update.user.confirmPassword.label"/></label>
                                <br>
                                <g:field type="password" name="confirmPassword" id="confirmPassword" value=""/>
                                <br><br>
                            </div>

                            <g:if test="${diferentPass}">
                                <div class="col-1"></div>
                                <div class="col-11">
                                    <p style="color:red"><g:message code="update.user.diferentPass"/></p>
                                </div>
                            </g:if>
                            <div class="col-1"></div>
                            <div class="col-5">
                                <label for="phoneNumber"><g:message code="update.user.phoneNumber.label"/></label>
                                <br>
                                <g:field type="text" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}"
                                         pattern="[0-9]{9}" maxlength="9" title="${message(code: 'update.user.phoneNumber.error')}"/>
                                <br><br>
                            </div>
                            <div class="col-1"></div>
                            <div class="col-8">
                                <g:submitButton name="submit"
                                                value="${message(code: 'update.user.submit')}"></g:submitButton>
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