<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                <small><spring:message code="company.information.article"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value='/'/>"><spring:message code='home'/></a></li>
                <li class="active"><spring:message code="company.information"/></li>
                <li class="active"><spring:message code="company.information.article"/></li>
            </ol>
        </div>
    </div>
    <!-- /.row -->
    <div class="col-lg-12">
        <c:forEach items="${listInformation}" var="information">
            <div class="row">
                <div id="divText-${information.id}" style="height: 100px; overflow-y: hidden">
                    <h2>
                        ${information.title}
                    </h2>
                    <p>
                        ${information.text}
                    </p>                
                </div>
                <a id="seeMoreLink-${information.id}"
                   >
                    <h4><spring:message code="home.see.more"/></h4>
                </a>
            </div>
            <!-- /.row -->
            <hr>
            <script>
                jQuery("#seeMoreLink-${information.id}").click(function() {
                    var divHeight;
                    if (jQuery("#divText-${information.id}").css("height") === "100px") {
                        divHeight = "500px";
                        jQuery("#divText-${information.id}").css("overflow-y", "scroll");
                    } else {
                        divHeight = "100px";
                        jQuery("#divText-${information.id}").css("overflow-y", "hidden");
                    }
                    jQuery("#divText-${information.id}").animate(
                            {"height": divHeight},
                    "slow");
                });
            </script>
        </c:forEach>
    </div>
</div>
<!-- /.container -->


