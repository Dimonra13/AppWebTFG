<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="profile.image.title"/></title>
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
                    <h2><g:message code="profile.image.title"/></h2>
                    <br>
                    <g:uploadForm name="uploadProfileImage" action="updateProfileImage">
                        <g:hiddenField name="ownerId" value="${user?.id}" />
                        <input type="file" name="featuredImageFile"/>
                        <br><br>
                        <g:if test="${error}">
                            <p style="color:red"><g:message code="profile.image.error"/></p>
                        </g:if>
                        <g:if test="${errorNoImage}">
                            <p style="color:red"><g:message code="profile.image.error.noImage"/></p>
                        </g:if>
                        <fieldset class="buttons">
                            <div class="row">
                                <div class="col-4">
                                    <input type="submit" value="${message(code: 'profile.image.update.button', default: 'Upload')}"/>
                                </div>
                                <div class="col-4">
                                    <g:actionSubmit value="${message(code: 'profile.image.delete.button')}" action="deleteProfileImage"/>
                                </div>
                            </div>
                        </fieldset>
                    </g:uploadForm>
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