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
        <div class="col-2"></div>

        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <h2><g:message code="course.profile.title"/></h2>
                    <br>

                    <div class="row">

                        <div class="col-4">
                            <h4><g:message code="course.profile.name"/></h4>

                            <p>${course?.title}</p>
                            <br>
                        </div>

                        <div class="col-4">
                            <h4><g:message code="course.profile.avgscore"/></h4>
                            <g:if test="${course?.rating}">
                                <p>${course?.rating}</p>
                            </g:if>
                            <g:else>
                                <p style="color:red"><g:message code="course.profile.noAvgScore"/></p>
                            </g:else>
                            <br>
                        </div>

                        <div class="col-4">

                        </div>

                        <div class="col-12">
                            <h4><g:message code="course.profile.description"/></h4>
                            <g:if test='${course?.description}'>
                                <p>${course?.description}</p>
                            </g:if>
                            <g:else>
                                <p style="color:red"><g:message code="course.profile.noDescription"/></p>
                            </g:else>
                            <br>
                        </div>
                        <g:if test="${user}">
                            <div class="col-12">
                                <h4><g:message code="course.profile.addCourseToList"/></h4>
                                <g:if test="${lists}">
                                    <g:form url="/courseList/addCourseToMyCourseList">
                                        <g:field type="hidden" name="idCourse" value="${course.id}"/>
                                        <g:select name="idList" optionKey="id" optionValue="name" from="${lists}"/>
                                        <g:submitButton name="submit"
                                                        value="${message(code: 'course.profile.addCourseToList')}"></g:submitButton>
                                    </g:form>
                                </g:if>
                                <g:else>
                                    <p><g:message code="course.profile.noAvailableLists"/></p>
                                    <g:form url="/createCourseList/">
                                        <g:field type="hidden" name="idCourse" value="${course.id}"/>
                                        <g:submitButton name="submit"
                                                        value="${message(code: 'profile.lists.create')}"></g:submitButton>
                                    </g:form>
                                </g:else>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>

</body>
</html>