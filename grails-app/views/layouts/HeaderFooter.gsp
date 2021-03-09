<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
        <a class="navbar-brand mr-0 mr-sm-4" style="min-width: 100px;" href="/"><asset:image width="100" src="logo-dark.png" alt="MStore"/></a>
        <!-- navbar buttons-->
        <div class="navbar-btns d-flex position-relative order-sm-3">
            <div class="navbar-toggler navbar-btn collapsed bg-0 border-left-0 my-3" data-toggle="collapse" data-target="#menu">
                <i class="mx-auto mb-2" data-feather="menu"></i>Menu
            </div>
            <span class="d-block position-relative">
                <g:if test="${s.loggedUser()}">
                    <a class="navbar-btn bg-0 my-3" href="/logout">
                        <i class="mx-auto mb-1" data-feather="log-out"></i><g:message code="logout.user.title"/>
                    </a>
                </g:if>
                <g:else>
                    <a class="navbar-btn bg-0 my-3" href="/login">
                        <i class="mx-auto mb-1" data-feather="log-in"></i><g:message code="login.user.title"/>
                    </a>
                    <a class="navbar-btn bg-0 my-3" href="/register">
                        <span class="d-block position-relative">
                            <i class="mx-auto mb-1" data-feather="user-plus"></i><g:message code="register.user.title"/>
                        </span>
                    </a>
                </g:else>
            </span>
        </div>
        <!-- search-box-->
        <div class="flex-grow-1 pb-3 pt-sm-3 my-1 px-sm-2 pr-lg-4 order-sm-2">
            <div class="input-group flex-nowrap">
                <div class="input-group-prepend"><span class="input-group-text rounded-left" id="search-icon"><i data-feather="search"></i></span></div>
                <input class="form-control rounded-right" type="text" id="site-search" placeholder="Search site" aria-label="Search site" aria-describedby="search-icon">
            </div>
        </div>
    </div>
</header>
<!-- Third line: Navigation-->
<div class="navbar navbar-expand-lg navbar-light bg-light px-0">
    <div class="container px-3">
        <!-- navbar collapse area-->
        <div class="collapse navbar-collapse" id="menu">
            <!-- Site menu-->
            <ul class="navbar-nav">
                <li class="nav-item dropdown mega-dropdown dropdown-more"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Categories<i data-feather="more-horizontal"></i></a>
                    <div class="dropdown-menu">
                        <div class="dropdown-inner">
                            <div class="dropdown-column">
                                <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(../assets/images/megamenu/computerHardware.jpg);">
                                    <h3 class="h5 text-white text-shadow my-3">Computer Hardware</h3>
                                </div>
                                <div class="widget widget-links">
                                    <ul>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Motherboards</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Storage Devices</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">CPU / Processors</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Video Cards &amp; Video Devices</span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dropdown-column">
                                <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(../assets/images/megamenu/comp-accessories.png);">
                                    <h3 class="h5 text-white text-shadow my-3">Computer Accessories</h3>
                                </div>
                                <div class="widget widget-links">
                                    <ul>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Speakers </span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Headphones </span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Computer Mice</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Monitors</span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="dropdown-column">
                                <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(../assets/images/megamenu/printer.png);">
                                    <h3 class="h5 text-white text-shadow my-3">Printers</h3>
                                </div>
                                <div class="widget widget-links">
                                    <ul>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Ink Printer</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Laser Printer</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">3D Printer</span></a></li>
                                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Printer Supplies</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a href="index.html" class="nav-link rounded">Home</a>
                </li>
                <li class="nav-item">
                    <a href="../assets/shop-style2-ls.html" class="nav-link rounded">Shop</a>
                </li>
                <li class="nav-item">
                    <a href="../assets/user-second-hand-product.html" class="nav-link rounded">Sell product</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">User Account</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="../assets/account-orders.html">Orders History</a></li>
                        <li class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="../assets/account-profile.html">Profile Settings</a></li>
                        <li class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="../assets/account-address.html">Account Addresses</a></li>
                        <li class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="../assets/account-payment.html">Payment Methods</a></li>
                    </ul>
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
                        <h3 class="widget-title text-white border-light">Shop departments</h3>
                        <ul>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Motherboards</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Storage Devices</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">CPU / Processors</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Video Cards &amp; Video Devices</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Speakers</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Monitors</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Computer Mice</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Headphones</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Ink Printer</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Laser Printer</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">3D Printers</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Printer Supplies</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="widget widget-links pb-4">
                        <h3 class="widget-title text-white border-light">Our brands</h3>
                        <ul>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Intel</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">AMD</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">NVIDIA</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">ASUS</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Corsair</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Seagate</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Gigabyte</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Logitech</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Pioneer</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">WD</span></a></li>
                            <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">HP</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-4 offset-xl-1 col-md-5">
                    <div class="widget">
                        <!-- Subscription form (MailChimp)-->
                        <h3 class="widget-title text-white border-light">Stay informed</h3>
                        <form class="validate pb-4" action="https://studio.us12.list-manage.com/subscribe/post-json?u=c7103e2c981361a6639545bd5&amp;amp;id=29ca296126&amp;c=?" method="get" name="mc-embedded-subscribe-form" id="mc-embedded-subscribe-form">
                            <div class="input-group mb-2">
                                <div class="input-group-prepend"><span class="input-group-text" style="background-color: #e8e8e8;"><i data-feather="mail"></i></span></div>
                                <input class="form-control border-0 box-shadow-0 bg-secondary" type="email" name="EMAIL" id="mce-EMAIL" value="" placeholder="Your email" required>
                            </div>
                            <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                            <div style="position: absolute; left: -5000px;" aria-hidden="true">
                                <input type="text" name="b_c7103e2c981361a6639545bd5_29ca296126" tabindex="-1">
                            </div>
                            <button class="btn btn-primary btn-block" type="submit" name="subscribe" id="mc-embedded-subscribe">Subscribe*</button>
                            <p class="font-size-xs text-white opacity-60 pt-2 mb-2" id="mc-helper">*Subscribe to our newsletter to receive early discount offers, updates and new products info.</p>
                            <!-- Subscription status-->
                            <div class="subscribe-status"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="py-3" style="background-color: #1a1a1a;">
        <div class="container font-size-xs text-center" aria-label="Copyright"><span class="text-white opacity-60 mr-1">© All rights reserved. Made by</span><a class="nav-link-inline nav-link-light" href="https://createx.studio/" target="_blank">Createx Studio</a></div>
    </div>
</footer>
<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="scroll-to-top-btn-icon" data-feather="chevron-up"></i></a>
<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
<asset:javascript src="vendor.min.js"/>
<asset:javascript src="theme.min.js"/>
</body>
</html>