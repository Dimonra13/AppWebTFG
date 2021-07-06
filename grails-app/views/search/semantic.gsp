<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.search.course.semantic"/></title>
</head>
<!-- Body-->
<body>
<asset:javascript src="jquery.star-rating-svg.js"/>
<asset:stylesheet src="star-rating-svg.css"/>

<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-1"></div>

        <div class="col-md-10 pt-6 pt-sm-3">
            <h2 class="h4 mb-3"><g:message code="course.search.semantic.title"/></h2>

            <p class="text-muted mb-4"><g:message code="course.search.semantic.description"/></p>

            <form action="/search/semanticSearch" class="needs-validation" novalidate>
                <!-- search-box-->
                <div class="flex-grow-1 pb-3 pt-sm-3 my-1 px-sm-2 pr-lg-4 order-sm-2">
                    <div class="input-group flex-nowrap">
                        <div class="input-group-prepend"><span class="input-group-text rounded-left" id="search-icon"><i
                                data-feather="search"></i></span></div>
                        <input class="form-control rounded-right" type="text" id="search-course" name="courseData"
                               placeholder="${message(code: 'course.search.semantic.bar')}" aria-label="Search site" aria-describedby="search-icon">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
    <div class="col-md-10 pt-6 pt-sm-3">
        <g:if test="${!foundCourses && search}">
            <!-- Info alert -->
            <div class="alert alert-info" role="alert">
                <div class="alert-icon-box">
                    <i class="alert-icon" data-feather="info"></i>
                </div>
                " -- <g:message code="course.search.noCourseFound"/>
            </div>
        </g:if><g:elseif test="${foundCourses}">
        <g:each var="course" in="${foundCourses}" status="i">
            <g:if test="${course}">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <a  href="/course/${course.id}/?recommendation=semanticSearch" class="col-lg-4 col-md-12 col-sm-12" style="display: flex;justify-content: center;">
                            <asset:image src="Categories/cat_${course.category}.jpg"/>
                        </a>
                        <div class="col-lg-8 col-md-12 col-sm-12">
                            <!-- Course details -->
                            <div class="d-flex flex-wrap justify-content-between pb-4 row">
                                <div class="col-lg-8 col-md-12 col-sm-12" style="display: inline-block;word-break: break-word;">
                                    <a href="/course/${course.id}/?recommendation=semanticSearch" style="color: black;"><h3 class="mb-0">${course.title}</h3></a><a class="font-size-lg text-warning" href="/category/${course.category}"><span><g:message code="categoryIndex.${course.category}"/></span></a>
                                </div>
                                <g:if test="${user}">
                                    <div class=" col-lg-4 col-md-12 col-sm-12 text-right" style="margin-top: 1rem;">
                                        <form action="/search/semanticSearch" method="post">
                                            <input type="hidden" name="bannedCourse" value="${course.id}">
                                            <g:if test="${isLast}">
                                                <input type="hidden" name="isLast" value="${isLast}">
                                            </g:if>
                                            <g:each var="searchCourse" in="${foundCourses}">
                                                <g:if test="${searchCourse?.id != course?.id}">
                                                    <input type="hidden" name="searchIDs" value="${searchCourse?.id}">
                                                </g:if>
                                            </g:each>
                                            <input type="submit" class="btn btn-primary" name="submit" value="${message(code: "recommender.notInterested")}">
                                        </form>
                                    </div>
                                </g:if>
                            </div>
                            <ul class="list-unstyled border p-3 mb-4">
                                <li class="pb-1"><span class="opacity-80">&ndash; <g:message code="course.profile.avgscore"/>:</span>
                                    <g:if test="${course?.rating}">
                                        <span class="my-rating" id="my-rating${i}"></span><span class="font-weight-semibold ml-1">(${course.rating})</span>
                                    </g:if>
                                    <g:else>
                                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noAvgscore"/></span>
                                    </g:else>
                                </li>
                                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.difficulty"/>:</span>
                                    <g:if test="${course?.difficulty}">
                                        <span class="font-weight-semibold ml-1"><g:message code="categoryIndex.difficulty.${course.difficulty}"/></span>
                                    </g:if>
                                    <g:else>
                                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noDifficulty"/></span>
                                    </g:else>
                                </li>
                                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.language"/>:</span>
                                    <g:if test="${course?.language}">
                                        <span class="font-weight-semibold ml-1">${course.language}</span>
                                    </g:if>
                                    <g:else>
                                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noLanguage"/></span>
                                    </g:else>
                                </li>
                                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.ogpage"/>:</span>
                                    <g:if test="${course?.originalPage}">
                                        <span class="font-weight-semibold ml-1">${course.originalPage}</span>
                                    </g:if>
                                    <g:else>
                                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noOgPage"/></span>
                                    </g:else>
                                </li>
                            </ul>
                            <div class="text-right">
                                <div class="pt-3"><a class="btn btn-outline-primary btn-sm" href="/course/${course.id}/?recommendation=semanticSearch"><i class="mr-1" data-feather="chevrons-right"></i><g:message code="course.search.link"></g:message></a></div>
                            </div>
                            <asset:image class="text-left" src="ogpageicons/${course.originalPage}.png" style="width: 5rem;height:5rem;position:relative; z-index:1;margin-top: -3rem;margin-left: 0.5rem;"/>
                        </div>
                    </div>
                </div>
            </div>
            <g:javascript>
                $("#my-rating${i}").starRating({
                initialRating: ${course?.rating?:0},
                strokeColor: '#894A00',
                activeColor: '#894A00',
                readOnly: true,
                strokeWidth: 5,
                starSize: 25
            });
            </g:javascript>
            </g:if>
        </g:each>
    </g:elseif>
    </div>
</div>
</div>
</body>
</html>