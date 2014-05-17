<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <br />
        <div class="col-md-12">
            <form:form action="" modelAttribute="portfolio" method="post" enctype="multipart/form-data" >
                <div class="form-group" >
                    <div class="alert alert-danger alert-dismissable">
                        <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong id="frmErrors"><form:errors path="*"/></strong>
                    </div>
                </div>
                <td><form:hidden path="id" /></td>
                <td><form:hidden path="image" /></td>
                <div class="form-group">
                    <label for="title"><spring:message code="company.portfolio.title"/>:</label>
                    <spring:message code="company.portfolio.title.enter" var="enterTitle"/>
                    <form:input path="title" class="form-control" id="title"  placeholder="${enterTitle}" />
                </div>
                <div class="form-group">
                    <label for="subtitle"><spring:message code="company.portfolio.subtitle"/>:</label>
                    <spring:message code="company.portfolio.subtitle.enter" var="enterSub"/>
                    <form:input path="subTitle" class="form-control" id="subtitle" placeholder="${enterSub}" />
                </div>
                <div class="form-group">
                    <label for="text"><spring:message code="company.portfolio.text"/>:</label>
                    <spring:message code="company.portfolio.text.enter" var="enterText"/>
                    <form:textarea rows="5" path="text" class="form-control" id="text" placeholder="${enterText}" />
                </div>
                 <div class="form-group">
                    <label for="aditionalInfo"><spring:message code="company.portfolio.aditionalInfo"/>:</label>
                    <form:textarea rows="10" path="aditionalInformation" class="form-control" id="aditionalInfo" />
                </div>
                <div class="form-group">
                    <label for="imageUpl"><spring:message code="company.portfolio.image"/> (750x350):</label>
                    <input type="file" name="imageUpload" id="imageUpl"/>
                    <p class="help-block"><spring:message code="company.portfolio.image.alert"/></p>
                </div>
                <div class="form-group">
                    <label for="link"><spring:message code="company.portfolio.link"/>:</label>
                    <spring:message code="general.link.enter" var="enterLink"/>
                    <form:input path="link" class="form-control" id="link" placeholder="${enterLink}" />
                </div>
                <div class="form-group">
                    <label for="subtitle"><spring:message code="company.portfolio.type"/>:</label>
                    <form:select path="type" id="type">
                        <form:option value="RBC">RBC</form:option>
                        <form:option value="RBLE">RBLE</form:option>
                    </form:select>
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
</script>