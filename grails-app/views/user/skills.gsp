<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.skills"/></title>
</head>
<!-- Body-->
<body>
<asset:javascript src="tagsinput.js"/>
<asset:stylesheet src="tagsinput.css"/>
<div class="container pt-lg-3 pb-5 mb-sm-5">
    <div class="row">
        <div class="col-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <g:if test="${update}">
                    <h2 class="h3 mb-3"><g:message code="skills.title.update"/></h2>
                    <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                </g:if>
                <g:else>
                    <h2 class="h3 mb-3"><g:message code="skills.title"/></h2>
                </g:else>
            </div>
        </div>
        <div class="col-1"></div>
        <div class="col-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
            <g:if test="${update}">
                <p class="text-muted mb-4"><g:message code="skills.explanation.update"/></p>
            </g:if>
            <g:else>
                <p class="text-muted mb-4"><g:message code="skills.explanation"/></p>
            </g:else>
        </div>
        <div class="col-1"></div>
        <div class="col-1"></div>
        <div class="col-md-10 pt-6 pt-sm-3">
            <form action="/user/updateSkills" class="needs-validation"  novalidate>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 mb-3"><g:message code="skills.basic"/></h2>
                        </div>
                        <div class="form-group">
                            <input type="text" id="basic" name="basic" data-role="tagsinput" value="${bs}">
                        </div>
                        <br>
                        <h2 class="h4 mb-3"><g:message code="skills.recommend"/></h2>
                        <p class="text-muted mb-4"><g:message code="skills.recommend.explain"/></p>
                        <div>
                            <g:each var="skill" in="${recommendedBS}" status="i">
                                <button type="button" value="${skill}" class="btn btn-pill btn-info basicSkillButton" style="margin-bottom: 5px;">${skill}</button>
                            </g:each>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 mb-3"><g:message code="skills.medium"/></h2>
                        </div>
                        <div class="form-group">
                            <input type="text" id="medium" name="medium" data-role="tagsinput" value="${ms}">
                        </div>
                        <br>
                        <h2 class="h4 mb-3"><g:message code="skills.recommend"/></h2>
                        <p class="text-muted mb-4"><g:message code="skills.recommend.explain"/></p>
                        <div>
                            <g:each var="skill" in="${recommendedMS}" status="i">
                                <button type="button" value="${skill}" class="btn btn-pill btn-info mediumSkillButton" style="margin-bottom: 5px;">${skill}</button>
                            </g:each>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                            <h2 class="h3 mb-3"><g:message code="skills.expert"/></h2>
                        </div>
                        <div class="form-group">
                            <input type="text" id="expert" name="expert" data-role="tagsinput" value="${es}">
                        </div>
                        <br>
                        <h2 class="h4 mb-3"><g:message code="skills.recommend"/></h2>
                        <p class="text-muted mb-4"><g:message code="skills.recommend.explain"/></p>
                        <div>
                            <g:each var="skill" in="${recommendedES}" status="i">
                                <button type="button" value="${skill}" class="btn btn-pill btn-info expertSkillButton" style="margin-bottom: 5px;">${skill}</button>
                            </g:each>
                        </div>
                    </div>
                </div>
                <br>
                <div class="text-right">
                    <g:if test="${!update}">
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'skills.submit')}"/>
                    </g:if>
                    <g:else>
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'skills.update.submit')}"/>
                    </g:else>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>