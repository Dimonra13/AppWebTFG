<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <asset:link rel="shortcut icon" href="favicon.ico"/>
    <title>
        <g:layoutTitle default="Coursing.me"/>
    </title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="MStore - Modern Bootstrap E-commerce Template">
    <meta name="keywords" content="bootstrap, shop, e-commerce, market, modern, responsive,  business, mobile, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="../assets/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon-16x16.png">
    <link rel="manifest" href="../assets/site.webmanifest">
    <link rel="mask-icon" color="#111" href="../assets/safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#111">
    <meta name="theme-color" content="#ffffff">
    <asset:stylesheet src="application"></asset:stylesheet>
    <asset:javascript src="application"></asset:javascript>
    <asset:javascript src="iconify.min.js"></asset:javascript>
    <asset:stylesheet src="myIconify.css"></asset:stylesheet>
    <!-- Vendor Styles including: Font Icons, Plugins, etc.-->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'vendor.min.css')}" type="text/css">
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'theme.min.css')}" type="text/css">
    <!-- Customizer styles and scripts-->
    <g:layoutHead/>
</head>
<!-- Body-->
<body>
<!-- Navbar Multilevel-->
<!-- Second line-->
<header class="navbar navbar-expand-lg navbar-light bg-light px-0">
    <div class="container flex-sm-nowrap px-3">
        <!-- navbar brand (Page icon) -->
        <a class="navbar-brand mr-0 mr-sm-4" style="width: 130px;" href="/"><asset:image style="width: 130px;"  width="100" src="utilities/coursing_azul.png" alt="MStore"/></a>
        <!-- navbar buttons-->
        <div class="navbar-btns d-flex position-relative order-sm-3">
            <div class="navbar-toggler navbar-btn collapsed bg-0 border-left-0 my-3" data-toggle="collapse" data-target="#menu">
                <i class="mx-auto mb-2" data-feather="menu"></i>Menu
            </div>
                <g:if test="${s.loggedUser()}">
                    <div class="border-left-0 my-3" style="width: 4.8rem;">
                        <a class="navbar-btn bg-0 my-3" href="/myProfile">
                            <span class="d-block position-relative">
                                <i class="mx-auto mb-1" data-feather="user"></i><g:message code="header.user.account"/>
                            </span>
                        </a>
                    </div>
                    <div class="border-left-0 my-3" style="width: 5.5rem;">
                        <a class="navbar-btn bg-0 my-3" href="/logout">
                            <i class="mx-auto mb-1" data-feather="log-out"></i><g:message code="logout.user.title"/>
                        </a>
                    </div>
                </g:if>
                <g:else>
                    <div class="border-left-0 my-3" style="width: 4.8rem;">
                        <a class="navbar-btn bg-0 my-3" href="/register">
                            <span class="d-block position-relative">
                                <i class="mx-auto mb-1" data-feather="user-plus"></i><g:message code="register.user.title"/>
                            </span>
                        </a>
                    </div>
                    <div class="border-left-0 my-3" style="width: 5.5rem;">
                        <a class="navbar-btn bg-0 my-3" href="/login">
                            <i class="mx-auto mb-1" data-feather="log-in"></i><g:message code="login.user.title"/>
                        </a>
                    </div>
                </g:else>

        </div>
        <!-- search-box-->
        <div class="flex-grow-1 pb-3 pt-sm-3 my-1 px-sm-2 pr-lg-4 order-sm-2">
            <form action="/search/semanticSearch" class="needs-validation" novalidate>
                <div class="input-group flex-nowrap">
                    <div class="input-group-prepend"><span class="input-group-text rounded-left" id="search-icon"><i
                            data-feather="search"></i></span></div>
                    <input class="form-control rounded-right" type="text" id="search-course" name="courseData"
                           placeholder="${message(code: 'course.search.semantic.bar')}" aria-label="Search site" aria-describedby="search-icon">
                </div>
            </form>
        </div>
    </div>
</header>
<!-- Third line: Navigation-->
<div class="navbar navbar-expand-lg navbar-light bg-light px-0">
    <div class="container px-3">
        <!-- navbar collapse area-->
        <div class="collapse navbar-collapse text-center" id="menu">
            <!-- Site menu-->
            <ul class="navbar-nav nav-pills">
                <li class="nav-item dropdown mega-dropdown dropdown-more"><a class="nav-link" href="/category/Architecture"><g:message code="header.category"/><i data-feather="more-horizontal"></i></a>
                    <div class="dropdown-menu">
                        <div class="dropdown-inner">
                            <div class="dropdown-column">
                                <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(${assetPath(src: 'megamenu/tec.jpg')});">
                                    <h3 class="h4 text-white text-shadow my-3" style="padding-bottom: 1.7rem;padding-top: 1.8rem;"><g:message code="category.title.science"/></h3>
                                </div>
                                <div class="widget widget-links">
                                    <ul>
                                        <li><a href="/category/Architecture"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-architecture" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.architecture"/></span></a></li>
                                        <li><a href="/category/IT-Certification"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="fluent:certificate-20-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.certification"/></span></a></li>
                                        <li><a href="/category/Cloud-Computing"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ant-design:cloud-server-outlined" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.cloud"/></span></a></li>
                                        <li><a href="/category/Data-Science"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="clarity:data-cluster-solid-alerted" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.data"/></span></a></li>
                                        <li><a href="/category/Engineering"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:round-engineering" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.engineering"/></span></a></li>
                                        <li><a href="/category/Gaming"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="maki:gaming-15" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.gaming"/></span></a></li>
                                        <li><a href="/category/Maths"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="fluent:math-formula-16-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.maths"/></span></a></li>
                                        <li><a href="/category/Machine-Learning"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="carbon:machine-learning-model" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.machine.learning"/></span></a></li>
                                        <li><a href="/category/Science"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-science" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.science"/></span></a></li>
                                        <li><a href="/category/Security"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-security" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.security"/></span></a></li>
                                        <li><a href="/category/Software-Engineering"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ant-design:code-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.software"/></span></a></li>
                                        <li><a href="/category/Test-Prep"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="fluent:document-48-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.test.prep"/></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dropdown-column">
                                <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(${assetPath(src: 'megamenu/Business.jpg')});">
                                    <h3 class="h4 text-white text-shadow my-3"><g:message code="category.title.humanities"/></h3>
                                </div>
                                <div class="widget widget-links">
                                    <ul>
                                        <li><a href="/category/Arts"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="emojione-monotone:performing-arts" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.arts"/></span></a></li>
                                        <li><a href="/category/Business-Finance"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="whh:business" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.business"/></span></a></li>
                                        <li><a href="/category/Education"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="cil:education" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.education"/></span></a></li>
                                        <li><a href="/category/Entrepreneurship"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-add-business" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.entrepreneurship"/></span></a></li>
                                        <li><a href="/category/Graphic-Design"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="clarity:design-solid" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.graphic.design"/></span></a></li>
                                        <li><a href="/category/Health"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:sharp-health-and-safety" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.health"/></span></a></li>
                                        <li><a href="/category/Human-Studies"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="octicon:law-16" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.humanities"/></span></a></li>
                                        <li><a href="/category/Leadership"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="whh:director" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.leadership"/></span></a></li>
                                        <li><a href="/category/Marketing"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="foundation:burst-sale" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.marketing"/></span></a></li>
                                        <li><a href="/category/Personal-Development"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="whh:plantalt" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.personal.development"/></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dropdown-column">
                                <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(${assetPath(src: 'megamenu/Brands.jpg')});">
                                    <h3 class="h4 text-white text-shadow my-3" style="padding-bottom: 1.7rem;padding-top: 1.8rem;"><g:message code="category.title.brands"/></h3>
                                </div>
                                <div class="widget widget-links">
                                    <ul>
                                        <!-- <li><a href="/category/Apple"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ant-design:apple-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.apple"/></span></a></li> -->
                                        <li><a href="/category/Google"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="akar-icons:google-fill" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.google"/></span></a></li>
                                        <li><a href="/category/Microsoft"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="bx:bxl-microsoft" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.microsoft"/></span></a></li>
                                        <li><a href="/category/Oracle"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="simple-icons:oracle" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.oracle"/></span></a></li>
                                        <li><a href="/category/SAP"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="cib:sap" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.sap"/></span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="/search/semantic" class="nav-link rounded"><g:message code="header.search.course.semantic"/></a>
                </li>
                <li class="nav-item">
                    <a href="/search/course" class="nav-link rounded"><g:message code="header.search.course.complete"/></a>
                </li>
                <li class="nav-item">
                    <a href="/search/user" class="nav-link rounded"><g:message code="header.search.user"/></a>
                </li>
            </ul>
            <!-- Rounded nav pills -->
        </div>
    </div>
</div>

<!------------------------------------------------------------------------------------------------ Page Content ------------------------------------------------------------------------------------------------>
<g:layoutBody/>
<!------------------------------------------------------------------------------------------------ Footer ------------------------------------------------------------------------------------------------>

<footer class="page-footer bg-dark">
    <!-- first row-->
    <div class="pt-5 pb-0 pb-md-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="widget widget-links pb-4">
                        <h3 class="widget-title text-white border-light"><g:message code="category.title.science"/></h3>
                        <ul>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Architecture"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-architecture" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.architecture"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/IT-Certification"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="fluent:certificate-20-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.certification"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Cloud-Computing"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ant-design:cloud-server-outlined" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.cloud"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Data-Science"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="clarity:data-cluster-solid-alerted" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.data"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Engineering"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:round-engineering" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.engineering"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Gaming"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="maki:gaming-15" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.gaming"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Maths"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="fluent:math-formula-16-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.maths"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Machine-Learning"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="carbon:machine-learning-model" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.machine.learning"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Science"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-science" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.science"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Security"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-security" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.security"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Software-Engineering"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ant-design:code-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.software"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Test-Prep"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="fluent:document-48-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.test.prep"/></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="widget widget-links pb-4">
                        <h3 class="widget-title text-white border-light"><g:message code="category.title.humanities"/></h3>
                        <ul>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Arts"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="emojione-monotone:performing-arts" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.arts"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Business-Finance"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="whh:business" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.business"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Education"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="cil:education" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.education"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Entrepreneurship"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:baseline-add-business" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.entrepreneurship"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Graphic-Design"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="clarity:design-solid" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.graphic.design"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Health"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ic:sharp-health-and-safety" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.health"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Human-Studies"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="octicon:law-16" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.humanities"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Leadership"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="whh:director" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.leadership"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Marketing"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="foundation:burst-sale" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.marketing"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Personal-Development"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="whh:plantalt" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.personal.development"/></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="widget widget-links pb-4">
                        <h3 class="widget-title text-white border-light"><g:message code="category.title.brands"/></h3>
                        <ul>
                            <!-- <li><a class="nav-link-inline nav-link-light" href="/category/Apple"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="ant-design:apple-filled" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.apple"/></span></a></li> -->
                            <li><a class="nav-link-inline nav-link-light" href="/category/Google"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="akar-icons:google-fill" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.google"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Microsoft"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="bx:bxl-microsoft" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.microsoft"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/Oracle"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="simple-icons:oracle" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.oracle"/></span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="/category/SAP"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="iconify" data-icon="cib:sap" data-inline="false"></span> <span class="font-size-sm"><g:message code="category.brand.sap"/></span></a></li>
                        </ul>
                    </div>
                    <div class="widget widget-links pb-4">
                        <h3 class="widget-title text-white border-light"><g:message code="footer.contact.us.title"/></h3>
                        <p class="text-white border-light"><g:message code="footer.contact.us.description"/></p>
                        <p class="text-white border-light"><i data-feather="mail"></i> <g:message code="footer.contact.us.email"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="scroll-to-top-btn-icon" data-feather="chevron-up"></i></a>
<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
<asset:javascript src="vendor.min.js"/>
<asset:javascript src="theme.min.js"/>
</body>
</html>