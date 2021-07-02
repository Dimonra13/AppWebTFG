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
                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                        <h2 class="h3 mb-3"><g:message code="create.courseList.title"/></h2>
                        <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                    </div>
                    <form action="/createCourseList/create" class="needs-validation"  novalidate>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><g:message code="create.courseList.name.label"/></span></div>
                            <g:field type="text" class="form-control" name="name" id="name" value="" required="true" maxlength="25"/>
                            <div class="invalid-feedback"><g:message code="create.courseList.name.error"></g:message></div>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><g:message code="create.courseList.description.label"/></span></div>
                            <g:textArea class="form-control" name="description" value="" rows="5" cols="40"/>
                        </div>
                        <g:if test="${error}">
                            <p style="color:red"><g:message code="create.courseList.error"/></p>
                            <br>
                        </g:if>
                        <div class="text-right">
                            <g:field type="hidden" name="idCourse" value="${idCourse}"/>
                            <input type="hidden" name="recommendation" value="${recommendation}">
                            <g:submitButton name="submit" class="btn btn-primary"
                                            value="${message(code: 'create.courseList.submit')}"></g:submitButton>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>