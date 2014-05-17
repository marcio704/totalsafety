<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <br />
        <div class="col-md-12">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading"><strong><spring:message code="company.user.list"/></strong></div>

                <!-- Table -->
                <table class="table table-bordered table-responsive table-condensed table-hover">
                    <th>
                    <tr>
                        <td><strong><spring:message code="company.user.name"/></strong></td>
                        <td><strong><spring:message code="company.user.email"/></strong></td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    </th>
                    <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td><a href="<c:url value='/cms/user/edit/${user.id}'/>"><spring:message code="general.edit"/></a></td>
                                <td><a href="#modal${user.id}" data-toggle="modal" data-target="#modal${user.id}" ><spring:message code="general.delete"/></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfooter>
                        <td><strong><spring:message code="company.user.name"/></strong></td>
                        <td><strong><spring:message code="company.user.email"/></strong></td>
                        <td colspan="2">&nbsp;</td>
                    </tfooter>
                </table>
            </div>
        </div>
    </div>
    <br>
    <h5><a href="<c:url value='/cms/user/new' />"><spring:message code="general.new"/></a></h5>
</div>

<c:forEach items="${userList}" var="user">
    <!-- Modal -->
    <div class="modal fade" id="modal${user.id}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><spring:message code="general.delete"/></h4>
                </div>
                <div class="modal-body">
                    <spring:message code="general.delete.confirmation"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="general.close"/></button>
                    <a href="<c:url value='/cms/user/delete/${user.id}'/>"><spring:message code="general.delete"/></a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>