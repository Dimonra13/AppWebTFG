<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.register"/></title>
</head>
<!-- Body-->
<body>

<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-1"></div>

        <div class="col-md-10 pt-6 pt-sm-3">
            <h2 class="h4 mb-3"><g:message code="register.user.search.title"/></h2>

            <p class="text-muted mb-4"><g:message code="register.user.search.description"/></p>

            <form action="/search/searchUser" class="needs-validation" novalidate>
                <!-- search-box-->
                <div class="flex-grow-1 pb-3 pt-sm-3 my-1 px-sm-2 pr-lg-4 order-sm-2">
                    <div class="input-group flex-nowrap">
                        <div class="input-group-prepend"><span class="input-group-text rounded-left" id="search-icon"><i
                                data-feather="search"></i></span></div>
                        <input class="form-control rounded-right" type="text" id="search-user" name="userData"
                               placeholder="Search site" aria-label="Search site" aria-describedby="search-icon">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
        <g:each var="user" in="${foundUsers}" status="i">
            <div class="card">
                    <div class="card-body">
                         <div class="row">
                             <div class="col-md-4" style="display: flex;justify-content: center;">
                                 <g:if test="${user?.hasProfileImage}">
                                     <img style="max-height: 18rem;display:block;margin:auto;" src="<g:createLink controller="user" action="renderProfileImage" id="${user.id}"/>"/>
                                     <br>
                                 </g:if>
                                 <g:else>
                                     <asset:image src="account/default.jpg" class="grails-logo" style="max-height: 18rem;display:block;margin:auto;"/>
                                     <br>
                                 </g:else>
                             </div>
                             <div class="col-md-8">
                                 <!-- User details-->
                                 <div class="d-flex flex-wrap justify-content-between pb-4">
                                     <div class="pt-3 mr-3">
                                         <h3 class="mb-0">${user.username}</h3><span class="font-size-sm text-warning">${user.email}</span>
                                     </div>
                                 <div class="pt-3"><a class="btn btn-outline-primary btn-sm" href="/profile/${user.id}"><i class="mr-1" data-feather="chevrons-right"></i><g:message code="user.search.profile.link"></g:message></a></div>
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
                             </div>
                         </div>
                    </div>
            </div>
        </g:each>
        </div>
    </div>
</div>

</body>
</html>