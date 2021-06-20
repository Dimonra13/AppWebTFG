<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.categoryIndex"/> ${currentCategory}</title>
</head>
<!-- Body-->
<body>
<asset:javascript src="jquery.star-rating-svg.js"/>
<asset:stylesheet src="star-rating-svg.css"/>
<br>
<div class="container pb-5 mb-4">
    <div class="row">
        <div class="col-lg-3">
            <!-- Shop sidebar-->
            <div class="offcanvas-sidebar">
                <div class="offcanvas-sidebar-toggle"><span class="toggle-knob"><i data-feather="chevrons-right"></i>Sidebar</span></div>
                <div class="offcanvas-sidebar-body">
                    <div class="offcanvas-sidebar-body-inner">
                        <!-- Categories-->
                        <div class="widget widget-categories mb-4 py-1">
                            <h3 class="widget-title"><g:message code="categoryIndex.category.list"/></h3>
                            <ul id="shopCategories">
                                <li class="has-children"><a href="#science" data-toggle="collapse"><i class="widget-categories-indicator" data-feather="chevron-down"></i><g:message code="category.title.science"/></a>
                                    <ul class="collapse" id="science" data-parent="#shopCategories">
                                        <li><a href="/category/Architecture"><span class="iconify" data-icon="ic:baseline-architecture" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.architecture"/></span></a></li>
                                        <li><a href="/category/IT-Certification"><span class="iconify" data-icon="fluent:certificate-20-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.certification"/></span></a></li>
                                        <li><a href="/category/Cloud-Computing"><span class="iconify" data-icon="ant-design:cloud-server-outlined" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.cloud"/></span></a></li>
                                        <li><a href="/category/Data-Science"><span class="iconify" data-icon="clarity:data-cluster-solid-alerted" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.data"/></span></a></li>
                                        <li><a href="/category/Engineering"><span class="iconify" data-icon="ic:round-engineering" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.engineering"/></span></a></li>
                                        <li><a href="/category/Gaming"><span class="iconify" data-icon="maki:gaming-15" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.gaming"/></span></a></li>
                                        <li><a href="/category/Maths"><span class="iconify" data-icon="fluent:math-formula-16-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.maths"/></span></a></li>
                                        <li><a href="/category/Machine-Learning"><span class="iconify" data-icon="carbon:machine-learning-model" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.machine.learning"/></span></a></li>
                                        <li><a href="/category/Science"><span class="iconify" data-icon="ic:baseline-science" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.science"/></span></a></li>
                                        <li><a href="/category/Security"><span class="iconify" data-icon="ic:baseline-security" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.security"/></span></a></li>
                                        <li><a href="/category/Software-Engineering"><span class="iconify" data-icon="ant-design:code-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.software"/></span></a></li>
                                        <li><a href="/category/Test-Prep"><span class="iconify" data-icon="fluent:document-48-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.test.prep"/></span></a></li>
                                    </ul>
                                </li>
                                <li class="has-children"><a href="#humanities" data-toggle="collapse"><i class="widget-categories-indicator" data-feather="chevron-down"></i><g:message code="category.title.humanities"/></a>
                                    <ul class="collapse" id="humanities" data-parent="#shopCategories">
                                        <li><a href="/category/Arts"><span class="iconify" data-icon="emojione-monotone:performing-arts" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.arts"/></span></a></li>
                                        <li><a href="/category/Business-Finance"><span class="iconify" data-icon="whh:business" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.business"/></span></a></li>
                                        <li><a href="/category/Education"><span class="iconify" data-icon="cil:education" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.education"/></span></a></li>
                                        <li><a href="/category/Entrepreneurship"><span class="iconify" data-icon="ic:baseline-add-business" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.entrepreneurship"/></span></a></li>
                                        <li><a href="/category/Graphic-Design"><span class="iconify" data-icon="clarity:design-solid" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.graphic.design"/></span></a></li>
                                        <li><a href="/category/Health"><span class="iconify" data-icon="ic:sharp-health-and-safety" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.health"/></span></a></li>
                                        <li><a href="/category/Human-Studies"><span class="iconify" data-icon="octicon:law-16" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.humanities"/></span></a></li>
                                        <li><a href="/category/Leadership"><span class="iconify" data-icon="whh:director" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.leadership"/></span></a></li>
                                        <li><a href="/category/Marketing"><span class="iconify" data-icon="foundation:burst-sale" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.marketing"/></span></a></li>
                                        <li><a href="/category/Personal-Development"><span class="iconify" data-icon="whh:plantalt" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.personal.development"/></span></a></li>
                                    </ul>
                                </li>
                                <li class="has-children"><a href="#brands" data-toggle="collapse"><i class="widget-categories-indicator" data-feather="chevron-down"></i><g:message code="category.title.brands"/></a>
                                    <ul class="collapse" id="brands" data-parent="#shopCategories">
                                        <li><a href="/category/Apple"><span class="iconify" data-icon="ant-design:apple-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.apple"/></span></a></li>
                                        <li><a href="/category/Google"><span class="iconify" data-icon="akar-icons:google-fill" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.google"/></span></a></li>
                                        <li><a href="/category/Microsoft"><span class="iconify" data-icon="bx:bxl-microsoft" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.microsoft"/></span></a></li>
                                        <li><a href="/category/Oracle"><span class="iconify" data-icon="simple-icons:oracle" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.oracle"/></span></a></li>
                                        <li><a href="/category/SAP"><span class="iconify" data-icon="cib:sap" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.sap"/></span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <!-- Category info -->
            <div>
                <h2><g:message code="categoryIndex.${currentCategory}"/></h2>
                <br>
            </div>
            <!-- Toolbar-->
            <div class="d-flex flex-wrap justify-content-center justify-content-sm-between pb-3">
                <form action="/category/${currentCategory}">
                    <div class="d-flex flex-wrap">
                        <input type="hidden" name="customSearch" value="true">
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
                            <label class="text-nowrap mr-2 d-none d-sm-block" for="sorting"><g:message code="categoryIndex.sortBy"></g:message></label>
                            <select class="form-control custom-select" name="sortBy" id="sorting">
                                <option><g:message code="categoryIndex.sortBy.rating"></g:message></option>
                                <option><g:message code="categoryIndex.sortBy.A-Z"></g:message></option>
                                <option><g:message code="categoryIndex.sortBy.Z-A"></g:message></option>
                            </select>
                        </div>
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
                            <label class="mr-2 d-none d-sm-block" for="number"><g:message code="categoryIndex.pageSize"></g:message></label>
                            <select class="form-control custom-select mr-sm-2" name="pageSize" id="number">
                                <option>12</option>
                                <option>24</option>
                                <option>48</option>
                            </select>
                        </div>
                        <div class="form-inline flex-nowrap pb-3">
                            <label class="mr-2" for="pager"><g:message code="categoryIndex.page"></g:message></label>
                            <input class="form-control mr-2" type="number" id="pager" name="page" value="1" min="1" pattern="^[0-9]+" style="width: 5.5rem;">
                        </div>
                        <div style="margin-top: -0.1rem;">
                            <div class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox" id="freeOnly" name="freeOnly">
                                <label class="custom-control-label" for="freeOnly"><g:message code="categoryIndex.freeOnly"></g:message></label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox" id="englishOnly" name="englishOnly">
                                <label class="custom-control-label" for="englishOnly"><g:message code="categoryIndex.englishOnly"></g:message></label>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex flex-wrap">
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
                            <label class="text-nowrap mr-2 d-none d-sm-block" for="difficulty"><g:message code="categoryIndex.difficulty"></g:message></label>
                            <select class="form-control custom-select" name="difficulty" id="difficulty">
                                <option><g:message code="categoryIndex.difficulty.all"></g:message></option>
                                <option><g:message code="categoryIndex.difficulty.beginner"></g:message></option>
                                <option><g:message code="categoryIndex.difficulty.intermediate"></g:message></option>
                                <option><g:message code="categoryIndex.difficulty.advanced"></g:message></option>
                            </select>
                        </div>
                        <!-- search-box-->
                        <div class="flex-grow-1 flex-nowrap mr-3 mr-sm-4 pb-3">
                            <div class="input-group flex-nowrap">
                                <div class="input-group-prepend"><span class="input-group-text rounded-left" id="search-icon"><i
                                        data-feather="search"></i></span></div>
                                <input class="form-control rounded-right" type="text" id="search-course" name="title"
                                       placeholder="${message(code: 'course.search.bar')}" aria-label="Search site" aria-describedby="search-icon">
                            </div>
                        </div>
                    </div>
                    <div class="text-right mb-3">
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'categoryIndex.search')}"/>
                    </div>
                </form>
            </div>
            <br>
            <!-- Course grid -->
            <g:if test="${!courses}">
                <!-- Info alert -->
                <div class="alert alert-info" role="alert">
                    <div class="alert-icon-box">
                        <i class="alert-icon" data-feather="info"></i>
                    </div>
                    " -- <g:message code="categoryIndex.search.noCourseFound"/>
                </div>
            </g:if><g:else>
                <div class="row no-gutters">
                     <g:each var="course" in="${courses}" status="i">
                         <!-- Course info -->
                         <div class="col-xl-4 col-sm-6 col-6 border border-collapse">
                             <div class="product-card">
                                 <div class="product-card-body">
                                     <div class="product-card-title">
                                        <h5  style="text-color: black;"><a href="/course/${course.id}">${course.title}</a></h5>
                                        <g:if test="${course?.rating}">
                                             <span class="my-rating" id="my-rating${i}"></span><span class="font-weight-semibold ml-1"> (${course.rating})</span>
                                        </g:if>
                                     </div>
                                     <ul class="list-unstyled border p-3 mb-4">
                                         <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.difficulty"/>:</span>
                                             <g:if test="${course?.difficulty}">
                                                 <span class="font-weight-semibold ml-1"><g:message code="categoryIndex.difficulty.${course.difficulty}"/></span>
                                             </g:if>
                                             <g:else>
                                                 <span class="font-weight-semibold ml-1"><g:message code="course.profile.noDifficulty"/></span>
                                             </g:else>
                                         </li>
                                         <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.language"/>:</span>
                                             <g:if test="${course?.language}">
                                                 <span class="font-weight-semibold ml-1">${course.language}</span>
                                             </g:if>
                                             <g:else>
                                                 <span class="font-weight-semibold ml-1"><g:message code="course.profile.noLanguage"/></span>
                                             </g:else>
                                         </li>
                                         <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.price"/>:</span>
                                             <g:if test="${course.isFree==2}">
                                                 <span class="font-weight-semibold ml-1"><g:message code="course.profile.price.coursera"/></span>
                                             </g:if><g:elseif test="${course.isFree==3}">
                                             <span class="font-weight-semibold ml-1"><g:message code="course.profile.price.udacity"/></span>
                                         </g:elseif><g:elseif test="${course.isFree==1}">
                                             <span class="font-weight-semibold ml-1"><g:message code="course.profile.price.free"/></span>
                                         </g:elseif><g:elseif test="${course.isFree==0 && course?.price}">
                                             <span class="font-weight-semibold ml-1">${course.price}€</span>
                                         </g:elseif><g:else>
                                             <span class="font-weight-semibold ml-1"><g:message code="course.profile.noPrice"/></span>
                                         </g:else>
                                         </li>
                                     </ul>
                                 </div>
                                 <div class="product-card-body body-hidden pt-2">
                                     <a href="/course/${course.id}"><button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast"><g:message code="course.search.link"></g:message></button></a>
                                 </div>
                             </div>
                         </div>
                         <g:javascript>
                            $("#my-rating${i}").starRating({
                                initialRating: ${course?.rating?:0},
                                strokeColor: '#894A00',
                                activeColor: '#894A00',
                                readOnly: true,
                                strokeWidth: 5,
                                starSize: 25
                            });
                         </g:javascript>
                     </g:each>
                </div>
                <div class="pb-4 mb-2"></div>
                <!-- Pagination-->
                <br>
                <div class="row">
                    <div class="col-3"></div>
                    <g:if test="${offset}">
                        <div class="col-2">
                            <div class="text-right">
                                <form action="/category/${currentCategory}">
                                    <input type="hidden" name="customSearch" value="true">
                                    <input type="hidden" name="offset" value="${offset-pageSize}">
                                    <input type="hidden" name="pageSize" value="${pageSize}">
                                    <g:if test="${englishOnly}">
                                        <input type="hidden" name="englishOnly" value="on">
                                    </g:if>
                                    <g:if test="${freeOnly}">
                                        <input type="hidden" name="freeOnly" value="on">
                                    </g:if>
                                    <g:if test="${sortBy}">
                                        <input type="hidden" name="sortBy" value="${sortBy}">
                                    </g:if>
                                    <g:if test="${difficulty}">
                                        <input type="hidden" name="difficulty" value="${difficulty}">
                                    </g:if>
                                    <input type="submit" class="btn btn-primary" name="submit" value="<< ${message(code: "course.search.pagination.previous")}"/>
                                </form>
                            </div>
                        </div>
                    </g:if><g:else>
                        <div class="col-2"></div>
                    </g:else>
                    <div class="col-2">
                        <div class="text-center">
                            <h5 style="padding-top: 10px;">${offset ? (offset/pageSize)+1 : 1}</h5>
                        </div>
                    </div>
                    <g:if test="${isMore}">
                        <div class="col-2">
                            <div class="text-left">
                                <form action="/category/${currentCategory}">
                                    <input type="hidden" name="customSearch" value="true">
                                    <input type="hidden" name="offset" value="${offset+pageSize}">
                                    <input type="hidden" name="pageSize" value="${pageSize}">
                                    <g:if test="${title}">
                                        <input type="hidden" name="title" value="${title}">
                                    </g:if>
                                    <g:if test="${englishOnly}">
                                        <input type="hidden" name="englishOnly" value="on">
                                    </g:if>
                                    <g:if test="${freeOnly}">
                                        <input type="hidden" name="freeOnly" value="on">
                                    </g:if>
                                    <g:if test="${sortBy}">
                                        <input type="hidden" name="sortBy" value="${sortBy}">
                                    </g:if>
                                    <g:if test="${difficulty}">
                                        <input type="hidden" name="difficulty" value="${difficulty}">
                                    </g:if>
                                    <input type="submit" class="btn btn-primary" name="submit" value="${message(code: "course.search.pagination.next")} >>"/>
                                </form>
                            </div>
                        </div>
                    </g:if>
                </div>
            </g:else>
        </div>
    </div>
</div>
<g:javascript>
    $(document).ready(function () {
        let catGroup = "#${categoryGroup}"
        $( catGroup ).addClass( "show" );
    });
</g:javascript>
</body>
</html>