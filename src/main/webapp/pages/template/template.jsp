<%@ page contentType="text/html;charset=UTF-8"              pageEncoding="UTF-8" %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles"         prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>


<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title><spring:message code="company.name" /></title>

        <link rel="icon" type="image/ico" href="<c:url value='/resources/images/icon.jpg' />">

        <!-- Bootstrap core CSS -->
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">


        <!-- Add custom CSS here -->
        <link href="<c:url value="/resources/css/modern-business.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

        <!-- JavaScript -->
        <script src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
        <script src="<c:url value='/resources/js/jquery.maskedinput.js' />"</script>
        <script src="<c:url value='/resources/js/modern-business.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap.js' />"></script>
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <div class="container-fluid waterMark">
            <tiles:insertAttribute name="body" />
        </div>
        <tiles:insertAttribute name="footer" />
    </body>
</html>

<script text="javascript">
    var menuArea = "navbar-fixed-top, .navbar-fixed-top";
    jQuery(document).on("click", function(event) {
        var isClosingClick = !jQuery(event.target).closest(".navbar-fixed-top").length;
        if(isClosingClick) {
            if($('#headerCollapsedMenu').is(":visible")) {
                jQuery("#btnMenuHeader").click();
            }
        }
    });
</script>