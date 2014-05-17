<%@ taglib uri="http://tiles.apache.org/tags-tiles"         prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>


<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title><spring:message code="company.login.page.title" /></title>

        <!-- Core CSS - Include with every page -->
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.css" />" rel="stylesheet">

        <!-- SB Admin CSS - Include with every page -->
        <link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

        <!-- Bootstrap core CSS -->
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">


        <!-- Add custom CSS here -->
        <link href="<c:url value="/resources/css/modern-business.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

        <!-- JavaScript -->
        <script src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
        <script src="<c:url value='/resources/js/modern-business.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap.js' />"></script>

    </head>

    <body>
        <div class="container">
            <div class="row">
                <center>
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-panel panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><spring:message code="company.login.title" /></h3>
                            </div>
                            <div class="panel-body" id="divFormLogin" style="height: 215px; overflow-y: hidden">
                                <c:url value="/login" var="url"/>
                                <form:form role="form" action="${url}" method="post" commandName="user" >
                                    <div class="alert alert-danger alert-dismissable">
                                        <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <strong id="frmErrorsName"><form:errors path="name"/></strong><br />
                                        <strong id="frmErrorsPwd"><form:errors path="password"/></strong>
                                    </div>
                                    <fieldset>
                                        <div class="form-group">
                                            <spring:message code="company.login.name" var="nameLogin"/>
                                            <form:input class="form-control" placeholder="${nameLogin}" path="name" />
                                        </div>
                                        <div class="form-group">
                                            <spring:message code="company.login.password" var="pwdLogin"/>
                                            <form:input class="form-control" placeholder="${pwdLogin}" path="password" type="password" />
                                        </div>
                                        <!-- Change this to a button or input when using this as a form -->
                                        <button type="submit" class="btn btn-lg btn-primary btn-block"><spring:message code="general.submit"/></button>
                                    </fieldset>
                                    <br />
                                </form:form>
                                <!--</form>-->
                                <c:url value="/user/forgot" var="forgotPwd"/>
                                <a href="${forgotPwd}" target="_blank" ><spring:message code="general.forgot.password"/></a>
                            </div>
                        </div>
                    </div>
                </center>
            </div>
        </div>

        <!-- Core Scripts - Include with every page -->
        <script src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/plugins/metisMenu/jquery.metisMenu.js' />"></script>

        <!-- SB Admin Scripts - Include with every page -->
        <script src="<c:url value='/resources/js/sb-admin.js' />"></script>

    </body>

    <script>
        jQuery(document).ready(function() {
            if (jQuery("#frmErrorsName").html() === "" && jQuery("#frmErrorsPwd").html() === "") {
                jQuery("#closeAlertBtn").click();
            }
        });
    </script>
</html>
