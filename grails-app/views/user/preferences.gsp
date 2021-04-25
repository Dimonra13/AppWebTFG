<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title>Preferences</title>
</head>
<!-- Body-->
<body>
<asset:javascript src="jquery.range.js"/>
<asset:stylesheet src="jquery.range.css"/>
<div class="container pt-lg-3 pb-5 mb-sm-5">
    <div class="row">
        <div class="col-md-12 pt-6 pt-sm-3 d-flex flex-wrap justify-content-between align-items-center pb-2">
            <g:if test="${update}">
                <h2 class="h3 mb-3"><g:message code="preferences.title.update"/></h2>
                <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
            </g:if>
            <g:else>
                <h2 class="h3 mb-3"><g:message code="preferences.title"/></h2>
            </g:else>
        </div>
        <div class="col-md-12 pt-6 pt-sm-3">
            <g:if test="${update}">
                <p class="text-muted mb-4"><g:message code="preferences.explanation.update"/></p>
            </g:if>
            <g:else>
                <p class="text-muted mb-4"><g:message code="preferences.explanation"/></p>
            </g:else>
        </div>
    </div>

    <form action="/user/updatePreferences" class="needs-validation" novalidate>
        <div class="row">
            <div class="col-md-6 pt-6 pt-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-4"><g:message code="preferences.duration"/></h2>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10">
                                <input name="duration" id="duration-input" class="single-slider" type="hidden"
                                <g:if test="${update && user.duration}">
                                    value="${user.duration}"/>
                                </g:if>
                                <g:else>
                                    value="2"/>
                                </g:else>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 pt-6 pt-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-4"><g:message code="preferences.cost"/></h2>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10">
                                <input name="cost" id="cost-input" class="single-slider" type="hidden"
                                <g:if test="${update && user.cost}">
                                    value="${user.cost}"/>
                                </g:if>
                                <g:else>
                                    value="2"/>
                                </g:else>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 pt-6 pt-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-4"><g:message code="preferences.popularity"/></h2>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10">
                                <input name="popularity" id="popularity-input" class="single-slider" type="hidden"
                                <g:if test="${update && user.popularity}">
                                    value="${user.popularity}"/>
                                </g:if>
                                <g:else>
                                    value="1"/>
                                </g:else>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 pt-6 pt-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-4"><g:message code="preferences.difficulty"/></h2>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10">
                                <input name="difficulty" id="difficulty-input" class="single-slider" type="hidden"
                                <g:if test="${update && user.difficulty}">
                                    value="${user.difficulty}"/>
                                </g:if>
                                <g:else>
                                    value="3"/>
                                </g:else>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>

        <div class="text-right">
            <g:if test="${!update}">
                <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'preferences.submit')}"/>
            </g:if>
            <g:else>
                <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'preferences.update.submit')}"/>
            </g:else>
        </div>
    </form>
</div>
<g:javascript>
    $('#duration-input').jRange({
        from: 1,
        to: 3,
        step: 0.1,
        scale: ['${message(code: 'preferences.duration.short')}',
                '${message(code: 'preferences.duration.middle')}',
                '${message(code: 'preferences.duration.long')}'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
    $('#cost-input').jRange({
        from: 1,
        to: 3,
        step: 0.1,
        scale: ['${message(code: 'preferences.cost.free')}',
                '${message(code: 'preferences.cost.middle')}',
                '${message(code: 'preferences.cost.expensive')}'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
    $('#popularity-input').jRange({
        from: 1,
        to: 2,
        step: 0.1,
        scale: ['${message(code: 'preferences.popularity.none')}',
                '${message(code: 'preferences.popularity.very')}'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
    $('#difficulty-input').jRange({
        from: 1,
        to: 5,
        step: 0.1,
        scale: ['${message(code: 'preferences.difficulty.easy.very')}',
                '${message(code: 'preferences.difficulty.easy')}',
                '${message(code: 'preferences.difficulty.middle')}',
                '${message(code: 'preferences.difficulty.hard')}',
                '${message(code: 'preferences.difficulty.hard.very')}'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
</g:javascript>
</body>
</html>