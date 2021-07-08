<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.search.course"/></title>
</head>
<!-- Body-->
<body>
<asset:javascript src="jquery.star-rating-svg.js"/>
<asset:stylesheet src="star-rating-svg.css"/>
<asset:javascript src="jquery.dropdown.js"/>
<asset:stylesheet src="jquery.dropdown.css"/>
<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-1"></div>

        <div class="col-md-10 pt-6 pt-sm-3">
            <h2 class="h4 mb-3"><g:message code="course.search.title"/></h2>

            <p class="text-muted mb-4"><g:message code="course.search.description"/></p>

            <div>
                <form action="/search/searchCourse" method="post">
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
                                <label class="text-nowrap mr-2" for="categoryList"><g:message code="search.course.category"></g:message></label>
                                <g:select class="form-control custom-select" id="categoryList" name="category" valueMessagePrefix="categoryIndex" from="${categories}" value="${category}"/>
                            </div>
                            <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
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
                            <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3 multi" style="min-width: 12rem;max-width: 20rem">
                                <label class="text-nowrap mr-2" for="languageList"><g:message code="categoryIndex.languages"></g:message></label>
                                <g:select style="display:none;" id="languageList" name="languageList" valueMessagePrefix="language" from="${languages}" multiple="multiple" value="${languageList}"/>
                            </div>
                        </div>
                        <div class="text-right mb-3">
                            <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'categoryIndex.search')}"/>
                        </div>
                </form>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
    <div class="col-md-10 pt-6 pt-sm-3">
        <g:if test="${!courses && customSearch}">
            <!-- Info alert -->
            <div class="alert alert-info" role="alert">
                <div class="alert-icon-box">
                    <i class="alert-icon" data-feather="info"></i>
                </div>
                " -- <g:message code="course.search.noCourseFound"/>
            </div>
        </g:if><g:elseif test="${courses}">
        <g:if test="${title}">
            <h2 style="display: inline-block;word-break: break-word;"><g:message code="search.results.for"></g:message> "${title}"</h2>
            <br><br>
        </g:if>
        <g:each var="course" in="${courses}" status="i">
            <g:if test="${course}">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <a  href="/course/${course.id}/?search=true" class="col-lg-4 col-md-12 col-sm-12" style="display: flex;justify-content: center;">
                            <asset:image src="Categories/cat_${course.category}.jpg"/>
                        </a>
                        <div class="col-lg-8 col-md-12 col-sm-12">
                            <!-- Course details -->
                            <div class="d-flex flex-wrap justify-content-between pb-4">
                                <div class="pt-3 mr-3" style="display: inline-block;word-break: break-word;">
                                    <a href="/course/${course.id}/?search=true" style="color: black;"><h3 class="mb-0">${course.title}</h3></a><a class="font-size-lg text-warning" href="/category/${course.category}"><span><g:message code="categoryIndex.${course.category}"/></span></a>
                                </div>
                            </div>
                            <ul class="list-unstyled border p-3 mb-4">
                                <li class="pb-1"><span class="opacity-80">&ndash; <g:message code="course.profile.avgscore"/>:</span>
                                    <g:if test="${course?.rating}">
                                        <span class="my-rating" id="my-rating${i}"></span><span class="font-weight-semibold ml-1">(${course.rating})</span>
                                    </g:if>
                                    <g:else>
                                        <span class="font-weight-semibold ml-1"><g:message code="course.profile.noAvgscore"/></span>
                                    </g:else>
                                </li>
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
                            <div class="text-right">
                                <div class="pt-3"><a class="btn btn-outline-primary btn-sm" href="/course/${course.id}/?search=true"><i class="mr-1" data-feather="chevrons-right"></i><g:message code="course.search.link"></g:message></a></div>
                            </div>
                            <asset:image class="text-left" src="ogpageicons/${course.originalPage}.png" style="width: 5rem;height:5rem;position:relative; z-index:1;margin-top: -3rem;margin-left: 0.5rem;"/>
                        </div>
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
        <!-- Pagination-->
        <br>
        <div class="row">
            <div class="btn-group" style="margin: auto" role="group" aria-label="Solid button group">
                <g:if test="${offset}">
                    <form action="/search/searchCourse" method="post">
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
                        <g:if test="${ogpage}">
                            <input type="hidden" name="ogpage" value="${ogpage}">
                        </g:if>
                        <g:if test="${max}">
                            <input type="hidden" name="max" value="${max}">
                        </g:if>
                        <g:if test="${min}">
                            <input type="hidden" name="min" value="${min}">
                        </g:if>
                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languages}" multiple="multiple" value="${languageList}"/>
                        <g:select style="display:none;" name="category" valueMessagePrefix="categoryIndex" from="${categories}" value="${category}"/>
                        <input type="submit" class="btn btn-primary" name="submit" value="<< ${message(code: "course.search.pagination.previous")}"/>
                    </form>
                </g:if><g:else>
                <div class="col-2"></div>
            </g:else>
                <div class="text-center" style="padding-left: 3rem; padding-right: 3rem;">
                    <h5 style="padding-top: 10px;">${offset ? (offset/pageSize)+1 : 1}</h5>
                </div>
                <g:if test="${isMore}">
                    <form action="/search/searchCourse" method="post">
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
                        <g:select style="display:none;" name="languageList" valueMessagePrefix="language" from="${languages}" multiple="multiple" value="${languageList}"/>
                        <g:select style="display:none;" name="category" valueMessagePrefix="categoryIndex" from="${categories}" value="${category}"/>
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: "course.search.pagination.next")} >>"/>
                    </form>
                </g:if>
            </div>
        </div>
    </g:elseif>
    </div>
</div>
</div>
<g:javascript>
    $('.multi').dropdown({
        searchable:false,
        multipleMode:'label'
    });
</g:javascript>
</body>
</html>