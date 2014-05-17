<%@page import="br.com.totalsafety.entity.User"%>
<%@ page session="true" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"         prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>

<div class="container">
    <br /><br /><br />
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="col-sm-10 col-md-10 col-lg-10">
                <ul class="nav nav-pills" style="float: left;">
                    <li class="${linkSelected != null && linkSelected.equals("home") ? 'active' : ''}">
                        <a id="linkHome" href="<c:url value='/cms/home/list'/>"><spring:message code='home'/></a>
                    </li>
                    <li class="${linkSelected != null && linkSelected.equals("about") ? 'active' : ''}">
                        <a href="<c:url value='/cms/about'/>"><spring:message code='company.about'/></a>
                    </li>
                    <li class="${linkSelected != null && linkSelected.equals("services") ? 'active' : ''}">
                        <a href="<c:url value='/cms/service/list'/>"><spring:message code='company.services'/></a>
                    </li>
                    <li class="${linkSelected != null && linkSelected.equals("portfolio") ? 'active' : ''}">
                        <a href="<c:url value='/cms/portfolio/list'/>"><spring:message code='company.portfolio'/></a>
                    </li>
                    <li class="${linkSelected != null && linkSelected.equals("information") ? 'active' : ''}">
                        <a href="<c:url value='/cms/information/list'/>"><spring:message code='company.information'/></a>
                    </li>
                    <li class="${linkSelected != null && linkSelected.equals("contact") ? 'active' : ''}">
                        <a href="<c:url value='/cms/contact/edit'/>"><spring:message code='company.contact'/></a>
                    </li>   
                    <li class="${linkSelected != null && linkSelected.equals("user") ? 'active' : ''}">
                        <a href="<c:url value='/cms/user/list'/>"><spring:message code='company.users'/></a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-2 col-md-2 col-lg-2" style="margin-top: 10px;">
                <strong><c:out value='<%= ((User)request.getSession().getAttribute("user")).getName() %>'/></strong>
                <a  href="<c:url value='/cms/user/logout'/>">(<spring:message code='general.exit'/>)</a>
            </div>
        </div>
        <hr>
    </div>
</div>


