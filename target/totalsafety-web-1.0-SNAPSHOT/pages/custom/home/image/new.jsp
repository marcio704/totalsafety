<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form"    prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <br />
        <div class="col-md-12">
            <c:url value="/cms/home/image/new" var="url" />
            <form:form action="${url}" modelAttribute="homeImage" method="post" enctype="multipart/form-data" >
                <td><form:hidden path="id" /></td>
                <td><form:hidden path="base64" /></td>
                <label for="imageUpl"><spring:message code="company.home.image"/> (1900x1080):</label>
                <div class="form-group">
                    <div id="seletedImg">
                        <img src="${homeImage.base64}" style="width: 200px; height: 108px;">
                    </div>
                    <div>
                        <input id="fileBtn" type="file" name="imageUpload"/>
                        <p class="help-block"><spring:message code="company.home.image.alert"/></p>
                    </div>
                </div>
                <div class="form-group">
                    <spring:message code="general.link.enter" var="enterLink"/>
                    <form:input path="link" class="form-control" placeholder="${enterLink}" />
                </div>
                <button type="submit" class="btn btn-default"><spring:message code="general.submit"/></button>
                <div class="alert alert-danger alert-dismissable">
                    <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong id="frmErrors"><form:errors path="*"/></strong>
                </div>          
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
