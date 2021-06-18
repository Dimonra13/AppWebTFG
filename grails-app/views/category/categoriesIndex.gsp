<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.categories"/></title>
</head>
<!-- Body-->
<body>
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
                            <h3 class="widget-title">Shop categories</h3>
                            <ul id="shopCategories">
                                <li class="has-children"><a href="#science" data-toggle="collapse"><i class="widget-categories-indicator" data-feather="chevron-down"></i><g:message code="category.title.science"/></a>
                                    <ul class="collapse" id="science" data-parent="#shopCategories">
                                        <li><a href="#">Motherboards</a></li>
                                        <li><a href="#">Storage Devices</a></li>
                                        <li><a href="#">CPU / Processors</a></li>
                                        <li><a href="#">Video Cards &amp; Video Devices</a></li>
                                    </ul>
                                </li>
                                <li class="has-children"><a href="#humanities" data-toggle="collapse"><i class="widget-categories-indicator" data-feather="chevron-down"></i><g:message code="category.title.humanities"/></a>
                                    <ul class="collapse" id="humanities" data-parent="#shopCategories">
                                        <li><a href="#">Speakers</a></li>
                                        <li><a href="#">Headphones</a></li>
                                        <li><a href="#">Computer Mice</a></li>
                                        <li><a href="#">Monitors</a></li>
                                    </ul>
                                </li>
                                <li class="has-children"><a href="#brands" data-toggle="collapse"><i class="widget-categories-indicator" data-feather="chevron-down"></i><g:message code="category.title.brands"/></a>
                                    <ul class="collapse" id="brands" data-parent="#shopCategories">
                                        <li><a href="#">Ink Printer</a></li>
                                        <li><a href="#">Laser Printer</a></li>
                                        <li><a href="#">3D Printer</a></li>
                                        <li><a href="#">Printer Supplies</a></li>
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
                <h2>Software</h2>
            </div>
            <!-- Toolbar-->
            <div class="d-flex flex-wrap justify-content-center justify-content-sm-between pb-3">
                <div class="d-flex flex-wrap">
                    <div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">
                        <label class="text-nowrap mr-2 d-none d-sm-block" for="sorting">Sort by:</label>
                        <select class="form-control custom-select" id="sorting">
                            <option>Popularity</option>
                            <option>Low - Hight Price</option>
                            <option>High - Low Price</option>
                            <option>Average Rating</option>
                            <option>A - Z Order</option>
                            <option>Z - A Order</option>
                        </select>
                    </div>
                    <div class="form-inline flex-nowrap pb-3">
                        <label class="mr-2 d-none d-sm-block" for="number">Show:</label>
                        <select class="form-control custom-select mr-sm-2" id="number">
                            <option>12</option>
                            <option>24</option>
                            <option>48</option>
                            <option>96</option>
                        </select>
                    </div>
                </div>
                <div class="form-inline d-none d-md-flex flex-nowrap pb-3">
                    <label class="mr-2" for="pager">Page:</label>
                    <input class="form-control mr-2" type="number" id="pager" value="2" style="width: 4rem;">
                </div>
            </div>
            <!-- Products grid-->
            <div class="row no-gutters">
                <!-- Product-->
                <div class="col-xl-3 col-sm-4 col-6 border border-collapse">
                    <div class="product-card">
                        <div class="product-thumb"><a class="product-thumb-link" href="shop-single-electronics.html"></a><img src="img/Hardware/Headphones/JBL Tune 500BT Powerful Bass Wireless On-Ear Headphones , Blue, Rs.2507.jpg" alt="JBL Tune 500BT Powerful Bass Wireless On-Ear Headphones , Blue, Rs.2507"></div>
                        <div class="product-card-body">
                            <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Headphones</a>
                            </div>
                            <h3 class="product-card-title"><a href="shop-single-electronics.html">JBL Tune 500BT Powerful Bass Wireless On-Ear Headphones , Blue, Rs.2507</a></h3><span class="text-primary">$25.00</span>
                        </div>
                        <div class="product-card-body body-hidden pt-2">
                            <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
                        </div>
                    </div>
                </div>
                <!-- Product-->
                <div class="col-xl-3 col-sm-4 col-6 border border-collapse">
                    <div class="product-card">
                        <div class="product-thumb"><a class="product-thumb-link" href="shop-single-electronics.html"></a><img src="img/Hardware/Mobo/ASUS EX-A320M AMD AM4 Socket Gaming Motherboard.jpg" alt="ASUS EX-A320M AMD AM4 Socket Gaming Motherboard"></div>
                        <div class="product-card-body">
                            <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">GPU</a>
                            </div>
                            <h3 class="product-card-title"><a href="shop-single-electronics.html">ASUS EX-A320M AMD AM4 Socket Gaming Motherboard</a></h3><span class="text-primary">$129.00</span>
                        </div>
                        <div class="product-card-body body-hidden pt-2">
                            <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
                        </div>
                    </div>
                </div>
                <!-- Product-->
                <div class="col-xl-3 col-sm-4 col-6 border border-collapse">
                    <div class="product-card">
                        <div class="product-thumb"><a class="product-thumb-link" href="shop-single-electronics.html"></a><img src="img/Hardware/Mice/[New Version] Zelotes Gaming Mouse,Wired Mouse, Computer Mouse,7200 DPI 7 Buttons LED Optical USB.jpg" alt="[New Version] Zelotes Gaming Mouse,Wired Mouse, Computer Mouse,7200 DPI 7 Buttons LED Optical USB"></div>
                        <div class="product-card-body">
                            <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Computer Mice</a></div>
                            <h3 class="product-card-title"><a href="shop-single-electronics.html">Zelotes Gaming Wired Mouse</a></h3><span class="text-primary">$21.95</span>
                        </div>
                        <div class="product-card-body body-hidden pt-2">
                            <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
                        </div>
                    </div>
                </div>
                <!-- Product-->
                <div class="col-xl-3 col-sm-4 col-6 border border-collapse">
                    <div class="product-card">
                        <div class="product-thumb"><a class="product-thumb-link" href="shop-single-electronics.html"></a><img src="img/Hardware/Speakers/Creative T30 Wireless.jpg" alt="Creative T30 Wireless"></div>
                        <div class="product-card-body">
                            <div class="d-flex flex-wrap justify-content-between pb-1"><a class="product-meta" href="#">Speakers</a>
                            </div>
                            <h3 class="product-card-title"><a href="shop-single-electronics.html">Creative T30 Wireless Speakers Black</a></h3><span class="text-primary">
                            <del class="text-muted mr-1">$49.99</del>$29.99</span>
                        </div>
                        <div class="product-card-body body-hidden pt-2">
                            <button class="btn btn-primary btn-sm btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pb-4 mb-2"></div>
            <!-- Pagination-->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center justify-content-sm-start mb-0">
                    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                    <li class="page-item d-sm-none"><span class="page-link page-link-static">2 / 5</span></li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">2<span class="sr-only">(current)</span></span></li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">4</a></li>
                    <li class="page-item d-none d-sm-block">...</li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">10</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
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