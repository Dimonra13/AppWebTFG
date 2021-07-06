<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.editProfile"/></title>
</head>
<!-- Body-->
<body>

<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-2"></div>
        <div class="col-md-8 pt-6 pt-sm-3">
            <div class="text-right">
                <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
            </div>
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <h2 class="h3 mb-3"><g:message code="update.user.title"/></h2>
            </div>
            <p class="text-muted mb-4"><g:message code="update.user.publi"/></p>
            <form action="/user/edit" class="needs-validation"  novalidate>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="username"><g:message code="update.user.username.label"/></label>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="user"></i></span></div>
                            <g:field type="text" class="form-control" name="username" id="username" value="${user.username}" required="true"/>
                            <div class="invalid-feedback"><g:message code="register.user.username.error"></g:message></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="email"><g:message code="update.user.email.label"/></label>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="mail"></i></span></div>
                            <g:field class="form-control" type="email" name="email" id="email" value="${user.email}" required="true"/>
                            <div class="invalid-feedback"><g:message code="register.user.email.error"></g:message></div>
                        </div>
                    </div>
                    <g:if test="${isregistered}">
                        <div class="col-12">
                            <!-- Warning alert -->
                            <div class="alert alert-warning" role="alert">
                                <div class="alert-icon-box">
                                    <i class="alert-icon" data-feather="alert-triangle"></i>
                                </div>
                            " -- <g:message code="update.user.isRegistered"/>
                            </div>
                        </div>
                    </g:if>
                    <div class="col-sm-6">
                        <label for="password"><g:message code="update.user.password.label"/></label>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="lock"></i></span></div>
                            <g:field class="form-control" type="password" name="password" id="password" value="" minlength="8" maxlength="12"
                                     pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,12}"/>
                            <div class="invalid-feedback"><g:message code="register.user.password.error"/></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="confirmPassword"><g:message code="update.user.confirmPassword.label"/></label>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="lock"></i></span></div>
                            <g:field class="form-control" type="password" name="confirmPassword" id="confirmPassword" value="" minlength="8" maxlength="12"
                                     pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,12}"/>
                            <div class="invalid-feedback"><g:message code="register.user.password.error"/></div>
                        </div>
                    </div>
                    <g:if test="${diferentPass}">
                        <div class="col-12">
                            <!-- Warning alert -->
                            <div class="alert alert-warning" role="alert">
                                <div class="alert-icon-box">
                                    <i class="alert-icon" data-feather="alert-triangle"></i>
                                </div>
                                " -- <g:message code="update.user.diferentPass"/>
                            </div>
                        </div>
                    </g:if>
                    <div class="col-sm-6">
                        <label for="phoneNumber"><g:message code="update.user.phoneNumber.label"/></label>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="phone"></i></span></div>
                            <g:field class="form-control" type="text" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}" pattern="[0-9]{9}" maxlength="9"/>
                            <div class="invalid-feedback"><g:message code="update.user.phoneNumber.error"></g:message></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="age"><g:message code="update.user.age.label"/></label>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="clock"></i></span></div>
                            <g:field class="form-control" type="number" name="age" id="age" value="${user.age}" min="1" max="100" pattern="^[0-9]+"/>
                            <div class="invalid-feedback"><g:message code="update.user.age.error"></g:message></div>
                        </div>
                    </div>
                </div>
                <div class="text-right">
                    <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'update.user.submit')}"></input>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>