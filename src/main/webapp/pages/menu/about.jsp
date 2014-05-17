<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<!--<div class="container">-->
<div class="container">
    <div class="row" id="divWho">
        <div class="col-lg-12">
            <h1 class="page-header">
                <small><spring:message code="company.about.title"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value='/'/>"><spring:message code='home'/></a>
                </li>
                <li class="active"><spring:message code="company.about"/></li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <img class="img-responsive tsImg" src="${about.img}">
        </div>
        <div class="col-md-6">
            <h2><spring:message code="company.about.who"/></h2>
            <p>
                ${about.text}
            </p>
        </div>
    </div>
    <!-- Team Member Profiles -->
    <div id="divTeam" class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h2 class="page-header"><spring:message code="company.about.team"/></h2>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12" style="margin-left: 3%">
            <c:forEach items="${employeeList}" var="employee" varStatus="i">
                <div class="col-sm-3 col-md-3 col-lg-3">
                    <div class="row" style="min-height: 450px;">
                        <center>
                            <h3>${employee.area}</h3>
                            <!--            
                                           <div class="imageRadiusBorder">
                                               <img class="img-responsive" style="width: 215px; height: 215px" src="${employee.image}">
                                           </div>
                            -->
                            <p>${employee.jobDescription}</p>
                        </center>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <center>
                            <h4>${employee.name}
                                <small>${employee.job}</small>
                            </h4>
                            <!--
                                            <ul class="list-unstyled list-inline list-social-icons">
                                                <li class="tooltip-social facebook-link"><a target="_BLANK" href="${employee.linkFacebook}" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook-square fa-2x"></i></a>
                                                </li>
                                                <li class="tooltip-social linkedin-link"><a target="_BLANK" href="${employee.linkInstagram}" data-toggle="tooltip" data-placement="top" title="LinkedIn"><i class="fa fa-linkedin-square fa-2x"></i></a>
                                                </li>
                                                <li class="tooltip-social twitter-link"><a target="_BLANK" href="${employee.linkTwitter}" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter-square fa-2x"></i></a>
                                                </li>
                                                <li class="tooltip-social google-plus-link"><a target="_BLANK" href="${employee.linkGooglePlus}" data-toggle="tooltip" data-placement="top" title="Google+"><i class="fa fa-google-plus-square fa-2x"></i></a>
                                                </li>
                                            </ul>
                            -->
                        </center>
                    </div>
                </div>
                <c:if test="${i.count % 3 != 0}">
                    <div class="col-sm-1"></div>
                </c:if>                                
            </c:forEach>
        </div>
    </div>
    <!-- Our Customers -->

    <!--    <div class="row">
    
            <div class="col-lg-12">
                <h2 class="page-header"><spring:message code="company.about.customers"/></h2>
            </div>
    
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive img-customer" src="http://placehold.it/500x300">
            </div>
    
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive img-customer" src="http://placehold.it/500x300">
            </div>
    
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive img-customer" src="http://placehold.it/500x300">
            </div>
    
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive img-customer" src="http://placehold.it/500x300">
            </div>
    
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive img-customer" src="http://placehold.it/500x300">
            </div>
    
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive img-customer" src="http://placehold.it/500x300">
            </div>
    
        </div>
    -->
</div>