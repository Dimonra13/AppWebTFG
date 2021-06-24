<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.home"/></title>
  </head>
  <!-- Body-->
  <body>
    <asset:javascript src="jquery.star-rating-svg.js"/>
    <asset:stylesheet src="star-rating-svg.css"/>
    <!-- Jumbotron -->
    <section class="container px-3">
      <br>
      <div class="jumbotron bg-size-cover bg-position-center bg-no-repeat text-center" style="background-image: url(${assetPath(src: 'home/intro/footer-pattern.jpg')});">
        <h1 class="text-light"><g:message code="home.welcome.title"/></h1>
        <p class="lead text-light"><g:message code="home.welcome.description"/></p>
      </div>
    </section>
    <!-- Category Caroursel-->
    <section class="container px-3 pb-4">
      <g:set var="catListScience" value="${['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Security',
                                           'Software-Engineering','Maths','Science','Gaming','IT-Certification',
                                           'Test-Prep','Architecture'
                                 ]}"/>
      <div>
        <h2 class="h2 mb-3 text-center"><g:message code="home.science.title"/></h2>
      </div>
      <div class="owl-carousel border-right" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: false, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 3500, &quot;loop&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;360&quot;:{&quot;items&quot;:2},&quot;600&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
        <g:each var="category" in="${catListScience}" status="i">
          <!-- Category card (style 1) -->
          <div class="card border-left-0 border-right-0">
            <div class="card-body border mt-n1 py-4 text-center">
              <a href="/category/${category}">
                <asset:image class="d-block mx-auto" src="Category-icons/cat_${category}.png" style="height: 135px;" alt="${category}"/>
              </a>
              <br>
              <h2 class="h5 mb-1"><g:message code="interest.${category}"/></h2>
              <a href="/category/${category}" class="btn btn-pill btn-outline-primary btn-sm"><g:message code="home.explore.category"/></a>
            </div>
          </div>
        </g:each>
      </div>
    </section>
    <br>
    <!-- Category Caroursel-->
    <section class="container px-3 pb-4">
      <g:set var="catList" value="${['Business-Finance','Leadership','Entrepreneurship','Personal-Development',
                                     'Human-Studies','Arts','Education','Health','Marketing','Graphic-Design'
                                  ]}"/>
      <div>
        <h2 class="h2 mb-3 text-center"><g:message code="home.humanities.title"/></h2>
      </div>
      <div class="owl-carousel border-right" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: false, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 3500, &quot;loop&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;360&quot;:{&quot;items&quot;:2},&quot;600&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
        <g:each var="category" in="${catList}" status="i">
          <!-- Category card (style 1) -->
          <div class="card border-left-0 border-right-0">
            <div class="card-body border mt-n1 py-4 text-center">
              <a href="/category/${category}">
                <asset:image class="d-block mx-auto" src="Category-icons/cat_${category}.png" style="height: 135px;" alt="${category}"/>
              </a>
              <br>
              <h2 class="h5 mb-1"><g:message code="interest.${category}"/></h2>
              <a href="/category/${category}" class="btn btn-pill btn-outline-primary btn-sm"><g:message code="home.explore.category"/></a>
            </div>
          </div>
        </g:each>
      </div>
    </section>
    <br><br>
    <!-- Brands carousel-->
    <section class="container px-3 pb-4">
      <div>
        <h2 class="h2 mb-3 text-center"><g:message code="home.brands.title"/></h2>
      </div>
      <div class="owl-carousel border-right" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: false, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 3500, &quot;loop&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;360&quot;:{&quot;items&quot;:2},&quot;600&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
        <a class="d-block bg-white border py-4 py-sm-5 px-2" href="/category/Apple" style="margin-right: -.0625rem;">
          <asset:image class="d-block mx-auto" src="Brands/Apple.png" style="height: 135px;" alt="Apple"/>
        </a>
        <a class="d-block bg-white border py-4 py-sm-5 px-2" href="/category/Microsoft" style="margin-right: -.0625rem;">
          <asset:image class="d-block mx-auto" src="Brands/Microsoft.png" style="height: 135px;" alt="Microsoft"/>
        </a>
        <a class="d-block bg-white border py-4 py-sm-5 px-2" href="/category/Google" style="margin-right: -.0625rem;">
          <asset:image class="d-block mx-auto" src="Brands/Google.png" style="height: 135px;" alt="Google"/>
        </a>
        <a class="d-block bg-white border py-4 py-sm-5 px-2" href="/category/Oracle" style="margin-right: -.0625rem;">
          <asset:image class="d-block mx-auto" src="Brands/Oracle.png" style="height: 135px;" alt="Oracle"/>
        </a>
        <a class="d-block bg-white border py-4 py-sm-5 px-2" href="/category/SAP" style="margin-right: -.0625rem;">
          <asset:image class="d-block mx-auto" src="Brands/SAP.png" style="height: 135px;" alt="SAP"/>
        </a>
      </div>
    </section>
    <br>
    <!-- Recommended courses -->
    <g:if test="${recommendedCourses}">
      <section class="container px-3 pb-4">
        <div class="col-12">
          <br><br>
          <div>
            <h2 class="h2 mb-3 text-center"><g:message code="recommended.index.title"/></h2>
          </div>
          <div class="row no-gutters">
            <g:each var="course" in="${recommendedCourses}" status="i">
              <!-- Course info -->
              <div class="col-lg-3 col-sm-3 col-6 border border-collapse">
                <div class="product-card">
                  <div class="product-thumb"><asset:image src="Categories/cat_${course.category}.jpg" style="height: 15rem;"/></div>
                  <div class="product-card-body">
                    <h5><a href="/course/${course.id}/?recommendation=forUser">${course.title}</a></h5>
                    <g:if test="${course?.rating}">
                      <p><span class="my-rating" id="my-rating${i}"></span><span class="font-weight-semibold ml-1"> (${course.rating})</span></p>
                    </g:if>
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
        </div>
      </section>
      <br>
    </g:if>
    <!-- Related to query courses -->
    <g:if test="${relatedToQueryCourses}">
      <section class="container px-3 pb-4">
        <div class="col-12">
          <br><br>
          <div>
            <h2 class="h2 mb-3 text-center"><g:message code="relatedToQuery.index.title"/></h2>
          </div>
          <div class="row no-gutters">
            <g:each var="course" in="${relatedToQueryCourses}" status="i">
              <!-- Course info -->
              <div class="col-lg-3 col-sm-3 col-6 border border-collapse">
                <div class="product-card">
                  <div class="product-thumb"><asset:image src="Categories/cat_${course.category}.jpg" style="height: 15rem;"/></div>
                  <div class="product-card-body">
                    <h5><a href="/course/${course.id}/?recommendation=relatedQuery">${course.title}</a></h5>
                    <g:if test="${course?.rating}">
                      <p><span class="my-rating" id="my-rating${i+20}"></span><span class="font-weight-semibold ml-1"> (${course.rating})</span></p>
                    </g:if>
                  </div>
                </div>
              </div>
              <g:javascript>
                            $("#my-rating${i+20}").starRating({
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
        </div>
      </section>
      <br>
    </g:if>
  </body>
</html>