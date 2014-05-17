<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<br /><br />
<div class="container-fluid well tsFooter">
    <div class="row-fluid">
        <div class="container">
            <div class="row">
                <div class="col-xm-2 col-sm-2 col-md-2 col-lg-2 col">
                    <div class="siteMapFooterItem">
                        <center>
                            <div class="row" style="margin-bottom: 10px">
                                <h4>
                                    <small>
                                        <spring:message code="home"/> &raquo;
                                    </small>
                                </h4> 
                            </div>
                            <div class="row">
                                <span>
                                    <a href="<c:url value="/"/>"><spring:message code="home.go.page"/></a>
                                </span>
                            </div>
                        </center>
                    </div>
                </div>
                <div class="col-xm-2 col-sm-2 col-md-2 col-lg-2 col">
                    <div class="siteMapFooterItem">
                        <center>
                            <div class="row" style="margin-bottom: 10px">
                                <h4>
                                    <small>
                                        <spring:message code="company.about"/> &raquo;
                                    </small>
                                </h4> 
                            </div>
                            <div class="row">
                                <span><a href="<c:url value="/about"/>#divWho"><spring:message code="company.about.who"/></a></span><br />
                                <span><a href="<c:url value="/about"/>#divTeam"><spring:message code="company.about.team"/></a></span>
                            </div>
                        </center>
                    </div>
                </div>
                <div class="col-xm-2 col-sm-2 col-md-2 col-lg-2 col">
                    <div class="siteMapFooterItem">
                        <center>
                            <div class="row" style="margin-bottom: 10px">
                                <h4>
                                    <small>
                                        <spring:message code="company.services"/> &raquo;
                                    </small>
                                </h4> 
                            </div>
                            <div class="row">
                                <span><a href="<c:url value="/services/1"/>"><spring:message code="company.service.one"/></a></span><br />
                                <span><a href="<c:url value="/services/2"/>"><spring:message code="company.service.two"/></a></span>
                            </div>
                        </center>
                    </div>
                </div>
                <div class="col-xm-2 col-sm-2 col-md-2 col-lg-2 col">
                    <div class="siteMapFooterItem">
                        <center>
                            <div class="row" style="margin-bottom: 10px">
                                <h4><small><spring:message code="company.portfolio"/> &raquo;</small></h4> 
                            </div>
                            <div class="row">
                                <span><a href="<c:url value="/portfolio/1"/>"><spring:message code="company.portfolio.one"/></a> </span><br />
                                <span><a href="<c:url value="/portfolio/2"/>"><spring:message code="company.portfolio.two"/></a> </span>
                            </div>
                        </center>
                    </div>
                </div>
                <div class="col-xm-2 col-sm-2 col-md-2 col-lg-2 col">
                    <div class="siteMapFooterItem">
                        <center>
                            <div class="row" style="margin-bottom: 10px">
                                <h4><small><spring:message code="company.information"/> &raquo;</small></h4> 
                            </div>
                            <div class="row">
                                <span><a href="<c:url value="/information/1"/>"><spring:message code="company.information.article"/></a></span><br />
                                <span><a href="<c:url value="/information/2"/>"><spring:message code="company.information.technical"/></a></span>
                            </div>
                            <br />
                        </center>
                    </div>
                </div>
                <div class="col-xm-2 col-sm-2 col-md-2 col-lg-2 col">
                    <div class="siteMapFooterItemLast">
                        <center>
                            <div class="row" style="margin-bottom: 10px">
                                <h4>
                                    <small>
                                        <spring:message code="company.contact"/> &raquo;
                                    </small>
                                </h4> 
                            </div>
                            <div class="row">
                                <span><a href="<c:url value="/contact"/>"><spring:message code="company.contact.go.page"/></a></span>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div style="margin-top: 20px;">
            <div class="col-md-12">
                <p class="pull-right">
                    <spring:message code="company.copyright"/>
                    <a id="loginLock" href="<c:url value="/login"/>">
                        <i class="glyphicon glyphicon-lock"></i>
                    </a>
                </p>
                <p class="pull-left">
                    <a href="?lang=en_US">
                        <img src="<c:url value="/resources/images/flag_usa_20x20.png"/>" />
                    </a>
                    <a href="?lang=es">
                        <img src="<c:url value="/resources/images/flag_spa_20x20.png"/>" />
                    </a>
                    <a href="?lang=pt_BR">
                        <img src="<c:url value="/resources/images/flag_BR_20x20.png"/>" />
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>
<!-- /.container -->