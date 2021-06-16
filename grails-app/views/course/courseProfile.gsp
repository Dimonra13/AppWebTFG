<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title>COURSING.ME | Course</title>
</head>
<!-- Body-->
<body>


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
                    <h3 class="mb-0">${course.title}</h3><span class="font-size-lg text-warning">${course.category}</span>
                </div>
            </div>
            <ul class="list-unstyled border p-3 mb-4">
                <li class="pb-1"><span class="opacity-80">&ndash; <g:message code="course.profile.avgscore"/>:</span>
                    <g:if test="${course?.rating}">
                        <span class="font-weight-semibold ml-1">${course.rating}</span>
                    </g:if>
                    <g:else>
                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noAvgscore"/></span>
                    </g:else>
                </li>
                <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.difficulty"/>:</span>
                    <g:if test="${course?.difficulty}">
                        <span class="font-weight-semibold ml-1">${course.difficulty}</span>
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
            <section class="container px-3 pt-4 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h4><g:message code="course.profile.description"/></h4>
                        <p>${course?.description}</p>
                    </div>
                </div>
            </section>
        </g:if>
        <!-- Course List -->
        <g:if test="${user}">
            <section class="container px-3 pt-4 mt-3">
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
            </section>
        </g:if>
    </div>
</div>

</body>
</html>