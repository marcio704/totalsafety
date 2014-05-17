<%@taglib uri="http://www.springframework.org/tags/form"    prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <br />
        <div class="col-md-12">
            <form:form action="" modelAttribute="user" method="post" >
                <div class="form-group" >
                    <div class="alert alert-danger alert-dismissable">
                        <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong id="frmErrorsName"><form:errors path="name"/></strong><br />
                        <strong id="frmErrorsEmail"><form:errors path="email"/></strong>
                    </div>
                </div>
                <form:hidden path="id" />
                <form:hidden path="password" />
                <div class="form-group">
                    <label for="name"><spring:message code="company.user.name"/>:</label>
                    <spring:message code="company.user.name.enter" var="enterUser"/>
                    <form:input path="name" class="form-control" id="name"  placeholder="${enterUser}" />
                </div>
                <div class="form-group">
                    <label for="email"><spring:message code="company.user.email"/>:</label>
                    <spring:message code="company.user.email.enter" var="enterEmail"/>
                    <form:input path="email" class="form-control" id="email" placeholder="${enterEmail}" />
                </div>
                <button type="submit" class="btn btn-default"><spring:message code="general.submit"/></button>
            </form:form>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function() {
        if (jQuery("#frmErrorsName").html() === "" && jQuery("#frmErrorsEmail").html() === "") {
            jQuery("#closeAlertBtn").click();
        }
    });
</script>