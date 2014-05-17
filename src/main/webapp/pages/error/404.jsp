<%@ taglib uri="http://tiles.apache.org/tags-tiles"         prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>


<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>404 - Not found</title>

        <!-- Bootstrap core CSS -->
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">


        <!-- Add custom CSS here -->
        <link href="<c:url value="/resources/css/modern-business.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

    </head>
    <body>
        <div class="container" id="container404">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        <small><spring:message code='error.404.title'/></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<c:url value='/'/>"><spring:message code='home'/></a></li>
                        <li class="active"><spring:message code='error.404'/></li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <center>
                        <img src="<c:url value='/resources/images/404.jpg'/>"/>
                    </center>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <p class="lead"><spring:message code='error.404.description'/></p>
                    <p><spring:message code='error.404.sugestion'/></p>
                    <ul>
                        <li><a href="<c:url value='/'/>"><spring:message code='home'/></a>
                        </li>
                        <li><a href="<c:url value='/about'/>"><spring:message code='company.about'/></a>
                        </li>
                        <li><a href="<c:url value='/services/1'/>"><spring:message code='company.services'/></a>
                        </li>
                        <li><a href="<c:url value='/contact'/>"><spring:message code='company.contact'/></a>
                        </li>
                        <li><a href="<c:url value='/portfolio/1'/>"><spring:message code='company.portfolio'/></a>
                        </li>
                    </ul>
                </div>
                <!-- /.row -->

            </div>

        </div>
        <!-- /.container -->

        <!-- JavaScript -->
        <script src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
        <script src="<c:url value='/resources/js/modern-business.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap.js' />"></script>
    </body>
</html>
