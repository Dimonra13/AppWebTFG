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
<asset:javascript src="jquery.dropdown.js"/>
<asset:stylesheet src="jquery.dropdown.css"/>
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
                                        <!-- <li><a href="/category/Apple"><span class="iconify" data-icon="ant-design:apple-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.apple"/></span></a></li> -->
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
            <div>
                <form action="/category/${currentCategory}" method="post">
                    <div class="d-flex flex-wrap justify-content-center justify-content-sm-between" style="margin: auto;">
                        <!-- search-box-->
                        <div class="flex-grow-1 flex-nowrap mr-3 mr-sm-4 pb-3" >
                            <div class="input-group flex-nowrap">
                                <div class="input-group-prepend">
                                    <button type="submit" class="btn searchbutton input-group-text rounded-left" id="search-icon">
                                        <i data-feather="search"></i>
                                    </button>
                                </div>
                                <g:if test="${title && title!=""}">
                                    <input class="form-control rounded-right" type="text" id="search-course" name="title" value="${title}"
                                           placeholder="${message(code: 'course.search.bar')}" aria-label="Search site" aria-describedby="search-icon">
                                </g:if><g:else>
                                <input class="form-control rounded-right" type="text" id="search-course" name="title"
                                       placeholder="${message(code: 'course.search.bar')}" aria-label="Search site" aria-describedby="search-icon">
                            </g:else>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex flex-wrap justify-content-center justify-content-sm-between" style="margin: auto;">
                        <input type="hidden" name="customSearch" value="true">
                        <input type="hidden" name="pageSize" value="12">
                        <input type="hidden" name="page" value="1">
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3" style="padding-left: 1rem;">
                            <label class="text-nowrap mr-2" for="difficulty"><g:message code="categoryIndex.difficulty"></g:message></label>
                            <select class="form-control custom-select" name="difficulty" id="difficulty">
                                <g:if test="${difficulty == g.message(code: "categoryIndex.difficulty.all")}">
                                    <option><g:message code="categoryIndex.difficulty.all"></g:message></option>
                                </g:if><g:elseif test="${difficulty == g.message(code: "categoryIndex.difficulty.beginner")}">
                                    <option><g:message code="categoryIndex.difficulty.beginner"></g:message></option>
                                </g:elseif><g:elseif test="${difficulty == g.message(code: "categoryIndex.difficulty.intermediate")}">
                                    <option><g:message code="categoryIndex.difficulty.intermediate"></g:message></option>
                                </g:elseif><g:elseif test="${difficulty == g.message(code: "categoryIndex.difficulty.advanced")}">
                                    <option><g:message code="categoryIndex.difficulty.advanced"></g:message></option>
                                </g:elseif>
                                <g:if test="${difficulty != g.message(code: "categoryIndex.difficulty.all")}">
                                    <option><g:message code="categoryIndex.difficulty.all"></g:message></option>
                                </g:if>
                                <g:if test="${difficulty != g.message(code: "categoryIndex.difficulty.beginner")}">
                                    <option><g:message code="categoryIndex.difficulty.beginner"></g:message></option>
                                </g:if>
                                <g:if test="${difficulty != g.message(code: "categoryIndex.difficulty.intermediate")}">
                                    <option><g:message code="categoryIndex.difficulty.intermediate"></g:message></option>
                                </g:if>
                                <g:if test="${difficulty != g.message(code: "categoryIndex.difficulty.advanced")}">
                                    <option><g:message code="categoryIndex.difficulty.advanced"></g:message></option>
                                </g:if>
                            </select>
                        </div>
                        <!-- Price range widget -->
                        <div class="widget form-inline flex-nowrap mr-3 mr-sm-4 pb-3" style="padding-left: 1rem; padding-top: 2rem;">
                            <g:if test="${min && max}">
                                <div class="range-slider" data-start-min="${min}" data-start-max="${max}" data-min="0" data-max="400" data-step="1">
                            </g:if><g:else>
                                <div class="range-slider" data-start-min="0" data-start-max="400" data-min="0" data-max="400" data-step="1">
                            </g:else>
                                <div class="ui-range-slider"></div>
                                <footer class="ui-range-slider-footer">
                                    <div class="form-check-inline" style="margin-left: 1.2rem;">
                                        <div class="ui-range-label"><g:message code="categoryIndex.price.range"></g:message></div>
                                        <div class="ui-range-value-min">
                                            &nbsp;<span></span>€
                                            <input type="hidden" name="min">
                                        </div>
                                        &nbsp;&ndash;&nbsp;
                                        <div class="ui-range-value-max">
                                            <span></span>€
                                            <input type="hidden" name="max">
                                        </div>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3" style="padding-left: 1rem;">
                            <label class="text-nowrap mr-2" for="ogpage"><g:message code="course.search.ogpage"></g:message></label>
                            <select class="form-control custom-select" name="ogpage" id="ogpage">
                                <g:if test="${ogpage == g.message(code: "course.search.ogpage.all")}">
                                    <option><g:message code="course.search.ogpage.all"></g:message></option>
                                </g:if><g:elseif test="${ogpage == g.message(code: "course.search.ogpage.coursera")}">
                                    <option><g:message code="course.search.ogpage.coursera"></g:message></option>
                                </g:elseif><g:elseif test="${ogpage == g.message(code: "course.search.ogpage.udemy")}">
                                    <option><g:message code="course.search.ogpage.udemy"></g:message></option>
                                </g:elseif><g:elseif test="${ogpage == g.message(code: "course.search.ogpage.udacity")}">
                                    <option><g:message code="course.search.ogpage.udacity"></g:message></option>
                                </g:elseif>
                                <g:if test="${ogpage != g.message(code: "course.search.ogpage.all")}">
                                    <option><g:message code="course.search.ogpage.all"></g:message></option>
                                </g:if>
                                <g:if test="${ogpage != g.message(code: "course.search.ogpage.coursera")}">
                                    <option><g:message code="course.search.ogpage.coursera"></g:message></option>
                                </g:if>
                                <g:if test="${ogpage != g.message(code: "course.search.ogpage.udemy")}">
                                    <option><g:message code="course.search.ogpage.udemy"></g:message></option>
                                </g:if>
                                <g:if test="${ogpage != g.message(code: "course.search.ogpage.udacity")}">
                                    <option><g:message code="course.search.ogpage.udacity"></g:message></option>
                                </g:if>
                            </select>
                        </div>
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
                            <label class="text-nowrap mr-2" for="sorting"><g:message code="categoryIndex.sortBy"></g:message></label>
                            <select class="form-control custom-select" name="sortBy" id="sorting">
                                <g:if test="${sortBy == g.message(code: "categoryIndex.sortBy.A-Z")}">
                                    <option><g:message code="categoryIndex.sortBy.A-Z"></g:message></option>
                                </g:if><g:elseif test="${sortBy == g.message(code: "categoryIndex.sortBy.Z-A")}">
                                <option><g:message code="categoryIndex.sortBy.Z-A"></g:message></option>
                            </g:elseif><g:elseif test="${sortBy == g.message(code: "categoryIndex.sortBy.price.asc")}">
                                <option><g:message code="categoryIndex.sortBy.price.asc"></g:message></option>
                            </g:elseif><g:elseif test="${sortBy == g.message(code: "categoryIndex.sortBy.price.desc")}">
                                <option><g:message code="categoryIndex.sortBy.price.desc"></g:message></option>
                            </g:elseif><g:elseif test="${sortBy == g.message(code: "categoryIndex.sortBy.rating")}">
                                <option><g:message code="categoryIndex.sortBy.rating"></g:message></option>
                            </g:elseif>
                                <g:if test="${sortBy != g.message(code: "categoryIndex.sortBy.rating")}">
                                    <option><g:message code="categoryIndex.sortBy.rating"></g:message></option>
                                </g:if>
                                <g:if test="${sortBy != g.message(code: "categoryIndex.sortBy.A-Z")}">
                                    <option><g:message code="categoryIndex.sortBy.A-Z"></g:message></option>
                                </g:if>
                                <g:if test="${sortBy != g.message(code: "categoryIndex.sortBy.Z-A")}">
                                    <option><g:message code="categoryIndex.sortBy.Z-A"></g:message></option>
                                </g:if>
                                <g:if test="${sortBy != g.message(code: "categoryIndex.sortBy.price.asc")}">
                                    <option><g:message code="categoryIndex.sortBy.price.asc"></g:message></option>
                                </g:if>
                                <g:if test="${sortBy != g.message(code: "categoryIndex.sortBy.price.desc")}">
                                    <option><g:message code="categoryIndex.sortBy.price.desc"></g:message></option>
                                </g:if>
                            </select>
                        </div>
                        <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3 multi" style="min-width: 16.5rem;max-width: 30rem">
                            <label class="text-nowrap mr-2" for="languageList"><g:message code="categoryIndex.languages"></g:message></label>
                            <g:select style="display:none;" id="languageList" name="languageList" valueMessagePrefix="language" from="${languages}" multiple="multiple" value="${languageList}"/>
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
                <div class="alert alert-info alert-with-icon" role="alert">
                    <div class="alert-icon-box">
                        <i class="alert-icon" data-feather="info"></i>
                    </div>
                    <g:message code="categoryIndex.search.noCourseFound"/>
                </div>
            </g:if><g:else>
                <g:if test="${title}">
                    <h2 style="display: inline-block;word-break: break-word;"><g:message code="search.results.for"></g:message> "${title}"</h2>
                    <br><br>
                </g:if>
                <div class="row no-gutters">
                     <g:each var="course" in="${courses}" status="i">
                         <g:if test="${course}">
                         <!-- Course info -->
                         <div class="col-xl-4 col-sm-6 col-6 border border-collapse">
                             <div class="product-card">
                                 <div class="product-card-body">
                                     <div class="product-card-title">
                                        <h5  style="text-color: black;word-break: break-word;"><a href="/course/${course.id}/?search=true">${course.title}</a></h5>
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
                                         <li class="pb-1"><span class="opacity-80">- <g:message code="course.profile.ogpage"/>:</span>
                                             <g:if test="${course?.originalPage}">
                                                 <span class="font-weight-semibold ml-1">${course.originalPage}</span>
                                             </g:if>
                                             <g:else>
                                                 <span class="font-weight-semibold ml-1"><g:message code="course.profile.noOgPage"/></span>
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
                                     <a href="/course/${course.id}/?search=true"><button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast"><g:message code="course.search.link"></g:message></button></a>
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
                         </g:if>
                     </g:each>
                </div>
                <div class="pb-4 mb-2"></div>
                <!-- Pagination-->
                <br>
                <div class="row">
                    <nav style="margin: auto" aria-label="Page navigation example">
                        <ul class="pagination">
                            <g:if test="${offset}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${offset-pageSize}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit"><i data-feather="chevron-left"></i></button>
                                    </form>
                                </li>
                            </g:if>
                            <!-- First page pointer -->
                            <g:if test="${page==1}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        1
                                    </span>
                                </li>
                            </g:if><g:else>
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="0">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">1</button>
                                    </form>
                                </li>
                            </g:else>
                            <!-- Second page pointer or ... -->
                            <g:if test="${(page==1 || page==3) && lastPage>2}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">2</button>
                                    </form>
                                </li>
                            </g:if><g:elseif test="${page==2 && lastPage>2}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        2
                                    </span>
                                </li>
                            </g:elseif><g:elseif test="${page>3 && lastPage>4}">
                                <li class="page-item" style="pointer-events: none;">
                                    <span class="page-link"> ... </span>
                                </li>
                            </g:elseif>

                            <g:if test="${page>3 && page==lastPage}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize*(page-3)}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">${page-2}</button>
                                    </form>
                                </li>
                            </g:if>
                            <!-- Third page pointer or previous page pointer -->
                            <g:if test="${(page==1 || page==2) && lastPage>3}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize*2}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">3</button>
                                    </form>
                                </li>
                            </g:if><g:elseif test="${page==3 && lastPage>3}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        3
                                    </span>
                                </li>
                            </g:elseif><g:elseif test="${lastPage>3}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize*(page-2)}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">${page-1}</button>
                                    </form>
                                </li>
                            </g:elseif>
                            <!-- Four page pointer or actual page pointer -->
                            <g:if test="${page==3 && lastPage>4}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize*3}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">4</button>
                                    </form>
                                </li>
                            </g:if><g:elseif test="${page>3 && lastPage>page}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        ${page}
                                    </span>
                                </li>
                            </g:elseif>
                            <!-- Next page pointer -->
                            <g:if test="${page>3 && lastPage>(page+1)}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize*page}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">${page+1}</button>
                                    </form>
                                </li>
                            </g:if>
                            <!-- Second ... -->
                            <g:if test="${lastPage>4 && lastPage>(page+2)}">
                                <li class="page-item" style="pointer-events: none;">
                                    <span class="page-link"> ... </span>
                                </li>
                            </g:if>
                            <!-- last page pointer -->
                            <g:if test="${page==lastPage && lastPage>1}">
                                <li class="page-item active">
                                    <span class="page-link">
                                        ${lastPage}
                                    </span>
                                </li>
                            </g:if><g:elseif test="${lastPage>1}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
                                        <input type="hidden" name="customSearch" value="true">
                                        <input type="hidden" name="offset" value="${pageSize*(lastPage-1)}">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit">${lastPage}</button>
                                    </form>
                                </li>
                            </g:elseif>
                            <g:if test="${isMore}">
                                <li class="page-item">
                                    <form action="/category/${currentCategory}" method="post">
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
                                        <g:if test="${ogpage}">
                                            <input type="hidden" name="ogpage" value="${ogpage}">
                                        </g:if>
                                        <g:if test="${max}">
                                            <input type="hidden" name="max" value="${max}">
                                        </g:if>
                                        <g:if test="${min}">
                                            <input type="hidden" name="min" value="${min}">
                                        </g:if>
                                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languageList}" multiple="multiple" value="${languageList}"/>
                                        <button type="submit" class="page-link" name="submit"><i data-feather="chevron-right"></i></button>
                                    </form>
                                </li>
                            </g:if>
                        </ul>
                    </nav>
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
<g:javascript>
    $('.multi').dropdown({
        searchable:false,
        multipleMode:'label'
    });
</g:javascript>
</body>
</html>