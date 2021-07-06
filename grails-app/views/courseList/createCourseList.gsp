<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title>COURSING.ME | Create List</title>
</head>
<!-- Body-->
<body>

<div class="container pt-lg-3 pb-5 mb-sm-3">
    <div class="row pt-5">
        <div class="col-2"></div>

        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <g:if test="${edit}">
                        <div class="text-right">
                            <a class="btn btn-outline-primary btn-sm" href="/myCourseList/${courseList?.id}"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="edit.courseList.back"></g:message></a>
                        </div>
                    </g:if><g:else>
                        <div class="text-right">
                            <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                        </div>
                    </g:else>
                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                        <g:if test="${edit}">
                            <h2 class="h3 mb-3" style="word-break: break-word;"><g:message code="edit.courseList.title"/></h2>
                        </g:if><g:else>
                            <h2 class="h3 mb-3" style="word-break: break-word;"><g:message code="create.courseList.title"/></h2>
                        </g:else>
                    </div>
                    <g:if test="${edit}">
                        <form action="/editMyCourseList/edit" class="needs-validation"  novalidate>
                    </g:if><g:else>
                        <form action="/createCourseList/create" class="needs-validation"  novalidate>
                    </g:else>
                        <g:if test="${edit}">
                            <input type="hidden" name="courseListid" value="${courseList?.id}">
                        </g:if>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><g:message code="create.courseList.name.label"/></span></div>
                            <g:if test="${edit}">
                                <g:field type="text" class="form-control" name="name" id="name" value="${courseList?.name}" required="true"/>
                            </g:if><g:else>
                                <g:field type="text" class="form-control" name="name" id="name" value="" required="true"/>
                            </g:else>
                            <div class="invalid-feedback"><g:message code="create.courseList.name.error"></g:message></div>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><g:message code="create.courseList.description.label"/></span></div>
                            <g:if test="${edit}">
                                <g:textArea class="form-control" name="description" value="${courseList?.description}" rows="5" cols="40"/>
                            </g:if><g:else>
                                <g:textArea class="form-control" name="description" value="" rows="5" cols="40"/>
                            </g:else>
                        </div>
                        <g:if test="${error}">
                            <p style="color:red"><g:message code="create.courseList.error"/></p>
                            <br>
                        </g:if>
                        <div class="text-right">
                            <g:field type="hidden" name="idCourse" value="${idCourse}"/>
                            <input type="hidden" name="recommendation" value="${recommendation}">
                            <g:if test="${edit}">
                                <g:submitButton name="submit" class="btn btn-primary"
                                                value="${message(code: 'edit.courseList.submit')}"></g:submitButton>
                            </g:if><g:else>
                                <g:submitButton name="submit" class="btn btn-primary"
                                                value="${message(code: 'create.courseList.submit')}"></g:submitButton>
                            </g:else>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>