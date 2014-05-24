<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button id="btnMenuHeader" type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" style="z-index: 2" href="<c:url value="/"/>">
                <img id="logo" src="<c:url value='/resources/images/logo.png' />" alt="<spring:message code="company.name"/>" />
            </a>
            <spam class="navbar-brand">
                <img id="logoName" src="<c:url value='/resources/images/logo_name.png' />" alt="<spring:message code="company.name"/>"/>
            </spam>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse" id="headerCollapsedMenu">
            <ul class="nav navbar-nav navbar-right" style="margin-left: 5px;">
                <li>
                    <a href="<c:url value="/about"/>"><spring:message code="company.about"/></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="company.services"/> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<c:url value="/services/1"/>"><spring:message code="company.service.one"/></a>                         
                        </li>
                        <li>
                            <a href="<c:url value="/services/2"/>"><spring:message code="company.service.two"/></a>                         
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="company.portfolio"/> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<c:url value="/portfolio/1"/>"><spring:message code="company.portfolio.one"/></a>                         
                        </li>
                        <li>
                            <a href="<c:url value="/portfolio/2"/>"><spring:message code="company.portfolio.two"/></a>                         
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="company.information"/> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<c:url value="/information/1"/>"><spring:message code="company.information.article"/></a>                      
                        </li>
                        <li>
                            <a href="<c:url value="/information/2"/>"><spring:message code="company.information.technical"/></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<c:url value="/contact"/>"><spring:message code="company.contact"/></a>                
                </li>
                <li>
                    <!-- Google Custom Search -->
                    <div style="margin-top: 13px; margin-left: 30px;">
                        <div class="row" style="margin-top: 5px;">
                            <c:url value="/search" var="url"/>
                            <form method="get" id="searchform" id="searchbox_008295403780974825624:tj11nvaon2k" action="${url}">
                                <div>
                                    <input value="008295403780974825624:tj11nvaon2k" name="cx" type="hidden"/>
                                    <input value="FORID:11" name="cof" type="hidden"/>
                                    <spring:message code="general.search" var="search"/>
                                    <input type="text" placeholder="${search}" name="s" id="s" onfocus="defaultInput(this)" onblur="clearInput(this)" />
                                    <input type="submit" id="searchsubmit" value=" " />
                                </div>
                            </form>
                        </div>
                    </div>
                </li>
            </ul>

        </div>

        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
