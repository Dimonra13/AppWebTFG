<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="profile.title"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
</head>

<body>
<h1>HEADER</h1>
</div>
<br>

<div class="container">
    <div class="row">
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <h2><g:message code="profile.image"/></h2>
                    <br>
                    <g:if test="${user.hasProfileImage}">
                        <img src="<g:createLink controller="user" action="renderProfileImage" id="${user.id}"/>" width="300"/>
                        <br>
                    </g:if>
                    <br>
                    <g:form url="[controller: 'User', action: 'editProfileImage']">
                        <g:submitButton name="submit"
                                        value="${message(code: 'profile.image.update')}"></g:submitButton>
                    </g:form>
                </div>
            </div>
        </div>

        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <h2><g:message code="profile.title"/></h2>
                    <br>

                    <div class="row">
                        <div class="col-1"></div>

                        <div class="col-5">
                            <h4><g:message code="profile.username"/></h4>

                            <p>${user.username}</p>
                            <br>
                        </div>

                        <div class="col-1"></div>

                        <div class="col-5">
                            <h4><g:message code="profile.email"/></h4>

                            <p>${user.email}</p>
                            <br>
                        </div>

                        <div class="col-1"></div>

                        <div class="col-5">
                            <h4><g:message code="profile.phoneNumber"/></h4>
                            <g:if test="${user.phoneNumber}">
                                <p>${user.phoneNumber}</p>
                            </g:if>
                            <g:else>
                                <p><g:message code="profile.noPhoneNumber"/></p>
                            </g:else>
                            <br>
                        </div>

                        <div class="col-1"></div>

                        <div class="col-8">
                            <g:form url="[controller: 'User', action: 'editProfile']">
                                <g:submitButton name="submit"
                                                value="${message(code: 'profile.edit')}"></g:submitButton>
                            </g:form>
                        </div>
                    </div>
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