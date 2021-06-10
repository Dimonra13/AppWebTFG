<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.interests"/></title>
</head>
<!-- Body-->
<body>
<div class="container pt-lg-3 pb-5 mb-sm-5">
    <g:set var="catList" value="${['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                                      'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                                      'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                                      'Graphic-Design','Gaming','Google','Apple','Oracle','Microsoft','SAP']}"/>
    <div class="row">
        <!-- Featured products grid-->
        <section class="container px-3 pt-4 mt-3">
            <div class="col-md-12 pt-6 pt-sm-3 d-flex flex-wrap justify-content-between align-items-center pb-2">
                <g:if test="${update}">
                    <h2 class="h3 mb-3"><g:message code="interest.title.update"/></h2>
                    <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                </g:if>
                <g:else>
                    <h2 class="h3 mb-3"><g:message code="interest.title"/></h2>
                </g:else>
            </div>
            <div class="col-md-12 pt-6 pt-sm-3">
                <g:if test="${update}">
                    <p class="text-muted mb-4"><g:message code="interest.explanation.update"/></p>
                </g:if>
                <g:else>
                    <p class="text-muted mb-4"><g:message code="interest.explanation"/></p>
                </g:else>
            </div>
            <div class="col-md-12 pt-6 pt-sm-3">
                <div class="row no-gutters">
                <g:each var="category" in="${catList}" status="i">
                    <!-- Product-->
                    <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
                        <div class="product-card">
                            <div style="padding-top: 1rem;">
                                <h3 style="text-align: center;"><g:message code="interest.${category}"/></h3>
                            </div>
                            <div class="product-thumb"><asset:image src="Categories/cat_${category}.jpg" style="height: 18rem;"/></div>
                            <div id="select-${category}" class="product-card-body">
                                <button onclick="addCategoryInput('${category}')" class="btn btn-primary btn-sm btn-block select" type="button" data-toggle="toast" data-target="#cart-toast"><g:message code="interest.select"/></button>
                            </div>
                            <div id="unselect-${category}" class="product-card-body">
                                <button onclick="removeCategoryInput('${category}')" class="btn btn-outline-primary btn-sm btn-block select" type="button" data-toggle="toast" data-target="#cart-toast"><g:message code="interest.unselect"/></button>
                            </div>
                        </div>
                    </div>
                </g:each>
                </div>
                <br>
            </div>
            <form name="imageSubmit" action="/user/updateInterests">
                <input type="hidden" name="fromRegister" value="${fromRegister}">
                <div class="text-right">
                    <g:if test="${!update}">
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'interest.submit')}"/>
                    </g:if>
                    <g:else>
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'interest.update.submit')}"/>
                    </g:else>
                </div>
            </form>
        </section>
        <g:javascript>
            $(document).ready(function () {
                //Code used to hide the unselect buttons
                let catList = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                'Gaming','Google','Apple','Oracle','Microsoft','SAP','Graphic-Design']
                catList.forEach(it => {
                    $('#unselect-' + it).hide()
                })
                /*Code used to auto-select the categories the user have previously selected,
                  necesary to allow users to edit their interests
                 */
                let userInterests = []
                <g:each var="interest" in="${userInterests}">
                userInterests.push('${interest}')
                </g:each>
                userInterests.forEach(it => {
                    addCategoryInput(it)
                })
            });

            function addCategoryInput(id) {
                if (id != '' && !document.getElementById('input_' + id)) {
                    var categoryInput = document.createElement('input');
                    categoryInput.type = 'hidden';
                    categoryInput.id = 'input_' + id;
                    categoryInput.name = 'categories[]';
                    categoryInput.value = id;
                    document.imageSubmit.appendChild(categoryInput);
                    $('#select-' + id).hide()
                    $('#unselect-' + id).show()
                }
            }

            function removeCategoryInput(id) {
                if (id != '' && document.getElementById('input_' + id)) {
                    $('#input_' + id).remove()
                    $('#unselect-' + id).hide()
                    $('#select-' + id).show()
                }
            }
        </g:javascript>
    </div>
</div>

</body>
</html>