<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.search.user"/></title>
</head>
<!-- Body-->
<body>

<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-1"></div>

        <div class="col-md-10 pt-6 pt-sm-3">
            <h2 class="h4 mb-3"><g:message code="user.search.title"/></h2>

            <p class="text-muted mb-4"><g:message code="user.search.description"/></p>

            <form action="/search/searchUser" class="needs-validation" novalidate>
                <!-- search-box-->
                <div class="flex-grow-1 pb-3 pt-sm-3 my-1 px-sm-2 pr-lg-4 order-sm-2">
                    <div class="input-group flex-nowrap">
                        <div class="input-group-prepend">
                            <button type="submit" class="btn searchbutton input-group-text rounded-left" id="search-icon">
                                <i data-feather="search"></i>
                            </button>
                        </div>
                        <g:if test="${userData && userData!=""}">
                            <input class="form-control rounded-right" type="text" id="search-user" name="userData" value="${userData}"
                                   placeholder="${message(code: 'user.search.bar')}" aria-label="Search site" aria-describedby="search-icon">
                        </g:if><g:else>
                            <input class="form-control rounded-right" type="text" id="search-user" name="userData"
                               placeholder="${message(code: 'user.search.bar')}" aria-label="Search site" aria-describedby="search-icon">
                        </g:else>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
        <g:if test="${!foundUsers && search}">
            <!-- Info alert -->
            <div class="alert alert-info alert-with-icon" role="alert">
                <div class="alert-icon-box">
                    <i class="alert-icon" data-feather="info"></i>
                </div>
                <g:message code="user.search.noUserFound"/>
            </div>
        </g:if><g:elseif test="${foundUsers}">
            <h2 style="display: inline-block;word-break: break-word;"><g:message code="search.results.for"></g:message> "${userData}"</h2>
            <br><br>
            <g:each var="user" in="${foundUsers}" status="i">
                <g:if test="${user}">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 col-md-12 col-sm-12" style="display: flex;justify-content: center;">
                                <g:if test="${user?.hasProfileImage}">
                                    <img style="max-height: 18rem;display:block;margin:auto;" src="<g:createLink controller="user" action="renderProfileImage" id="${user.id}"/>"/>
                                    <br>
                                </g:if>
                                <g:else>
                                    <asset:image src="account/default.jpg" class="grails-logo" style="max-height: 18rem;display:block;margin:auto;"/>
                                    <br>
                                </g:else>
                            </div>
                            <div class="col-lg-8 col-md-12 col-sm-12">
                                <!-- User details-->
                                <div class="d-flex flex-wrap justify-content-between pb-4" style="display: inline-block;word-break: break-word;">
                                    <div class="pt-3 mr-3">
                                        <h3 class="mb-0">${user.username}</h3><span class="font-size-lg text-warning">${user.email}</span>
                                    </div>
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
                                <div class="text-right">
                                    <div class="pt-3"><a class="btn btn-outline-primary btn-sm" href="/profile/${user.id}"><i class="mr-1" data-feather="chevrons-right"></i><g:message code="user.search.profile.link"></g:message></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </g:if>
            </g:each>
                <!-- Pagination-->
                <br>
                <div class="row">
                    <nav style="margin: auto" aria-label="Page navigation example">
                        <ul class="pagination">
                            <g:if test="${offset}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${offset-10}">
                                        <button type="submit" class="page-link" name="submit"><i data-feather="chevron-left"></i><g:message code="course.search.pagination.previous"/></button>
                                    </form>
                                </li>
                            </g:if>
                        <!-- First page pointer -->
                            <g:if test="${page==1}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        1
                                    </span>
                                </li>
                            </g:if><g:else>
                                <li class="page-item">
                                    <form action="/search/searchUser" method="post">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="0">
                                        <button type="submit" class="page-link" name="submit">1</button>
                                    </form>
                                </li>
                            </g:else>
                        <!-- Second page pointer or ... -->
                            <g:if test="${(page==1 || page==3) && lastPage>2}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="10">
                                        <button type="submit" class="page-link" name="submit">2</button>
                                    </form>
                                </li>
                            </g:if><g:elseif test="${page==2 && lastPage>2}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        2
                                    </span>
                                </li>
                            </g:elseif><g:elseif test="${page>3 && lastPage>4}">
                                <li class="page-item" style="pointer-events: none;">
                                    <span class="page-link"> ... </span>
                                </li>
                            </g:elseif>

                            <g:if test="${page>3 && page==lastPage}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${10*(page-3)}">
                                        <button type="submit" class="page-link" name="submit">${page-2}</button>
                                    </form>
                                </li>
                            </g:if>
                        <!-- Third page pointer or previous page pointer -->
                            <g:if test="${(page==1 || page==2) && lastPage>3}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${20}">
                                        <button type="submit" class="page-link" name="submit">3</button>
                                    </form>
                                </li>
                            </g:if><g:elseif test="${page==3 && lastPage>3}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        3
                                    </span>
                                </li>
                            </g:elseif><g:elseif test="${lastPage>3}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${10*(page-2)}">
                                        <button type="submit" class="page-link" name="submit">${page-1}</button>
                                    </form>
                                </li>
                            </g:elseif>
                        <!-- Four page pointer or actual page pointer -->
                            <g:if test="${page==3 && lastPage>4}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${30}">
                                        <button type="submit" class="page-link" name="submit">4</button>
                                    </form>
                                </li>
                            </g:if><g:elseif test="${page>3 && lastPage>page}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        ${page}
                                    </span>
                                </li>
                            </g:elseif>
                        <!-- Next page pointer -->
                            <g:if test="${page>3 && lastPage>(page+1)}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${10*page}">
                                        <button type="submit" class="page-link" name="submit">${page+1}</button>
                                    </form>
                                </li>
                            </g:if>
                        <!-- Second ... -->
                            <g:if test="${lastPage>4 && lastPage>(page+2)}">
                                <li class="page-item" style="pointer-events: none;">
                                    <span class="page-link"> ... </span>
                                </li>
                            </g:if>
                        <!-- last page pointer -->
                            <g:if test="${page==lastPage && lastPage>1}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        ${lastPage}
                                    </span>
                                </li>
                            </g:if><g:elseif test="${lastPage>1}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${10*(lastPage-1)}">
                                        <button type="submit" class="page-link" name="submit">${lastPage}</button>
                                    </form>
                                </li>
                            </g:elseif>

                            <g:if test="${isMore}">
                                <li class="page-item">
                                    <form action="/search/searchUser">
                                        <input type="hidden" name="userData" value="${userData}">
                                        <input type="hidden" name="offset" value="${offset+10}">
                                        <button type="submit" class="page-link" name="submit"><g:message code="course.search.pagination.next"/><i data-feather="chevron-right"></i></button>
                                    </form>
                                </li>
                            </g:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </g:elseif>
        </div>
    </div>
</div>

</body>
</html>