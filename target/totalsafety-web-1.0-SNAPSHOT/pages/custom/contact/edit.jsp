<%@taglib uri="http://www.springframework.org/tags/form"    prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <br />
        <div class="col-md-12">
            <form:form action="" modelAttribute="contact" method="post" >
                <div class="form-group" >
                    <div class="alert alert-danger alert-dismissable">
                        <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong id="frmErrors"><form:errors path="*"/></strong>
                    </div>
                </div>
                <form:hidden path="id" />
                <div class="form-group">
                    <label for="street"><spring:message code="company.contact.adress.street"/>:</label>
                    <spring:message code="company.contact.adress.street.enter" var="enterStreet"/>
                    <form:input path="street" class="form-control" id="street"  placeholder="${enterStreet}" />
                </div>
                <div class="form-group">
                    <label for="district"><spring:message code="company.contact.adress.district"/>:</label>
                    <spring:message code="company.contact.adress.district.enter" var="enterDistrict"/>
                    <form:input path="district" class="form-control" id="district" placeholder="${enterDistrict}" />
                </div>
                <div class="form-group">
                    <label for="phone"><spring:message code="company.contact.phone.text"/>:</label>
                    <spring:message code="company.contact.phone.text.enter" var="enterPhone"/>
                    <form:input path="phone" class="form-control" id="phone" placeholder="${enterPhone}" />
                </div>
                <div class="form-group">
                    <label for="email"><spring:message code="company.contact.email.text"/>:</label>
                    <spring:message code="company.contact.email.text.enter" var="enterEmail"/>
                    <form:input path="email" class="form-control" id="email" placeholder="${enterEmail}" type="email" />
                </div>
                <div class="form-group">
                    <label for="businessTime"><spring:message code="company.contact.business.time"/>:</label>
                    <spring:message code="company.contact.business.time.enter" var="enterBT"/>
                    <form:input path="businessTime" class="form-control" id="businessTime" placeholder="${enterBT}" />
                </div>
                <spring:message code="general.link.enter" var="enterLink"/>
                <div class="form-group">
                    <label for="linkFacebook">Facebook:</label>
                    <form:input path="linkFacebook" class="form-control" id="linkFacebook" placeholder="${enterLink}" />
                </div>
                <div class="form-group">
                    <label for="linkInstagram">LinkedIn:</label>
                    <form:input path="linkLinkedin" class="form-control" id="linkInstagram" placeholder="${enterLink}" />
                </div>
                <div class="form-group">
                    <label for="linkTwitter">Twitter:</label>
                    <form:input path="linkTwitter" class="form-control" id="linkTwitter" placeholder="${enterLink}" />
                </div>
                <div class="form-group">
                    <label for="linkGooglePlus">Google+:</label>
                    <form:input path="linkGooglePlus" class="form-control" id="linkGooglePlus" placeholder="${enterLink}" />
                </div>
                <button type="submit" class="btn btn-default"><spring:message code="general.submit"/></button>
            </form:form>
        </div>
    </div>
</div>

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