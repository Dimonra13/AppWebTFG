<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.editProfileImage"/></title>
</head>
<!-- Body-->
<body>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'file.upload.css')}" type="text/css">
<br><br>

<div class="container pt-lg-3 pb-5 mb-sm-5">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                        <h2 class="h3 mb-3"><g:message code="profile.image.title"/></h2>
                        <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                    </div>
                    <br>
                    <g:uploadForm name="uploadProfileImage" action="updateProfileImage">
                        <g:hiddenField name="ownerId" value="${user?.id}" />
                        <div class="row">
                        <div class="file-input col-4">
                            <input name="featuredImageFile" type="file" id="file" class="file">
                            <label for="file" class="font-size-lg" id="file-name">
                                <g:message code="profile.image.choose"></g:message>
                            </label>
                        </div>
                        <div class="col-8">
                            <p class="file-name"></p>
                        </div>
                        </div>
                        <br>
                        <g:if test="${error}">
                            <p style="color:red"><g:message code="profile.image.error"/></p>
                        </g:if>
                        <g:if test="${errorNoImage}">
                            <p style="color:red"><g:message code="profile.image.error.noImage"/></p>
                        </g:if>
                        <fieldset class="buttons">
                            <div class="row">
                                <div class="col-4">
                                    <input class="btn btn-primary" type="submit" value="${message(code: 'profile.image.update.button', default: 'Upload')}"/>
                                </div>
                                <div class="col-4">
                                    <g:actionSubmit class="btn btn-primary" value="${message(code: 'profile.image.delete.button')}" action="deleteProfileImage"/>
                                </div>
                            </div>
                        </fieldset>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const file = document.querySelector('#file');
    file.addEventListener('change', (e) => {
        // Get the selected file
        const [file] = e.target.files;
        // Get the file name and size
        const { name: fileName, size } = file;
        // Set the text content
        const fileNameAndSize = fileName
        document.querySelector('.file-name').textContent = fileNameAndSize;
    });
</script>

</body>
</html>