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
                                      'Gaming','Google','Apple','Oracle','Microsoft','SAP','Graphic-Design']}"/>
    <div class="row">
        <!-- Featured products grid-->
        <section class="container px-3 pt-4 mt-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <h1><g:message code="interest.title"/></h1>
            </div>
            <hr class="mt-4">
            <div class="row no-gutters">
                <g:each var="category" in="${catList}" status="i">
                    <!-- Product-->
                    <div class="col-lg-3 col-sm-3 col-6 border border-collapse">
                        <div class="product-card">
                            <div class="product-thumb"><asset:image src="Hardware/Headphones/JBL%20Tune%20500BT%20Powerful%20Bass%20Wireless%20On-Ear%20Headphones%20,%20Blue,%20Rs.2507.jpg" alt="JBL Tune 500BT Powerful Bass Wireless On-Ear Headphones , Blue, Rs.2507"/></div>
                            <div id="select-${category}" class="product-card-body">
                                <button onclick="addCategoryInput('${category}')" class="btn btn-primary btn-sm btn-block select" type="button" data-toggle="toast" data-target="#cart-toast">SELECT</button>
                            </div>
                            <div id="unselect-${category}" class="product-card-body">
                                <button onclick="removeCategoryInput('${category}')" class="btn btn-outline-primary btn-sm btn-block select" type="button" data-toggle="toast" data-target="#cart-toast">UNSELECT</button>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
            <br>
            <form name="imageSubmit" action="/user/updateInterests">
                <div class="text-right">
                    <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'update.user.submit')}"></input>
                </div>
            </form>
        </section>
        <g:javascript>
            $(document).ready(function () {
                //let cat = '${catList[0]}';
                let catList = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                    'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                    'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                    'Gaming','Google','Apple','Oracle','Microsoft','SAP','Graphic-Design']
                catList.forEach(it => {
                    $('#unselect-' + it).hide()
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