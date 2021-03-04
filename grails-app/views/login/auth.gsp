<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>TITLE | Modern Bootstrap E-commerce Template
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
</head>
<!-- Body-->
<body>
<!-- Off-canvas account-->
<div class="offcanvas offcanvas-reverse" id="offcanvas-account">
    <div class="offcanvas-header d-flex justify-content-between align-items-center">
        <h3 class="offcanvas-title">Sign in / Create account</h3>
        <button class="close" type="button" data-dismiss="offcanvas" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="offcanvas-body">
        <div class="offcanvas-body-inner">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li class="nav-item"><a class="nav-link active" href="#signin" data-toggle="tab" role="tab"><i data-feather="log-in"></i>&nbsp;Sign In</a></li>
                <li class="nav-item"><a class="nav-link" href="#signup" data-toggle="tab" role="tab"><i data-feather="user"></i>&nbsp;Sign Up</a></li>
            </ul>
            <div class="tab-content pt-1">
                <div class="tab-pane fade show active" id="signin" role="tabpanel">
                    <form class="needs-validation" novalidate>
                        <div class="form-group">
                            <label class="sr-only" for="signin-email">Email</label>
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text" id="signin-email-icon"><i data-feather="mail"></i></span></div>
                                <input class="form-control" type="email" id="signin-email" placeholder="Email" aria-label="Email" aria-describedby="signin-email-icon" required>
                                <div class="invalid-feedback">Please provide email address.</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="signin-password">Password</label>
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text" id="signin-password-icon"><i data-feather="lock"></i></span></div>
                                <input class="form-control" type="password" id="signin-password" placeholder="Password" aria-label="Password" aria-describedby="signin-password-icon" required>
                                <div class="invalid-feedback">Please enter a password.</div>
                            </div>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                            <input class="custom-control-input" type="checkbox" id="remember-me" checked>
                            <label class="custom-control-label" for="remember-me">Remember me</label>
                        </div>
                        <button class="btn btn-primary btn-block" type="submit">Sign In</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="signup" role="tabpanel">
                    <form class="needs-validation" novalidate>
                        <div class="form-group">
                            <label class="sr-only" for="signup-name">Full name</label>
                            <input class="form-control" type="text" id="signup-name" placeholder="Full name" aria-label="Full name" required>
                            <div class="invalid-feedback">Please enter your full name.</div>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="signup-email">Email address</label>
                            <input class="form-control" type="email" id="signup-email" placeholder="Email address" aria-label="Email address" required>
                            <div class="invalid-feedback">Please provide a valid email address.</div>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="signup-password">Password</label>
                            <input class="form-control" type="password" id="signup-password" placeholder="Password" aria-label="Password" required>
                            <div class="invalid-feedback">Please enter a password.</div>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="signup-password-confirm">Confirm password</label>
                            <input class="form-control" type="password" id="signup-password-confirm" placeholder="Confirm password" aria-label="Confirm password" required>
                            <div class="invalid-feedback">Please confirm password.</div>
                        </div>
                        <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
                    </form>
                </div>
            </div>
            <div class="d-flex align-items-center pt-5">
                <hr class="w-100">
                <div class="px-3 w-100 text-nowrap font-weight-semibold">Or sign in via</div>
                <hr class="w-100">
            </div>
            <div class="text-center pt-4"><a class="social-btn sb-facebook mx-2 mb-3" href="#" data-toggle="tooltip" title="Facebook"><i class="flaticon-facebook"></i></a><a class="social-btn sb-google-plus mx-2 mb-3" href="#" data-toggle="tooltip" title="Google"><i class="flaticon-google-plus"></i></a><a class="social-btn sb-twitter mx-2 mb-3" href="#" data-toggle="tooltip" title="Twitter"><i class="flaticon-twitter"></i></a></div>
        </div>
    </div>
</div>
<!-- Off-canvas cart-->
<div class="offcanvas offcanvas-reverse" id="offcanvas-cart">
    <div class="offcanvas-header d-flex justify-content-between align-items-center">
        <h3 class="offcanvas-title">Your cart</h3>
        <button class="close" type="button" data-dismiss="offcanvas" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="offcanvas-body">
        <div class="offcanvas-body-inner">
            <div class="text-right"><a class="text-danger btn-sm pr-0" href="#"><i class="mr-1" data-feather="x" style="width: .85rem; height: .85rem;"></i>Clear cart</a></div>
            <div class="widget widget-featured-entries pt-3">
                <div class="media">
                    <div class="featured-entry-thumb mr-3"><a href="#"><asset:image src="Hardware/Mobo/MSI%20B360%20Gaming%20Plus.jpg" width="64" alt="MSI B360 Gaming Plus"/></a><span class="item-remove-btn"><i data-feather="x"></i></span></div>
                    <div class="media-body">
                        <h6 class="featured-entry-title"><a href="#">MSI B360 Gaming Plus</a></h6>
                        <p class="featured-entry-meta">1 <span class='text-muted'>x</span> $125.00</p>
                    </div>
                </div>
                <div class="media">
                    <div class="featured-entry-thumb mr-3"><a href="#"><asset:image src="Hardware/Headphones/KYGO%20A4%20300%20Headphones.jpg" width="64" alt="KYGO A4 300 Headphones"/></a><span class="item-remove-btn"><i data-feather="x"></i></span></div>
                    <div class="media-body">
                        <h6 class="featured-entry-title"><a href="#">KYGO A4 300 Headphones</a></h6>
                        <p class="featured-entry-meta">1 <span class='text-muted'>x</span> $29.99</p>
                    </div>
                </div>
                <div class="media">
                    <div class="featured-entry-thumb mr-3"><a href="#"><asset:image src="Hardware/Mice/Jieyuteks%20Free%20Wolf%20V5%20USB%20Gaming%20Mouse%20400DPI%206%20buttons%20ergonomic%20design%20for%20desktop%20computer.jpg" width="64" alt="Jieyuteks Free Wolf V5 USB Gaming Mouse 400DPI 6 buttons ergonomic design for desktop computer"/></a><span class="item-remove-btn"><i data-feather="x"></i></span></div>
                    <div class="media-body">
                        <h6 class="featured-entry-title"><a href="#">Free Wolf V5 USB Gaming Mouse 400DPI</a></h6>
                        <p class="featured-entry-meta">1 <span class='text-muted'>x</span> $47.00</p>
                    </div>
                </div>
                <div class="media">
                    <div class="featured-entry-thumb mr-3"><a href="#"><asset:image src="Hardware/Storage/Seagate%20160GB%20SATA%20Hard%20Disk%20Drive.jpg" width="64" alt="Seagate 160GB SATA Hard Disk Drive"/></a><span class="item-remove-btn"><i data-feather="x"></i></span></div>
                    <div class="media-body">
                        <h6 class="featured-entry-title"><a href="#">Seagate 160GB SATA Hard Disk Drive</a></h6>
                        <p class="featured-entry-meta">1 <span class='text-muted'>x</span> $19.00</p>
                    </div>
                </div>
                <hr>
                <div class="d-flex justify-content-between align-items-center py-3">
                    <div class="font-size-sm"> <span class="mr-2">Subtotal:</span><span class="font-weight-semibold text-dark">$219.99</span></div><a class="btn btn-outline-secondary btn-sm" href="../assets/cart.html">Expand cart<i class="mr-n2" data-feather="chevron-right"></i></a>
                </div><a class="btn btn-primary btn-sm btn-block" href="../assets/checkout-details.html"><i class="mr-1" data-feather="credit-card"></i>Checkout</a>
            </div>
        </div>
    </div>
</div>
<!-- Navbar Multilevel-->

<!-- Second line-->
<header class="navbar navbar-expand-lg navbar-light bg-light px-0">
    <div class="container flex-sm-nowrap px-3">
        <!-- navbar brand--><a class="navbar-brand mr-0 mr-sm-4" style="min-width: 100px;" href="index.html"><asset:image width="100" src="logo-dark.png" alt="MStore"/></a>
        <!-- navbar buttons-->
        <div class="navbar-btns d-flex position-relative order-sm-3">
            <div class="navbar-toggler navbar-btn collapsed bg-0 border-left-0 my-3" data-toggle="collapse" data-target="#menu"><i class="mx-auto mb-2" data-feather="menu"></i>Menu</div><span class="d-block position-relative"><a class="navbar-btn bg-0 my-3" href="#offcanvas-account" data-toggle="offcanvas"><i class="mx-auto mb-1" data-feather="log-in"></i>Sign In/Up</a><a class="navbar-btn bg-0 my-3" href="#offcanvas-cart" data-toggle="offcanvas"><span class="d-block position-relative"><span class="navbar-btn-badge bg-primary text-light">4</span><i class="mx-auto mb-1" data-feather="shopping-cart"></i>$325.00</span></a>
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

<div class="container pb-5 mb-sm-4">
    <div class="row pt-5">
        <div class="col-md-3"></div>
        <div class="col-md-6 pt-6 pt-sm-3">
            <div class="card">
                <div class="card-body">
                    <h2 class="h4 mb-1"><g:message code="login.user.title"></g:message></h2>
                    <h3 class="h6 font-weight-semibold opacity-70 pt-4 pb-2"><g:message code="login.user.publi"></g:message></h3>
                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="needs-validation"  autocomplete="off" novalidate>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="user"></i></span></div>
                            <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="${message(code: 'login.user.username')}" required autocapitalize="none"/>
                            <div class="invalid-feedback"><g:message code="login.user.username.error"></g:message></div>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend"><span class="input-group-text"><i data-feather="lock"></i></span></div>
                            <input class="form-control" type="password" placeholder="${message(code: 'login.user.password')}" name="${passwordParameter ?: 'password'}" id="password" required/>
                            <span class="input-group-text"><i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i></span>
                            <div class="invalid-feedback"><g:message code="login.user.password.error"></g:message></div>
                        </div>
                        <g:if test='${flash.message}'>
                            <p style="color: red"><g:message code="login.user.error"></g:message><br><a class="font-weight-semibold" href="/register"><g:message code="login.user.register"/></a></p>
                        </g:if>
                        <hr class="mt-4">
                        <div class="text-right pt-4">
                            <button class="btn btn-primary" type="submit">Sign In</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['username'].focus();
    });

    function passwordDisplayToggle() {
        var toggleEl = document.getElementById("passwordToggler");
        var eyeIcon = '\u{1F441}';
        var xIcon = '\u{2715}';
        var passEl = document.getElementById("password");

        if (passEl.type === "password") {
            toggleEl.innerHTML = xIcon;
            passEl.type = "text";
        } else {
            toggleEl.innerHTML = eyeIcon;
            passEl.type = "password";
        }
    }
</script>
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