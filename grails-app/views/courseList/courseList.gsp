<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="courseList.title"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ListTable.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
</head>

<body>
<h1>HEADER</h1>
</div>
<br>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <h2><g:message code="courseList.title"/> : ${courseList.name}</h2>
                        </div>
                        <div class="col-12">
                            <h3><g:message code="courseList.description"/></h3>
                            <g:if test="${courseList.description && courseList.description}">
                                <p>${courseList.description}</p>
                            </g:if>
                            <g:else>
                                <p><g:message code="courseList.noDescription"/></p>
                            </g:else>
                        </div>
                    </div>
                    <br>
                    <g:if test="${!courseList?.courses}">
                        <p><g:message code="courseList.noCourses"/></p>
                    </g:if>
                    <g:else>
                        <table class='courseList-display-table'>
                            <tr>
                                <th><g:message code="courseList.course.table.name"/></th>
                                <th><g:message code="courseList.course.table.description"/></th>
                                <th><g:message code="courseList.course.table.avgScore"/></th>
                                <th><g:message code="courseList.course.table.link"/></th>
                                <g:if test="${isregistered}">
                                    <th><g:message code="courseList.course.table.delete"/></th>
                                </g:if>
                            </tr>

                            <g:each var="course" in="${courseList?.courses}" status="i">
                                <g:if test="${i % 2 == 0}">
                                    <tr class="even-row">
                                </g:if>
                                <g:else>
                                    <tr class="odd-row">
                                </g:else>
                                <td>${course.name}</td>
                                <g:if test="${course?.description?.length()<20}">
                                    <td>${course.description}</td>
                                </g:if>
                                <g:else>
                                    <td>${course?.description?.substring(0,20)}</td>
                                </g:else>
                                <td>${course?.avgscore}</td>
                                <td>
                                    <g:form url="/course/$course.id">
                                        <g:submitButton name="submit"
                                                        value="${message(code: 'courseList.course.table.openCourse')}"></g:submitButton>
                                    </g:form>
                                </td>
                                <g:if test="${isregistered}">
                                    <td>
                                        <g:form url="/courseList/deleteCourseFromMyCourseList">
                                            <g:field type="hidden" name="idCourse" value="${course.id}"/>
                                            <g:field type="hidden" name="idList" value="${courseList.id}"/>
                                            <g:submitButton name="submit"
                                                            value="${message(code: 'courseList.course.table.deleteCourse')}"
                                                            onclick="return confirm('${message(code: 'courseList.course.table.deleteCourse.check')}')"></g:submitButton>
                                        </g:form>
                                    </td>
                                </g:if>
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