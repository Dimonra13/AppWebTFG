<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title>COURSING.ME | Course List</title>
</head>
<!-- Body-->
<body>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'ListTable.css')}" type="text/css">

<!-- User course lists -->
<section class="container px-3 pt-4 mt-3">
    <g:if test="${isregistered}">
        <div class="text-right">
            <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
        </div>
        <br>
    </g:if>
    <div class="d-flex flex-wrap-reverse justify-content-between align-items-center pb-2">
        <div class="d-flex flex-wrap">
            <h2 class="h3 mb-3" style="word-break: break-word;">${courseList.name}</h2>
            <g:if test="${isregistered}">
                <a class="btn btn-outline-primary btn-sm mb-3" href="/editMyCourseList/${courseList?.id}" style="margin-left: 0.8rem;"><g:message code="courselist.edit"></g:message> <i class="mr-1" data-feather="edit"></i></a>
            </g:if>
        </div>
    </div>
    <g:if test="${courseList.description && courseList.description}">
        <div>
            <p class="lead" style="word-break: break-word;">${courseList.description}</p>
        </div>
    </g:if>

    <g:if test="${!courseList?.courses}">
        <!-- Info alert -->
        <div class="alert alert-info" role="alert">
            <div class="alert-icon-box">
                <i class="alert-icon" data-feather="info"></i>
            </div>
             " -- <g:message code="courseList.noCourses"/>
        </div>
    </g:if>
    <g:else>
        <table class='courseList-display-table'>
            <tr>
                <th><g:message code="courseList.course.table.name"/></th>
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
                <td style="word-break: break-word;">${course.title}</td>
                <td style="word-break: break-word;">${course?.rating}</td>
                <td>
                    <g:form url="/course/$course.id">
                        <g:submitButton name="submit" class="btn btn-outline-primary"
                                        value="${message(code: 'courseList.course.table.openCourse')}"></g:submitButton>
                    </g:form>
                </td>
                <g:if test="${isregistered}">
                    <td>
                        <g:form url="/courseList/deleteCourseFromMyCourseList">
                            <g:field type="hidden" name="idCourse" value="${course.id}"/>
                            <g:field type="hidden" name="idList" value="${courseList.id}"/>
                            <g:submitButton name="submit" class="btn btn-outline-primary"
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
</section>
<br>

</body>
</html>