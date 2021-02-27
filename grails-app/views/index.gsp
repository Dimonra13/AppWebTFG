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
    <!-- Page Content-->
    <!-- Hero slider + Promo list-->
    <section class="container px-3">
      <div class="mt-4 pt-lg-2 mb-4 mb-md-5">
        <div class="row">
          <!-- Categories-->
          <div class="col-lg-4 d-none d-lg-block">
            <div class="border px-4 py-4">
              <ul class="list-unstyled mb-0">
                <li class="border-bottom"><a class="d-flex align-items-center nav-link-inline pb-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/CPU/AMD Ryzen 5 3600X 6 Core Socket AM4 3.8GHz CPU Processor + Wraith Spire Cooler.jpg&quot; class=&quot;d-block mt-n2&quot; alt=&quot;Computers &amp; Accessories&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold mt-n2 pb-3&quot;&gt;Starting from $99.80&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="hard-drive" style="width: 1.25rem; height: 1.25rem;"></i><span>CPU/Processors<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
                <li class="border-bottom"><a class="d-flex align-items-center nav-link-inline py-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/Monitors/Samsung C27F390FHU - Monitor para PC Desktop (Full HD, 68,6 cm , 1920 x 1080 Pixeles, LCD, 4 ms.jpg&quot; class=&quot;d-block mt-n2&quot; alt=&quot;TV, Video &amp; Audio&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold pb-3&quot;&gt;Starting from $78.00&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="monitor" style="width: 1.25rem; height: 1.25rem;"></i><span>Monitors<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
                <li class="border-bottom"><a class="d-flex align-items-center nav-link-inline py-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/GPU/Gigabyte GV-RX580GAMING-8GD - Tarjeta Gráfica, RX 580 Gaming, 8 phases poder,  8GB, Negro.jpg&quot; class=&quot;d-block mt-n2&quot; alt=&quot;Video Cameras&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold mt-n1 pb-3&quot;&gt;Starting from $75.00&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="video" style="width: 1.25rem; height: 1.25rem;"></i><span>Video Cards &amp; Video Devices<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
                <li class="border-bottom"><a class="d-flex align-items-center nav-link-inline py-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/Headphones/Logitech G935, Headphones, Bluetooth, Medium, Multicolor.jpg&quot; class=&quot;d-block mt-n2&quot; alt=&quot;Headphones&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold pt-2 pb-3&quot;&gt;Starting from $25.99&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="headphones" style="width: 1.25rem; height: 1.25rem;"></i><span>Headphones<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
                <li class="border-bottom"><a class="d-flex align-items-center nav-link-inline py-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/Ink printer/HP - OfficeJet 3830 Wireless All-In-One Instant Ink Ready Printer - Black.jpg&quot; class=&quot;d-block mt-n2&quot; alt=&quot;Printers &amp; Ink&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold pt-2 pb-3&quot;&gt;Starting from $124.00&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="printer" style="width: 1.25rem; height: 1.25rem;"></i><span>Printers &amp; Ink<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
                <li class="border-bottom"><a class="d-flex align-items-center nav-link-inline py-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/Speakers/PIONEER DJ DM-40-W.jpg&quot; class=&quot;d-block&quot; alt=&quot;Speakers &amp; Home Music&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold pt-2 pb-3&quot;&gt;Starting from $63.00&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="speaker" style="width: 1.25rem; height: 1.25rem;"></i><span>Speakers &amp; Home Music<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
                <li><a class="d-flex align-items-center nav-link-inline pt-3" href="#" data-toggle="popover" data-placement="right" data-trigger="hover" data-html="true" data-content="&lt;img src=&quot;Hardware/Storage/WD Black 2TB Performance Desktop Hard Disk Drive - 7200 RPM.jpg&quot; class=&quot;d-block mt-n2&quot; alt=&quot;HDD / SSD Data Storage&quot;&gt;&lt;div class=&quot;text-center font-size-sm font-weight-semibold pt-2 pb-3&quot;&gt;Starting from $15.60&lt;/div&gt;"><i class="text-primary opacity-60 mr-2 mt-1" data-feather="server" style="width: 1.25rem; height: 1.25rem;"></i><span>HDD / SSD Data Storage<i class="ml-1" data-feather="chevron-right" style="width: 1rem; height: 1rem;"></i></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-8">
            <!-- Hero slider-->
            <div class="bg-secondary bg-size-cover mb-grid-gutter" style="background-image: url(../assets/images/home/electronics/hero-main-bg.jpg);">
              <div class="owl-carousel trigger-carousel" data-owl-carousel="{ &quot;nav&quot;: true, &quot;dots&quot;: false, &quot;loop&quot;: true, &quot;autoHeight&quot;: true, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 5500 }">
                <div class="row align-items-center py-5">
                  <div class="col-md-5">
                    <div class="pl-3 pr-3 pl-md-5 pr-md-0 pt-4 pt-lg-5 pb-5 text-center text-md-left">
                      <h3 class="mb-1">Intel Core i5 9400F</h3>
                      <h4 class="font-weight-light opacity-70 pb-3">starting at $140.50</h4><a class="btn btn-primary" href="../assets/shop-style2-ls.html">Shop now<i class="ml-2" data-feather="arrow-right"></i></a>
                    </div>
                  </div>
                  <div class="col-md-7"><asset:image class="d-block mx-auto" src="Hardware/CPU/Intel%20Core%20i5-9400F%202.9GHz.jpg" alt="Intel Core i5-9400F 2.9GHz"/></div>
                </div>
                <div class="row align-items-center py-5">
                  <div class="col-md-5">
                    <div class="pl-3 pr-3 pl-md-5 pr-md-0 pt-4 pt-lg-5 pb-5 text-center text-md-left">
                      <h3 class="mb-1">3D Printer Prusa Original MK3S</h3>
                      <h4 class="font-weight-light opacity-70 pb-3">for only $363.99</h4><a class="btn btn-primary" href="../assets/shop-style2-ls.html">Shop now<i class="ml-2" data-feather="arrow-right"></i></a>
                    </div>
                  </div>
                  <div class="col-md-7"><asset:image class="d-block mx-auto" src="Hardware/3D%20printer/3D%20printer%20Original%20Prusa%20i3%20MK3S.jpg" alt="3D printer Original Prusa i3 MK3S"/></div>
                </div>
                <div class="row align-items-center py-5">
                  <div class="col-md-5">
                    <div class="pl-3 pr-3 pl-md-5 pr-md-0 pt-4 pt-lg-5 pb-5 text-center text-md-left">
                      <h3 class="mb-1">Boat 510 Wireless Headphones</h3>
                      <h4 class="font-weight-light opacity-70 pb-3">starting at $120.50</h4><a class="btn btn-primary" href="../assets/shop-style2-ls.html">Shop now<i class="ml-2" data-feather="arrow-right"></i></a>
                    </div>
                  </div>
                  <div class="col-md-7"><asset:image class="d-block mx-auto" src="Hardware/Headphones/Logitech%20G935,%20Headphones,%20Bluetooth,%20Medium,%20Multicolor.jpg" alt="Logitech G935, Headphones, Bluetooth, Medium, Multicolor"/></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <hr class="mt-4">
    </section>
    <!-- Featured products grid-->
    <section class="container px-3 pt-4 mt-3">
      <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
        <h2 class="h3 mb-3">Featured products</h2><a class="btn btn-outline-primary btn-sm border-0 mb-3" href="../assets/shop-style2-ls.html">More products<i class="ml-1 mr-n2" data-feather="chevron-right"></i></a>
      </div>
      <div class="row no-gutters">
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Headphones/JBL%20Tune%20500BT%20Powerful%20Bass%20Wireless%20On-Ear%20Headphones%20,%20Blue,%20Rs.2507.jpg" alt="JBL Tune 500BT Powerful Bass Wireless On-Ear Headphones , Blue, Rs.2507"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Headphones</a>
              </div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">JBL Tune 500BT Powerful Bass Wireless On-Ear Headphones , Blue, Rs.2507</a></h3><span class="text-primary">$25.00</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Mobo/ASUS%20EX-A320M%20AMD%20AM4%20Socket%20Gaming%20Motherboard.jpg" alt="ASUS EX-A320M AMD AM4 Socket Gaming Motherboard"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Motherboards</a>
              </div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">ASUS EX-A320M AMD AM4 Socket Gaming Motherboard</a></h3><span class="text-primary">$129.00</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Mice/%5BNew%20Version%5D%20Zelotes%20Gaming%20Mouse,Wired%20Mouse,%20Computer%20Mouse,7200%20DPI%207%20Buttons%20LED%20Optical%20USB.jpg" alt="[New Version] Zelotes Gaming Mouse,Wired Mouse, Computer Mouse,7200 DPI 7 Buttons LED Optical USB"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Computer Mice</a></div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">Zelotes Gaming Mouse,Wired Mouse, Computer Mouse,7200 DPI 7 Buttons LED Optical USB</a></h3><span class="text-primary">$21.95</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Speakers/Creative%20T30%20Wireless.jpg" alt="Creative T30 Wireless"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Speakers</a>
              </div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">Creative T30 Wireless Speakers Black</a></h3><span class="text-primary">
                <del class="text-muted mr-1">$49.99</del>$29.99</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Laser%20printer/HP%20Color%20LaserJet%20Pro%20M281fdw%20All-in-One%20Laser%20Printer.jpg" alt="HP Color LaserJet Pro M281fdw All-in-One Laser Printer"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Laser Printer</a>
              </div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">HP Color LaserJet Pro M281fdw All-in-One Laser Printer</a></h3><span class="text-primary">$517.40</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Storage/500GB%20SATA%20Disco%20Duro%20Disco%20Duro%20Interno%20Pc%20Computadora%20De%20Escritorio%20CCTV%20DVR.jpg" alt="500GB SATA Disco Duro Disco Duro Interno Pc Computadora De Escritorio CCTV DVR"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Storage</a>
              </div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">500GB SATA Disco Duro Disco Duro Interno Pc Computadora De Escritorio CCTV DVR</a></h3><span class="text-primary">$29.99</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Printer%20supplies/SUNLU%203D%20Filament%201.75,%20Shiny%20Silk%20PLA%20Filament%201.75mm,%201KG%20PLA%20Filament%200.02mm%20for%203D%20Printer%203D%20Pens,%20Brass.jpg" alt="SUNLU 3D Filament 1.75, Shiny Silk PLA Filament 1.75mm, 1KG PLA Filament 0.02mm for 3D Printer 3D Pens, Brass"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Printer Supplies</a>
              </div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">SUNLU 3D Filament 1.75, Shiny Silk PLA Filament 1.75mm, 1KG PLA Filament 0.02mm for 3D Printer 3D Pens, Brass</a></h3><span class="text-primary">$24.99</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
        <!-- Product-->
        <div class="col-lg-3 col-sm-4 col-6 border border-collapse">
          <div class="product-card">
            <div class="product-thumb"><a class="product-thumb-link" href="../assets/shop-single-electronics.html"></a><asset:image src="Hardware/Monitors/Dell%20SE2417HG%20Black%2023.6”%20Gaming%20LCD%20Monitor,%202ms%20Fast%20Response%20Time,%20Dual%20HDMI%20ports.jpg" alt="Dell SE2417HG Black 23.6” Gaming LCD Monitor, 2ms Fast Response Time, Dual HDMI ports"/></div>
            <div class="product-card-body">
              <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Monitors</a></div>
              <h3 class="product-card-title"><a href="../assets/shop-single-electronics.html">Dell SE2417HG Black 23.6” Gaming LCD Monitor, 2ms Fast Response Time, Dual HDMI ports</a></h3><span class="text-primary">$339.00</span>
            </div>
            <div class="product-card-body body-hidden pt-2">
              <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
            </div>
          </div>
        </div>
    </section>
    <!-- Promo banner-->
    <section class="container py-4 my-3 px-3">
      <div class="bg-faded-info position-relative py-4">
        <div class="row align-items-center">
          <div class="col-md-5"><span class="badge badge-danger ml-5">Limited offer</span>
            <div class="pt-4 pl-4 pl-sm-5">
              <h3 class="font-family-body font-weight-light mb-2">All new</h3>
              <h2 class="mb-2 pb-1">EVGA GeForce RTX 2080 XC - 8 GB DDR6</h2>
              <h5 class="font-family-body font-weight-light mb-3">at discounted price. Hurry up!</h5>
              <div class="countdown h4 mb-4" data-date-time="10/10/2020 12:00" data-labels="{&quot;label-day&quot;: &quot;d&quot;, &quot;label-hour&quot;: &quot;h&quot;, &quot;label-minute&quot;: &quot;m&quot;, &quot;label-second&quot;: &quot;s&quot;}"></div><a class="btn btn-primary" href="../assets/shop-style2-ls.html">View offers<i class="ml-2" data-feather="arrow-right"></i></a>
            </div>
          </div>
          <div class="col-md-7"><asset:image class="mx-auto" src="Hardware/GPU/EVGA%20-%20GeForce%20RTX%202080%20XC%20-%208%20GB%20DDR6.jpg" alt="EVGA - GeForce RTX 2080 XC - 8 GB DDR6"/></div>
        </div>
      </div>
    </section>
    <!-- Brands carousel-->
    <section class="container px-3 pb-4">
      <div class="owl-carousel border-right" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: false, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 3500, &quot;loop&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;360&quot;:{&quot;items&quot;:2},&quot;600&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }"><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Asus.png" style="width: 165px;" alt="Asus"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/HP.jpg" style="width: 165px;" alt="HP"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Seagate.png" style="width: 165px;" alt="Seagate"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Corsair.jpg" style="width: 165px;" alt="Corsair"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/AMD.jpg" style="width: 165px;" alt="AMD"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/NVIDIA.jpg" style="width: 165px;" alt="NVIDIA"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Western%20Digital.jpg" style="width: 165px;" alt="Western Digital"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Intel.jpg" style="width: 165px;" alt="Intel"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Pioneer.jpg" style="width: 165px;" alt="Pioneer"/></a><a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right: -.0625rem;"><asset:image class="d-block mx-auto" src="Brands/Gigabyte.jpg" style="width: 165px;" alt="Gigabyte"/></a></div>
    </section>
    <!-- Product widgets-->
    <section class="container px-3 pt-2 pb-4 mb-md-2">
      <div class="row">
        <div class="col-md-4 col-sm-6 mb-2 py-3">
          <div class="widget widget-featured-entries">
            <h3 class="widget-title font-size-lg">Best sellers</h3>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Headphones/BackBeat%20FIT%20500.png" width="64" alt="BackBeat FIT 500"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">BackBeat FIT 500</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">$29.99</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Mice/Free Wolf Wired Gaming Mouse Professional FPS Mouse with 4000DPI Gaming Mice with Programmable Buttons.jpeg" width="64" alt="Free Wolf Wired Gaming Mouse Professional FPS Mouse with 4000DPI Gaming Mice with Programmable Buttons"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Free Wolf Wired Gaming Mouse Professional</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star" data-feather="star"></i><i class="sr-star" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">$59.99</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/CPU/Intel%20Core%20i7-8700K%20-%20Procesador%20(%208ª%20generación%20de%20procesadores%20Intel%20Core%20i7,%203.7%20GHz,%2012MB%20Smart%20Cache,%20PC,%2014%20nm,%208%20GT%20s).jpg" width="64" alt="Intel Core i7-8700K - Procesador ( 8ª generación de procesadores Intel Core i7, 3.7 GHz, 12MB Smart Cache, PC, 14 nm, 8 GT s)"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Intel Core i7-8700K</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">$399.00</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Monitors/HP%2027es%20-%20Monitor%20para%20PC%20Desktop%20de%201920%20x%201080%20pixeles,%20LED,%20IPS,%20HDMI,%207ms,%20250%20cd,%2080KHz.jpg" width="64" alt="HP 27es - Monitor para PC Desktop de 1920 x 1080 pixeles, LED, IPS, HDMI, 7ms, 250 cd, 80KHz"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">HP 27es - Monitor para PC</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">
                  <del class="text-muted mr-1">145.43</del>$109.99
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-2 py-3">
          <div class="widget widget-featured-entries">
            <h3 class="widget-title font-size-lg">New arrivals</h3>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Monitors/Samsung%20S32R750%2032%20inch%20Space%20Saver%204K%20UHD%20VA%20LCD%20PC%20Monitor%20HDMI%20mDP%20(A).jpg" width="64" alt="Samsung S32R750 32 inch Space Saver 4K UHD VA LCD PC Monitor HDMI mDP (A)"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Samsung 4K UHD VA LCD PC Monitor</a></h6>
                <p class="featured-entry-meta">$1,049.00</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Laser%20printer/Brother%20Wireless%20Mono%20Laser%20MFC-L2713DW.jpg" width="64" alt="Brother Wireless Mono Laser MFC-L2713DW"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Brother Wireless Mono Laser MFC-L2713DW</a></h6>
                <p class="featured-entry-meta">$428.60</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Printer%20supplies/Compatible%20Pack%204%20x%20Toner%20HP%20CC530A%20%20CC531A%20CC532A%20CC533A%20-%20304A.png" width="64" alt="Official Creality Ender 3 3D Printer Fully Open Source with Resume Printing All Metal Frame FDM DIY Printers 220x220x250mm"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Official Creality Ender 3 3D Printer</a></h6>
                <p class="featured-entry-meta">
                  <del class="text-muted mr-1">849.47</del>$799.97
                </p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Printer%20supplies/Compatible%20Pack%204%20x%20Toner%20HP%20CC530A%20%20CC531A%20CC532A%20CC533A%20-%20304A.png" width="64" alt="Compatible Pack 4 x Toner HP CC530A  CC531A CC532A CC533A - 304A"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Compatible Pack 4 x Toner HP Ink</a></h6>
                <p class="featured-entry-meta">$19.00</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-2 py-3">
          <div class="widget widget-featured-entries">
            <h3 class="widget-title font-size-lg">Top rated</h3>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/GPU/Gigabyte%20GeForce%20GTX%201050Ti%20OC%204GB%20GDDR5.jpg" width="64" alt="Gigabyte GeForce GTX 1050Ti OC 4GB GDDR5"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Gigabyte GeForce GTX 1050Ti OC 4GB GDDR5</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">
                  <del class="text-muted mr-1">149.99</del>$119.99
                </p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Speakers/pioneer-m-40-monitores-activos-para-dj.jpg" width="64" alt="pioneer-m-40-monitores-activos-para-dj"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">Pioneer m 40 Speakers</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">$48.75</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/Storage/WD%20Black%202TB%20Performance%20Desktop%20Hard%20Disk%20Drive%20-%207200%20RPM.jpg" width="64" alt="WD Black 2TB Performance Desktop Hard Disk Drive - 7200 RPM"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">WD Black 2TB Hard Disk Drive</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">$79.95</p>
              </div>
            </div>
            <div class="media"><a class="featured-entry-thumb" href="#"><asset:image src="Hardware/GPU/asus-dual-gtx-1060-oc-6gb-gddr5_2_1.jpg" width="64" alt="asus-dual-gtx-1060-oc-6gb-gddr5_2_1"/></a>
              <div class="media-body">
                <h6 class="featured-entry-title"><a href="#">ASUS GTX 1060 6GB</a></h6>
                <div class="star-rating"><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i><i class="sr-star active" data-feather="star"></i>
                </div>
                <p class="featured-entry-meta">
                  <del class="text-muted mr-1">191.00</del>$170.00
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Footer-->
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