<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>


<div class="container">

    <div class="row">

        <div class="col-lg-12">
            <h1 class="page-header">
                <small><spring:message code="company.service.one.description"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value='/'/>"><spring:message code='home'/></a></li>
                <li class="active"><spring:message code="company.services"/></li>
                <li class="active"><spring:message code="company.service.one"/></li>
            </ol>
        </div>

    </div>
    <!-- /.row -->
    <c:forEach items="${serviceList}" var="service" varStatus="i">
        <div class="row">
            <c:if test="${i.count % 2 != 0}">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <c:if test="${service.link != null && !service.link.isEmpty()}">
                        <a target="_blank" 
                           href="${service.link}" 
                           title="<spring:message code="company.service.link"/>">
                            <img class="img-responsive tsImg" src="${service.image}">
                        </a>
                    </c:if>
                    <c:if test="${service.link == null || service.link.isEmpty()}">
                        <img class="img-responsive tsImg" src="${service.image}">
                    </c:if>
                </div>
            </c:if>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div style="${i.count % 2 == 0 ? 'text-align: right' : ''}">
                    <h2>
                        <c:if test="${service.link != null && !service.link.isEmpty()}">
                            <a target="_blank" 
                               href="${service.link}" 
                               title="<spring:message code="company.service.link"/>">
                                ${service.title}
                            </a>
                        </c:if>
                        <c:if test="${service.link == null || service.link.isEmpty()}">
                            ${service.title}
                        </c:if>
                    </h2>
                    <h4>${service.subTitle}</h4>
                    <p>
                        ${service.text}
                    </p>
                </div>
            </div>
            <c:if test="${i.count % 2 == 0}">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <c:if test="${service.link != null && !service.link.isEmpty()}">
                        <a target="_blank" 
                           href="${service.link}" 
                           title="<spring:message code="company.service.link"/>">
                            <img class="img-responsive tsImg" src="${service.image}">
                        </a>
                    </c:if>
                    <c:if test="${service.link == null || service.link.isEmpty()}">
                        <img class="img-responsive tsImg" src="${service.image}">
                    </c:if>                </div>
                </c:if>
        </div>
        <!-- /.row -->
        <br />
    </c:forEach>
</div>
<!-- /.container -->


