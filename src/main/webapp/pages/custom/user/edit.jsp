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
                        <strong id="frmErrors"><form:errors path="*"/></strong>
                    </div>
                </div>
                <form:hidden path="id" />
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
                <div class="form-group">
                    <form:checkbox id="changePwd" path="changePassword"/>
                    <label for="changePwd"><spring:message code="company.user.password.change"/></label>
                </div>
                <div id="divPwd" class="form-group" style="display: none">
                    <label for="password"><spring:message code="company.user.password"/>:</label>
                    <spring:message code="company.user.password.enter" var="enterPwd"/>
                    <form:password path="password" class="form-control" id="password" placeholder="${enterPwd}"/>
                </div>
                <div id="divPwdConfirm" class="form-group" style="display: none">
                    <label for="pwdConfirmation"><spring:message code="company.user.password.confirm"/>:</label>
                    <spring:message code="company.user.password.confirm.enter" var="enterPwdConfirm"/>
                    <input name="pwdConfirmation" class="form-control" id="pwdConfirmation" placeholder="${enterPwdConfirm}" 
                           type="password" onCopy="return false" onPaste="return false" />
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
        } else {
            jQuery("#changePwd").click();
        }
        jQuery("#changePwd").click(function() {
            if (jQuery("#divPwd").css("display") === "none") {
                jQuery("#divPwd").css("display", "block");
                jQuery("#divPwdConfirm").css("display", "block");
            } else {
                jQuery("#divPwd").css("display", "none");
                jQuery("#divPwdConfirm").css("display", "none");
            }
        });
    });
</script>