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
                                <h3 class="panel-title"><spring:message code="general.forgot.password" /></h3>
                            </div>
                            <div class="panel-body" id="divFormLogin">
                                <c:url value="/user/forgot" var="url"/>
                                <form:form role="form" action="${url}" method="post" commandName="user" >
                                    <div class="alert alert-danger alert-dismissable">
                                        <button id="closeAlertBtn" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <strong id="frmErrors"><form:errors path="email"/></strong>
                                    </div>
                                    <c:if test="${successMsg != null && !successMsg.isEmpty()}">
                                        <div class="alert alert-success alert-dismissable">
                                            <button id="successMsg" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>${successMsg}</strong>
                                        </div>
                                    </c:if>
                                    <fieldset>
                                        <div class="form-group">
                                            <spring:message code="company.user.email.enter" var="enterEmail"/>
                                            <form:input class="form-control" placeholder="${enterEmail}" path="email" />
                                        </div>
                                        <button type="submit" class="btn btn-lg btn-primary btn-block"><spring:message code="general.submit"/></button>
                                    </fieldset>
                                </form:form>
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
            if (jQuery("#frmErrors").html() === "") {
                jQuery("#closeAlertBtn").click();
            }
        });
        jQuery("#forgotPassLink").click(function() {
            var divHeight;
            if (jQuery("#divFormLogin").css("height") === "215px") {
                divHeight = "350px";
            } else {
                divHeight = "215px";
            }
            jQuery("#divFormLogin").animate(
                    {"height": divHeight},
            "slow");
        });
    </script>
</html>
