<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="create.courseList.title"/></title>
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
                    <h2><g:message code="create.courseList.title"/></h2>
                    <br>

                    <g:form url="[controller: 'CourseList', action: 'create']">
                        <div class="row">
                            <div class="col-12">
                                <label for="name"><g:message code="create.courseList.name.label"/></label>
                                <br>
                                <g:field type="text" name="name" id="name" value="" required="true"/>
                                <br><br>
                            </div>

                            <div class="col-12">
                                <label for="description"><g:message code="create.courseList.description.label"/></label>
                                <br>
                                <g:textArea name="description" value="" rows="5" cols="40"/>
                                <br><br>
                            </div>
                            <g:if test="${error}">
                                <p style="color:red"><g:message code="create.courseList.error"/></p>
                            </g:if>
                            <div class="col-12">
                                <g:submitButton name="submit"
                                                value="${message(code: 'create.courseList.submit')}"></g:submitButton>
                            </div>
                        </div>
                    </g:form>
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