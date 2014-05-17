<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"    prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div style="margin: 5px">
                    <form:form action="about" modelAttribute="about" method="post" enctype="multipart/form-data">
                        <form:hidden path="id" />
                        <form:hidden path="img" />
                        <div class="form-group">
                            <label for="text"><spring:message code="company.about.edit.text"/>:</label>
                            <spring:message code="company.about.edit.text.enter" var="enterText"/>
                            <form:textarea rows="5" path="text" class="form-control" id="text" placeholder="${enterText}" />
                        </div>
                        <label for="seletedImg"><spring:message code="company.about.edit.image"/> (750x450):</label>
                        <div class="form-group">
                            <div id="seletedImg">
                                <img src="${about.img}" style="width: 75px; height: 45px; margin-left: 20px;">
                            </div>
                            <div>
                                <input id="fileBtn" type="file" name="imageUpload"/>
                                <p class="help-block"><spring:message code="company.about.image.alert"/></p>
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
                <div class="panel-heading"><strong><spring:message code="company.about.team.list"/></strong></div>

                <c:forEach items="${employeeList}" var="employee">
                    <div style="display: inline-block; width: 30%; margin: 20px 0 0 3%">
                        <center>
                            <div>
                                <a href="<c:url value='/cms/employee/edit/${employee.id}'/>"><spring:message code="general.edit"/></a>
                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                <a href="#modal${employee.id}" data-toggle="modal" data-target="#modal${employee.id}" ><spring:message code="general.delete"/></a>
                            </div>
                            <div>
                                <img style="width: 215px; height: 215px" src="${employee.image}" />
                            </div>
                        </center>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <br>
    <h5><a href="<c:url value='/cms/employee/new' />"><spring:message code="general.new"/></a></h5>
</div>

<c:forEach items="${employeeList}" var="employee">
    <!-- Modal -->
    <div class="modal fade" id="modal${employee.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <td><a href="<c:url value='/cms/employee/delete/${employee.id}'/>"><spring:message code="general.delete"/></a></td>
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