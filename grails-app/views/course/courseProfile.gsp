<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title>COURSING.ME | Course</title>
</head>
<!-- Body-->
<body>
<asset:javascript src="jquery.star-rating-svg.js"/>
<asset:stylesheet src="star-rating-svg.css"/>

<div class="container pt-lg-3 pb-5 mb-sm-3">
    <div class="row pt-5">
        <!-- Sidebar-->
        <div class="col-xl-4 col-lg-4">
            <!-- Course category picture-->
            <div class="card">
                <div class="card-body">
                    <asset:image src="Categories/cat_${course.category}.jpg"/>
                </div>
            </div>
        </div>
        <!-- Main content-->
        <div class="col-lg-8">
            <!-- Course details -->
            <div class="d-flex flex-wrap justify-content-between pb-4">
                <div class="pt-3 mr-3">
                    <h3 class="mb-0">${course.title}</h3><span class="font-size-lg text-warning"><g:message code="categoryIndex.${course.category}"/></span>
                </div>
            </div>
            <ul class="list-unstyled border p-3 mb-4">
                <li class="pb-1"><span class="opacity-80">&ndash; <g:message code="course.profile.avgscore"/>:</span>
                    <g:if test="${course?.rating}">
                        <span class="my-rating"></span><span class="font-weight-semibold ml-1">(${course.rating})</span>
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
                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.duration"/>:</span>
                    <g:if test="${course?.duration}">
                        <span class="font-weight-semibold ml-1">${course.duration} <g:message code="course.profile.hours"/></span>
                    </g:if>
                    <g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noDuration"/></span>
                    </g:else>
                </li>
                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.author"/>:</span>
                    <g:if test="${course?.author}">
                        <span class="font-weight-semibold ml-1">${course.author}</span>
                    </g:if>
                    <g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noAuthor"/></span>
                    </g:else>
                </li>
                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.price"/>:</span>
                    <g:if test="${course.isFree==2}">
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.price.coursera"/></span>
                    </g:if><g:elseif test="${course.isFree==3}">
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.price.udacity"/></span>
                    </g:elseif><g:elseif test="${course.isFree==1}">
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.price.free"/></span>
                    </g:elseif><g:elseif test="${course.isFree==0 && course?.price}">
                        <span class="font-weight-semibold ml-1">${course.price}€</span>
                    </g:elseif><g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noPrice"/></span>
                    </g:else>
                </li>
                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.url"/>:</span>
                    <g:if test="${course?.url}">
                        <span class="font-weight-semibold ml-1"><a href="${course.url}">${course.url}</a></span>
                    </g:if>
                    <g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noUrl"/></span>
                    </g:else>
                </li>
            </ul>
        </div>
        <!-- Course description -->
        <g:if test="${course?.description}">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4><g:message code="course.profile.description"/></h4>
                        <p>${course?.description}</p>
                    </div>
                </div>
            </div>
        </g:if>
        <!-- Course List -->
        <g:if test="${user}">
            <div class="col-12">
                <br>
                <div class="card">
                    <div class="card-body">
                        <h4><g:message code="course.profile.addCourseToList"/></h4>
                        <g:if test="${lists}">
                            <p><g:message code="course.profile.addCourseToList.description"/></p>
                            <g:form url="/courseList/addCourseToMyCourseList">
                                <g:field type="hidden" name="idCourse" value="${course.id}"/>
                                <!-- Textual addon -->
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text font-weight-semibold"><g:message code="course.profile.lists"/></span>
                                    </div>
                                    <g:select class="form-control custom-select" name="idList" optionKey="id" optionValue="name" from="${lists}"/>
                                </div>
                                <br>
                                <div class="text-right">
                                    <g:submitButton class="btn btn-primary" name="submit" value="${message(code: 'course.profile.addCourseToList.button')}"></g:submitButton>
                                </div>
                            </g:form>
                        </g:if><g:else>
                        <p><g:message code="course.profile.noAvailableLists"/></p>
                        <g:form url="/createCourseList/">
                            <g:field type="hidden" name="idCourse" value="${course.id}"/>
                            <g:submitButton class="btn btn-primary" name="submit" value="${message(code: 'profile.lists.create')}"></g:submitButton>
                        </g:form>
                    </g:else>
                    </div>
                </div>
            </div>
        </g:if>
        <!-- Related courses -->
        <g:if test="${related}">
            <div class="col-12">
                <br><br>
                <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                    <h2 class="h3 mb-3"><g:message code="related.course.profile.title"/></h2>
                </div>
                <div class="row no-gutters">
                    <g:each var="course" in="${related}" status="i">
                        <!-- Course info -->
                        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
                            <div class="product-card">
                                <div class="product-thumb"><asset:image src="Categories/cat_${course.category}.jpg" style="height: 18rem;"/></div>
                                    <div class="product-card-body">
                                        <h5><a href="/course/${course.id}">${course.title}</a></h5>
                                        <g:if test="${course?.rating}">
                                            <p><span class="my-rating" id="my-rating${i}"></span><span class="font-weight-semibold ml-1"> (${course.rating})</span></p>
                                        </g:if>
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
            </g:each>
        </div>
            </div>
        </g:if>
    </div>
</div>
<g:javascript>
    $(".my-rating").starRating({
        initialRating: ${course?.rating?:0},
        strokeColor: '#894A00',
        activeColor: '#894A00',
        readOnly: true,
        strokeWidth: 5,
        starSize: 25
    });
</g:javascript>
</body>
</html>