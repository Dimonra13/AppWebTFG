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
        <div class="col-md-12 pt-6 pt-sm-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <g:if test="${update}">
                    <h2 class="h3 mb-3">Actualiza tus preferencias</h2>
                    <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                </g:if>
                <g:else>
                    <h2 class="h3 mb-3">¿Cuáles son tus preferencias?</h2>
                </g:else>
            </div>
        </div>
    </div>

    <form action="/user/updatePreferences" class="needs-validation" novalidate>
        <div class="row">
            <div class="col-md-6 pt-6 pt-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-4">Duración de los cursos</h2>

                        <div class="row">
                            <div class="col-1"></div>

                            <div class="col-10">
                                <input name="length" id="length-input" class="single-slider" type="hidden" value="2"/>
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
                        <h2 class="h4 mb-4">Coste de los cursos</h2>

                        <div class="row">
                            <div class="col-1"></div>

                            <div class="col-10">
                                <input name="cost" id="cost-input" class="single-slider" type="hidden" value="2"/>
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
                        <h2 class="h4 mb-4">Popularidad de los cursos</h2>

                        <div class="row">
                            <div class="col-1"></div>

                            <div class="col-10">
                                <input name="popularity" id="popularity-input" class="single-slider" type="hidden"
                                       value="1"/>
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
                        <h2 class="h4 mb-4">Dificultad de los cursos</h2>

                        <div class="row">
                            <div class="col-1"></div>

                            <div class="col-10">
                                <input name="difficulty" id="difficulty-input" class="single-slider" type="hidden"
                                       value="3"/>
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
                <input type="submit" class="btn btn-primary" name="submit" value="Actualizar preferencias"/>
            </g:if>
            <g:else>
                <input type="submit" class="btn btn-primary" name="submit" value="Añadir preferencias"/>
            </g:else>
        </div>
    </form>
</div>
<g:javascript>
    $('#length-input').jRange({
        from: 1,
        to: 3,
        step: 0.1,
        scale: ['Muy corto', 'Me da igual', 'Muy largo'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
    $('#cost-input').jRange({
        from: 1,
        to: 3,
        step: 0.1,
        scale: ['Gratis', 'Me da igual', 'Caro'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
    $('#popularity-input').jRange({
        from: 1,
        to: 2,
        step: 0.1,
        scale: ['Me da igual', 'Muy populares'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
    $('#difficulty-input').jRange({
        from: 1,
        to: 5,
        step: 0.1,
        scale: ['Muy fácil', 'Fácil', 'Me da igual', 'Difícil', 'Muy difícil'],
        format: '%s',
        width: 'auto', //Very important in order to allow the range input to be responsive
        showLabels: false,
        snap: false
    });
</g:javascript>
</body>
</html>