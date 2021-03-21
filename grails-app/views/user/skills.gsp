<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.skills"/></title>
</head>
<!-- Body-->
<body>
<div class="container pt-lg-3 pb-5 mb-sm-5">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <h2 class="h3 mb-3"><g:message code="skill.title"/></h2>
                <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
            </div>
        </div>
        <div class="col-1"></div>
        <div class="col-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
            <p class="text-muted mb-4"><g:message code="skills.explanation"/></p>
        </div>
        <div class="col-1"></div>
        <div class="col-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
            <form action="/" class="needs-validation"  novalidate>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 mb-3"><g:message code="skills.basic"/></h2>
                        </div>
                        <br>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 mb-3"><g:message code="skills.medium"/></h2>
                        </div>
                        <br>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 mb-3"><g:message code="skills.expert"/></h2>
                        </div>
                        <br>
                    </div>
                </div>
                <br>
                <div class="text-right">
                    <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'skills.submit')}"/>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>