<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <br />
        <div class="col-md-12">
            <c:url value="/cms/employee/new" var="url"/>
            <form:form action="${url}" modelAttribute="employee" method="post" enctype="multipart/form-data" >
                <div class="form-group" >
                    <div class="alert alert-danger alert-dismissable">
                        <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong id="frmErrors"><form:errors path="*"/></strong>
                    </div>
                </div>
                <td><form:hidden path="id" /></td>
                <td><form:hidden path="image" /></td>
                <td><form:hidden path="linkFacebook" /></td>
                <td><form:hidden path="linkInstagram" /></td>
                <td><form:hidden path="linkTwitter" /></td>
                <td><form:hidden path="linkGooglePlus" /></td>
                <div class="form-group">
                    <label for="area"><spring:message code="company.about.team.area"/>:</label>
                    <spring:message code="company.about.team.area.enter" var="enterArea" />
                    <form:input path="area" class="form-control" id="area"  placeholder="${enterArea}" />
                </div>
                <div class="form-group">
                    <label for="jobDescription"><spring:message code="company.about.team.jobDescription"/>:</label>
                    <spring:message code="company.about.team.jobDescription.enter" var="jdEnter"/>
                    <form:textarea rows="5" path="jobDescription" class="form-control" id="jobDescription" placeholder="${jdEnter}" />
                </div>
                <div class="form-group">
                    <label for="name"><spring:message code="company.about.team.name"/>:</label>
                    <spring:message code="company.about.team.name.enter" var="enterName" />
                    <form:input path="name" class="form-control" id="name"  placeholder="${enterName}" />
                </div>
                <div class="form-group">
                    <label for="job"><spring:message code="company.about.team.job"/>:</label>
                    <spring:message code="company.about.team.job.enter" var="enterJob"/>
                    <form:input path="job" class="form-control" id="job" placeholder="${enterJob}" />
                </div>
                <label for="seletedImg"><spring:message code="company.about.team.image"/> (215x215):</label>
                <div class="form-group">
                    <div id="seletedImg">
                        <img src="${employee.image}" style="width: 60px; height: 45px; margin-left: 20px;">
                    </div>
                    <div>
                        <input id="fileBtn" type="file" name="imageUpload"/>
                        <p class="help-block"><spring:message code="company.about.team.image.alert"/></p>
                    </div>
                </div>
            <!--                    
                <spring:message code="general.link.enter" var="enterLink"/>
            <div class="form-group">
                    <label for="linkFacebook">Facebook:</label>
                <form:input path="linkFacebook" class="form-control" id="linkFacebook" placeholder="${enterLink}" />
            </div>
            <div class="form-group">
                <label for="linkInstagram">LinkedIn:</label>
                <form:input path="linkInstagram" class="form-control" id="linkInstagram" placeholder="${enterLink}" />
            </div>
            <div class="form-group">
                <label for="linkTwitter">Twitter:</label>
                <form:input path="linkTwitter" class="form-control" id="linkTwitter" placeholder="${enterLink}" />
            </div>
            <div class="form-group">
                <label for="linkGooglePlus">Google+:</label>
                <form:input path="linkGooglePlus" class="form-control" id="linkGooglePlus" placeholder="${enterLink}" />
            </div>
                -->
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
        jQuery("#fileBtn").click(function() {
            jQuery("#seletedImg").css("display", "none");
        });
    });
</script>