<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="course.profile.title"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
</head>

<body>
<h1>HEADER</h1>
</div>
<br>

<div class="container">
    <div class="row">
        <div class="col-2"></div>

        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <h2><g:message code="course.profile.title"/></h2>
                    <br>

                    <div class="row">

                        <div class="col-4">
                            <h4><g:message code="course.profile.name"/></h4>

                            <p>${course?.name}</p>
                            <br>
                        </div>

                        <div class="col-4">
                            <h4><g:message code="course.profile.avgscore"/></h4>
                            <g:if test="${course?.avgscore}">
                                <p>${course?.avgscore}</p>
                            </g:if>
                            <g:else>
                                <p style="color:red"><g:message code="course.profile.noAvgScore"/></p>
                            </g:else>
                            <br>
                        </div>

                        <div class="col-4">
                            <h4><g:message code="course.profile.studentNumber"/></h4>
                            <g:if test="${course?.studentNumber}">
                                <p>${course?.studentNumber}</p>
                            </g:if>
                            <g:else>
                                <p style="color:red"><g:message code="course.profile.noStudentNumber"/></p>
                            </g:else>
                            <br>
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
                                <g:form url="/courseList/addCourseToMyCourseList">
                                    <g:field type="hidden" name="idCourse" value="${course.id}"/>
                                    <g:select name="idList" optionKey="id" optionValue="name" from="${user?.lists}"/>
                                    <g:submitButton name="submit"
                                                    value="${message(code: 'course.profile.addCourseToList')}"></g:submitButton>
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

<div>
    <h1>FOOTER</h1>
</div>
</body>
</html>