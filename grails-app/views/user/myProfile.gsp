<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="profile.title"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ListTable.css')}" type="text/css">
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
                    <g:if test="${user?.hasProfileImage}">
                        <img src="<g:createLink controller="user" action="renderProfileImage" id="${user.id}"/>"
                             width="300"/>
                        <br>
                    </g:if>
                    <g:else>
                        <asset:image src="grails.svg" class="grails-logo" width="300"/>
                        <br>
                    </g:else>
                    <br>
                    <g:if test="${isregistered}">
                        <g:form url="[controller: 'User', action: 'editProfileImage']">
                            <g:submitButton name="submit"
                                            value="${message(code: 'profile.image.update')}"></g:submitButton>
                        </g:form>
                    </g:if>
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
                        <g:if test="${isregistered}">
                            <div class="col-1"></div>

                            <div class="col-8">
                                <g:form url="[controller: 'User', action: 'editProfile']">
                                    <g:submitButton name="submit"
                                                    value="${message(code: 'profile.edit')}"></g:submitButton>
                                </g:form>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <h2><g:message code="profile.lists.title"/></h2>
                        </div>
                        <g:if test="${isregistered}">
                            <div class="col-4">
                                <g:form url="/createCourseList/">
                                    <g:submitButton name="submit"
                                                    value="${message(code: 'profile.lists.create')}"></g:submitButton>
                                </g:form>
                            </div>
                        </g:if>
                    </div>
                    <br>
                    <g:if test="${!user?.lists}">
                        <p><g:message code="profile.noLists"/></p>
                    </g:if>
                    <g:else>
                        <table class='courseList-display-table'>
                            <tr>
                                <th><g:message code="profile.lists.table.name"/></th>
                                <th><g:message code="profile.lists.table.description"/></th>
                                <th><g:message code="profile.lists.table.courseNumber"/></th>
                                <th><g:message code="profile.lists.table.link"/></th>
                                <g:if test="${isregistered}">
                                    <th><g:message code="profile.lists.table.delete"/></th>
                                </g:if>
                            </tr>

                            <g:each var="courseList" in="${user?.lists}" status="i">
                                <g:if test="${i % 2 == 0}">
                                    <tr class="even-row">
                                </g:if>
                                <g:else>
                                    <tr class="odd-row">
                                </g:else>
                                <td>${courseList.name}</td>
                                <g:if test="${courseList?.description?.length()<20}">
                                    <td>${courseList.description}</td>
                                </g:if>
                                <g:else>
                                    <td>${courseList?.description?.substring(0,20)}</td>
                                </g:else>
                                <td>${courseList.courses.size()}</td>
                                <g:if test="${isregistered}">
                                    <td>
                                        <g:form url="/myCourseList/$courseList.id">
                                            <g:submitButton name="submit"
                                                            value="${message(code: 'profile.lists.table.openList')}"></g:submitButton>
                                        </g:form>
                                    </td>
                                    <td>
                                        <g:form url="/deleteMyCourseList/$courseList.id">
                                            <g:submitButton name="submit"
                                                            value="${message(code: 'profile.lists.table.deleteList')}"
                                                            onclick="return confirm('${message(code: 'profile.lists.table.deleteList.check')}')"></g:submitButton>
                                        </g:form>
                                    </td>
                                </g:if>
                                <g:else>
                                    <td>
                                        <g:form url="/courseList/$courseList.id">
                                            <g:submitButton name="submit"
                                                            value="${message(code: 'profile.lists.table.openList')}"></g:submitButton>
                                        </g:form>
                                    </td>
                                </g:else>
                                </tr>
                            </g:each>
                        </table>
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <h1>FOOTER</h1>
</div>
</body>
</html>