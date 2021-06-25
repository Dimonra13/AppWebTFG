<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.statistic"/></title>
</head>
<!-- Body-->
<body>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'ListTable.css')}" type="text/css">

<div class="container pt-lg-3 pb-5 mb-sm-3">
    <div class="row pt-5">
        <div class="col-12">
            <!-- User course lists -->
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-2">
                <h2 class="h3 mb-3"><g:message code="statistic.title"/></h2>
            </div>
            <g:if test="${!feedbackList}">
                <!-- Info alert -->
                <div class="alert alert-info" role="alert">
                    <div class="alert-icon-box">
                        <i class="alert-icon" data-feather="info"></i>
                    </div>
                    " -- <g:message code="statistic.noFeedback"/>
                </div>
            </g:if>
            <g:else>
                <div>
                    <table class='courseList-display-table'>
                        <tr>
                            <th><g:message code="statistic.user.id"/></th>
                            <th><g:message code="statistic.clicksSearch"/></th>
                            <th><g:message code="statistic.clicksRecommend"/></th>
                            <th><g:message code="statistic.clicksRelatedToQuery"/></th>
                            <th><g:message code="statistic.clicksRelatedToCourse"/></th>
                            <th><g:message code="statistic.addToListSearch"/></th>
                            <th><g:message code="statistic.addToListRecommend"/></th>
                            <th><g:message code="statistic.addToListRelatedToQuery"/></th>
                            <th><g:message code="statistic.addToListRelatedToCourse"/></th>
                            <th><g:message code="statistic.notInterestedCoursera"/></th>
                            <th><g:message code="statistic.notInterestedUdemy"/></th>
                            <th><g:message code="statistic.notInterestedUdacity"/></th>
                        </tr>

                        <g:each var="feedback" in="${feedbackList}" status="i">
                            <g:if test="${i % 2 == 0}">
                                <tr class="even-row">
                            </g:if>
                            <g:else>
                                <tr class="odd-row">
                            </g:else>
                            <td>${feedback?.user?.id}</td>
                            <td>${feedback?.clicksSearch}</td>
                            <td>${feedback?.clicksRecommend}</td>
                            <td>${feedback?.clicksRelatedToQuery}</td>
                            <td>${feedback?.clicksRelatedToCourse}</td>
                            <td>${feedback?.addToListSearch}</td>
                            <td>${feedback?.addToListRecommend}</td>
                            <td>${feedback?.addToListRelatedToQuery}</td>
                            <td>${feedback?.addToListRelatedToCourse}</td>
                            <td>${feedback?.notInterestedCoursera}</td>
                            <td>${feedback?.notInterestedUdemy}</td>
                            <td>${feedback?.notInterestedUdacity}</td>
                            </tr>
                        </g:each>
                    </table>
                </div>
            </g:else>
        </div>
    </div>
</div>

</body>
</html>