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
        <script src="<c:url value='/resources/js/jquery.maskedinput.js'/>"</script>
        <script src="<c:url value='/resources/js/modern-business.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap.js' />"></script>
        <script src="<c:url value='/resources/js/tinymce/tinymce.min.js' />"></script>
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="menu" />
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />

        <script type="text/javascript">
            tinymce.init({
                selector: "textarea",
                plugins: [
                    "advlist autolink lists link charmap print preview hr anchor pagebreak",
                    "searchreplace wordcount visualblocks visualchars code fullscreen",
                    "insertdatetime nonbreaking save table contextmenu directionality",
                    "template paste textcolor"
                ],
                toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link ",
                toolbar2: "print preview | forecolor backcolor | formatselect fontselect fontsizeselect",
                image_advtab: true,
                templates: [
                    {title: 'Test template 1', content: 'Test 1'},
                    {title: 'Test template 2', content: 'Test 2'}
                ]
            });
        </script>
    </body>
</html>