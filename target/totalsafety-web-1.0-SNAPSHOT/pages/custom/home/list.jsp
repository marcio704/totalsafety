<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default" >
                <div style="margin: 5px">
                    <c:url value="/cms/home/warn" var="url" />
                    <form:form action="${url}" method="post" commandName="home" enctype="multipart/form-data" >
                        <form:hidden path="id"/>
                        <form:hidden path="warnImage"/>
                        <div class="form-group">
                            <label for="warn"><spring:message code="company.home.warn"/></label>
                            <spring:message code="company.home.warn.enter" var="enterWarn"/>
                            <form:textarea rows="5" path="warn" class="form-control" name="content" id="warn" placeholder="${enterWarn}" />
                        </div>
                        <label for="seletedImg"><spring:message code="company.home.image"/> (700x450):</label>
                        <div class="form-group">
                            <div id="seletedImg">
                                <img src="${home.warnImage}" style="width: 70px; height: 45px; margin-left: 30px;">
                            </div>
                            <div>
                                <input id="fileBtn" type="file" name="imageUpload"/>
                                <p class="help-block"><spring:message code="company.home.image.warn"/></p>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default"><spring:message code="general.submit"/></button>
                        <div class="form-group" >
                            <br/>
                            <div class="alert alert-danger alert-dismissable">
                                <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <strong id="frmErrors"><form:errors path="*"/></strong>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading"><strong><spring:message code="company.home.list"/></strong></div>

                <c:forEach items="${listImages}" var="image">
                    <div style="display: inline-block   ; width: 30%; margin: 20px 0 0 3%">
                        <center>
                            <div>
                                <a href="<c:url value='/cms/home/image/edit/${image.id}'/>"><spring:message code="general.edit"/></a>
                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                <a href="#modal${image.id}" data-toggle="modal" data-target="#modal${image.id}" ><spring:message code="general.delete"/></a>
                            </div>
                            <div>
                                <img style="width: 330px; height: 200px" src="${image.base64}" />
                            </div>
                        </center>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <br>
    <h5><a href="<c:url value='/cms/home/image/new' />"><spring:message code="general.new"/></a></h5>
</div>

<c:forEach items="${listImages}" var="image">
    <!-- Modal -->
    <div class="modal fade" id="modal${image.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><spring:message code="general.delete"/></h4>
                </div>
                <div class="modal-body">
                    <spring:message code="general.delete.confirmation"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="general.close"/></button>
                    <td><a href="<c:url value='/cms/home/image/delete/${image.id}'/>"><spring:message code="general.delete"/></a></td>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

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