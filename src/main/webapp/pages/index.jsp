<%@taglib uri="http://www.springframework.org/tags/form"    prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <c:forEach items="${home.images}" var="image" varStatus="imageNumber">
            <c:if test="${imageNumber.count == 1}">
                <li data-target="#myCarousel" data-slide-to="${status.count}" class="active" />
            </c:if>
            <c:if test="${imageNumber.count > 1}">
                <li data-target="#myCarousel" data-slide-to="${status.count}" />
            </c:if>
        </c:forEach>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <c:if test="${image.id == 1}">
            <div style="visibility: hidden" ></div>
        </c:if>
        <c:forEach items="${home.images}" var="image" varStatus="imageNumber">
            <c:if test="${imageNumber.count == 1}">
                <div class="item active">
                    <div class="fill">
                        <c:if test="${image.link != null && !image.link.isEmpty()}">
                            <spring:message code="general.link.see" var="seeLink"/>
                            <a href="${image.link}" target="_blank" title="${seeLink}">
                                <img style="width:100%; height: 100%" src="${image.base64}"/>
                            </a>
                        </c:if>
                        <c:if test="${image.link == null || image.link.isEmpty()}">
                            <img style="width:100%; height: 100%" src="${image.base64}"/>
                        </c:if>
                    </div>
                </div>
            </c:if>
            <c:if test="${imageNumber.count > 1}">
                <div class="item">
                    <div class="fill">
                        <c:if test="${image.link != null && !image.link.isEmpty()}">
                            <spring:message code="general.link.see" var="seeLink"/>
                            <a href="${image.link}" target="_blank" title="${seeLink}">
                                <img style="width:100%; height: 100%" src="${image.base64}"/>
                            </a>
                        </c:if>
                        <c:if test="${image.link == null || image.link.isEmpty()}">
                            <img style="width:100%; height: 100%" src="${image.base64}"/>
                        </c:if>                 
                    </div>
                </div>
            </c:if>
        </c:forEach> 
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="icon-next"></span>
    </a>
</div>

<div id="shadowRow">
    <c:url value="/resources/images/top_shadow_resized.png" var="imageUrl"/>
    <div class="row-fluid top_shadow">
        <img id ="top_shadow_image" class="img-responsive" src="${imageUrl}">
    </div>
</div>

<div class="container" style="margin-top: -60px;" >
    <c:if test="${home.warn != null && !home.warn.isEmpty()}">
        <br />
        <c:url value="/resources/images/warning_background.jpg" var="imageUrl"/>
        <div class="row" style="background-image: url(${imageUrl});">
            <div id="divWarn" style="display: none;">
                <center>
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="row">
                            <c:if test="${home.warnImage != null && !home.warnImage.isEmpty()}">
                                <div class="col-md-7">
                                    <img class="img-responsive tsImg" src="${home.warnImage}">
                                </div>
                            </c:if>
                            <div class="col-md-${home.warnImage != null && !home.warnImage.isEmpty() ? 5 : 12}">
                                <p>
                                    ${home.warn}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </center>
            </div>
        </div>
    </c:if>
    <br />    
    <div class="row">
        <div class="col-lg-4 col-md-4">
            <h3><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;<spring:message code="home.about"/></h3>
            <p>
                <spring:message code="home.about.description"/>
                <br />
                <a href="<c:url value='/about'/>"><spring:message code="home.see.more"/> </a>
            </p>
        </div>
        <div class="col-lg-4 col-md-4">
            <h3><i class="glyphicon glyphicon-cog"></i>&nbsp;<spring:message code="home.services"/></h3>
            <p>
                <spring:message code="home.services.description"/>
                <br />
                <a href="<c:url value='/services/1'/>"><spring:message code="home.see.more"/> </a>
            </p>
        </div>
        <div class="col-lg-4 col-md-4">
            <h3><i class="fa fa-folder-open"></i>&nbsp;<spring:message code="home.portfolio"/></h3>
            <p>
                <spring:message code="home.portfolio.description"/>
                <br />
                <a href="<c:url value='/portfolio/1'/>"><spring:message code="home.see.more"/> </a>
            </p>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<br />    
<div class="container">
    <div class="row well">
        <div class="col-lg-8 col-md-8">
            <h4><spring:message code="home.contact.title"/></h4>
            <p><spring:message code="home.contact.description"/></p>
        </div>
        <div class="col-lg-4 col-md-4">
            <a class="btn btn-lg btn-primary pull-right" href="<c:url value='/contact'/>"><spring:message code="home.contact.submit"/></a>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->

<script type="text/javascript">
    $(document).ready(function() {
        $("#divWarn").fadeIn(3000);
    });
</script> 