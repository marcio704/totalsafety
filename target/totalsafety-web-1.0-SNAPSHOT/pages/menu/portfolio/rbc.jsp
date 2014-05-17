<%@ taglib uri="http://java.sun.com/jsp/jstl/core"       prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                <small><spring:message code="company.portfolio.one.description"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value='/'/>"><spring:message code='home'/></a></li>
                <li class="active"><spring:message code="company.portfolio"/></li>
                <li class="active"><spring:message code="company.portfolio.one"/></li>
            </ol>
        </div>
    </div>
    <!-- /.row -->

    <c:forEach items="${listPortfolio}" var="portfolio"> 
        <div class="row">
            <div class="col-md-7">
                <c:if test="${portfolio.link != null && !portfolio.link.isEmpty()}">
                    <a target="_blank" 
                       href="${portfolio.link}" 
                       title="<spring:message code="company.portfolio.link"/>">
                        <img class="img-responsive tsImg" style="width: 750px; height: 350px" src="${portfolio.image}" />
                    </a>
                </c:if>
                <c:if test="${portfolio.link == null || portfolio.link.isEmpty()}">
                    <img class="img-responsive tsImg" style="width: 750px; height: 350px" src="${portfolio.image}" />
                </c:if>
            </div>

            <div class="col-md-5">
                <h3>
                    <c:if test="${portfolio.link != null && !portfolio.link.isEmpty()}">
                        <a target="_blank" 
                           href="${portfolio.link}" 
                           title="<spring:message code="company.portfolio.link"/>">
                            ${portfolio.title}
                        </a>
                    </c:if>
                    <c:if test="${portfolio.link == null || portfolio.link.isEmpty()}">
                        ${portfolio.title}
                    </c:if>
                </h3>
                <c:if test="${portfolio.subTitle != null && !portfolio.subTitle.isEmpty()}">
                    <h4>${portfolio.subTitle}</h4>
                </c:if>
                <p>${portfolio.text}</p>
                <c:if test="${portfolio.aditionalInformation != null && !portfolio.aditionalInformation.isEmpty()}">
                    <a href="#modal${portfolio.id}" data-toggle="modal" data-target="#modal${portfolio.id}" ><spring:message code="company.portfolio.aditionalInfo"/></a>
                </c:if>
            </div>
        </div>

        <hr>
    </c:forEach>
</div>
<!-- /.container -->

<c:forEach items="${listPortfolio}" var="portfolio">
    <c:if test="${portfolio.aditionalInformation != null && !portfolio.aditionalInformation.isEmpty()}">
        <!-- Modal -->
        <div class="modal fade" id="modal${portfolio.id}" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" ><spring:message code="company.portfolio.aditionalInfo"/></h4>
                    </div>
                    <div class="modal-body">
                        ${portfolio.aditionalInformation}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-right" data-dismiss="modal"><spring:message code="general.close"/></button>
                    </div>
                </div>
            </div>
        </div>   
    </c:if>
</c:forEach>