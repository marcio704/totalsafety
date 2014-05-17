
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"    prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>


<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                <small><spring:message code="company.contact.description"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value='/'/>"><spring:message code='home'/></a></li>
                <li class="active"><spring:message code="company.contact"/></li>
            </ol>
        </div>
    </div>
    <!-- /.row -->

    <!--Google Map -->
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <iframe width="100%" height="300px" 
                    frameborder="0" scrolling="no" 
                    marginheight="0" marginwidth="0" 
                    src="<c:url value='/pages/menu/contact/map.jsp' />">
            </iframe>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-8">
            <c:url value="/contact/email" var="url"/>
            <form:form id="frmContact" commandName="contactEmail" method="POST" action="${url}">
                <div class="row">
                    <div class="form-group col-lg-12" >
                        <div class="alert alert-danger alert-dismissable">
                            <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <strong id="frmErrors"><form:errors path="*"/></strong>
                        </div>
                        <c:if test="${successMsg != null && !successMsg.isEmpty()}">
                            <div class="alert alert-success alert-dismissable">
                                <button id="successMsg" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <strong>${successMsg}</strong>
                            </div>
                        </c:if>
                    </div>
                    <div class="form-group col-lg-4"> 
                        <spring:message code="company.contact.name" var="contactName"/>
                        <form:input type="text"  placeholder="${contactName}" path="name" class="form-control" id="input1" />
                    </div>
                    <div class="form-group col-lg-4">
                        <spring:message code='company.contact.email.text'var="contactEmail"/>
                        <form:input type="email" placeholder="${contactEmail}" path="email" class="form-control" id="input2" />
                    </div>
                    <div class="form-group col-lg-4">
                        <spring:message code='company.contact.phone.text'var="contactPhone"/>
                        <form:input type="phone" placeholder="${contactPhone}" path="phone" id="phone" class="form-control" />
                    </div>
                    <div class="form-group col-lg-4">
                        <spring:message code='company.contact.company'var="contactCompany"/>
                        <form:input type="text" placeholder="${contactCompany}" path="company" class="form-control" id="input1" />
                    </div>
                    <div class="form-group col-lg-4">
                        <spring:message code='company.contact.company.number'var="contactIN"/>
                        <form:input type="text" placeholder="${contactIN}" path="identNumber" class="form-control" id="input2" />
                    </div>
                    <div class="form-group col-lg-4">
                        <spring:message code='company.contact.about' var="contactSubject"/>
                        <form:select path="subject" class="form-control">
                            <form:option value="Sugestão"><spring:message code='company.contact.sugestion'/></form:option>
                            <form:option value="Reclamação"><spring:message code='company.contact.complaint'/></form:option>
                            <form:option value="Outros"><spring:message code='company.contact.others'/></form:option>
                        </form:select>
                        <%--<form:input type="text" placeholder="${contactSubject}" path="subject" class="form-control" id="input3" />--%>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group col-lg-12">
                        <spring:message code='company.contact.message'var="contactMsg"/>
                        <form:textarea placeholder="${contactMsg}" path="text" class="form-control" rows="6" id="input4"></form:textarea>
                        </div>
                        <div class="form-group col-lg-12">
                            <input type="hidden" name="save" value="contact">
                            <button type="submit" class="btn btn-primary"><spring:message code='company.contact.submit'/></button>
                    </div>
                </div>
            </form:form>
        </div>

        <div class="col-sm-4">
            <h3><spring:message code="company.name"/></h3>
            <p>
                <i class="glyphicon glyphicon-home"></i>&nbsp;
                ${contact.street}<br>
                ${contact.district}<br>
            </p>
            <p><i class="glyphicon glyphicon-phone-alt"></i>&nbsp;${contact.phone}</p>
            <p><i class="glyphicon glyphicon-envelope"></i><a href="mailto:${contact.email}">&nbsp;${contact.email}</a></p>
            <p><i class="glyphicon glyphicon-time"></i>&nbsp;${contact.businessTime}</p>
            <ul class="list-unstyled list-inline list-social-icons">
                <li class="tooltip-social facebook-link"><a target="_blank" href="${contact.linkFacebook}" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook-square fa-2x"></i></a></li>
                <li class="tooltip-social linkedin-link"><a target="_blank" href="${contact.linkLinkedin}" data-toggle="tooltip" data-placement="top" title="LinkedIn"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
                <li class="tooltip-social twitter-link"><a target="_blank" href="${contact.linkTwitter}" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter-square fa-2x"></i></a></li>
                <li class="tooltip-social google-plus-link"><a target="_blank" href="${contact.linkGooglePlus}" data-toggle="tooltip" data-placement="top" title="Google+"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
            </ul>
        </div>
    </div><!-- /.row -->
</div>
<!-- /.container -->

<script>
    jQuery(document).ready(function() {
        if (jQuery("#frmErrors").html() === "") {
            jQuery("#closeAlertBtn").click();
        }
    });
    jQuery(function() {
        jQuery("#phone").mask("(999) 9999-9999");
    });
</script>


