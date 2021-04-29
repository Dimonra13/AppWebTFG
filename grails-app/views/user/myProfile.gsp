<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.myProfile"/></title>
</head>
<!-- Body-->
<body>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'ListTable.css')}" type="text/css">

<div class="container pt-lg-3 pb-5 mb-sm-3">
    <div class="row pt-5">
        <!-- Sidebar-->
        <div class="col-xl-4 col-lg-4">
        <!-- User picture-->
        <div class="card">
            <div class="card-body">
                <g:if test="${user?.hasProfileImage}">
                    <img style="max-height: 28rem;" src="<g:createLink controller="user" action="renderProfileImage" id="${user.id}"/>"/>
                    <br>
                </g:if>
                <g:else>
                    <asset:image src="account/default.jpg" class="grails-logo" style="max-height: 28rem;"/>
                    <br>
                </g:else>
                <g:if test="${isregistered}">
                    <br>
                    <g:form url="[controller: 'User', action: 'editProfileImage']">
                        <g:submitButton class="btn btn-primary" name="submit" id="editProfile"
                                        value="${message(code: 'profile.image.update')}"></g:submitButton>
                    </g:form>
                </g:if>
            </div>
        </div>
        </div>
        <!-- Main content-->
        <div class="col-lg-8">
            <!-- User details-->
            <div class="d-flex flex-wrap justify-content-between pb-4">
                <div class="pt-3 mr-3">
                    <h3 class="mb-0">${user.username}</h3><span class="font-size-sm text-warning">${user.email}</span>
                </div>
                <g:if test="${isregistered}">
                    <div class="pt-3"><a class="btn btn-outline-primary btn-sm" href="/user/editProfile"><i class="mr-1" data-feather="edit"></i><g:message code="profile.edit"></g:message></a></div>
                </g:if>
            </div>
            <ul class="list-unstyled border p-3 mb-4">
                <li class="pb-1"><span class="opacity-80">&ndash; <g:message code="profile.date"/>:</span><span class="font-weight-semibold ml-1">${user?.date}</span></li>
                <li class="pb-1"><span class="opacity-80">- <g:message code="profile.phoneNumber"/>:</span>
                    <g:if test="${user.phoneNumber}">
                        <span class="font-weight-semibold ml-1">${user.phoneNumber}</span>
                    </g:if>
                    <g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="profile.noPhoneNumber"/></span>
                    </g:else>
                </li>
                <li class="pb-1"><span class="opacity-80">- <g:message code="profile.age"/>:</span>
                    <g:if test="${user.age}">
                        <span class="font-weight-semibold ml-1">${user.age}</span>
                    </g:if>
                    <g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="profile.noAge"/></span>
                    </g:else>
                </li>
            </ul>
            <g:if test="${isregistered}">
                <div class="card">
                    <div class="card-body">
                        <g:if test="${!user.isPublicProfile}">
                            <div class="col-12">
                                <h4><g:message code="profile.visibility"/></h4>
                                <p><g:message code="profile.isPrivate"/></p>
                                <g:form url="[controller: 'User', action: 'makeProfilePublic']">
                                    <g:submitButton name="submit" class="btn btn-primary" id="public"
                                                    value="${message(code: 'profile.makePublic')}"
                                                    onclick="return confirm('${message(code: 'profile.makePublic.check')}')"></g:submitButton>
                                </g:form>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-12">
                                <h4><g:message code="profile.visibility"/></h4>
                                <p><g:message code="profile.isPublic"/></p>
                                <g:form url="[controller: 'User', action: 'makeProfilePrivate']">
                                    <g:submitButton name="submit" class="btn btn-primary" id="private"
                                                    value="${message(code: 'profile.makePrivate')}"
                                                    onclick="return confirm('${message(code: 'profile.makePrivate.check')}')"></g:submitButton>
                                </g:form>
                            </div>
                        </g:else>
                    </div>
                </div>
            </g:if>
        </div>
        <!-- User course lists -->
        <section class="container px-3 pt-4 mt-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <h2 class="h3 mb-3"><g:message code="profile.lists.title"/></h2>
                <g:if test="${isregistered}">
                    <a class="btn btn-outline-primary btn-sm" href="/createCourseList/"><i class="mr-1" data-feather="plus"></i><g:message code="profile.lists.create"></g:message></a>
                </g:if>
            </div>
            <g:if test="${!user?.lists}">
                <!-- Info alert -->
                <div class="alert alert-info" role="alert">
                    <div class="alert-icon-box">
                        <i class="alert-icon" data-feather="info"></i>
                    </div>
                    " -- <g:message code="profile.noLists"/>
                </div>
            </g:if>
            <g:else>
                <div>
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
                                        <g:submitButton name="submit" class="btn btn-outline-primary" id="myCourseList"
                                                        value="${message(code: 'profile.lists.table.openList')}"></g:submitButton>
                                    </g:form>
                                </td>
                                <td>
                                    <g:form url="/deleteMyCourseList/$courseList.id">
                                        <g:submitButton name="submit" class="btn btn-outline-primary" id="deleteMyCourseList"
                                                        value="${message(code: 'profile.lists.table.deleteList')}"
                                                        onclick="return confirm('${message(code: 'profile.lists.table.deleteList.check')}')"></g:submitButton>
                                    </g:form>
                                </td>
                            </g:if>
                            <g:else>
                                <td>
                                    <g:form url="/courseList/$courseList.id">
                                        <g:submitButton name="submit" class="btn btn-outline-primary" id="courseList"
                                                        value="${message(code: 'profile.lists.table.openList')}"></g:submitButton>
                                    </g:form>
                                </td>
                            </g:else>
                            </tr>
                        </g:each>
                    </table>
                </div>
            </g:else>
        </section>
    </div>
</div>

</body>
</html>