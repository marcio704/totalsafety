<%@ taglib uri="http://java.sun.com/jsp/jstl/core"          prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"        prefix="spring"%>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                <small><spring:message code="general.search.results"/></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<c:url value='/'/>"><spring:message code='home'/></a>
                </li>
                <li class="active"><spring:message code="general.search.label"/></li>
            </ol>
        </div>
    </div>
    <div id="page-content" style="margin-top: -30px;">
        <div class='post-body entry-content'>
            <div id="cse" style="width: 100%;">
                <ul id="loadbar">
                    <li><div class="bar" id="layerFill1"></div></li>
                    <li><div class="bar" id="layerFill2"></div></li>
                    <li><div class="bar" id="layerFill3"></div></li>
                    <li><div class="bar" id="layerFill4"></div></li>
                    <li><div class="bar" id="layerFill5"></div></li>
                    <li><div class="bar" id="layerFill6"></div></li>
                    <li><div class="bar" id="layerFill7"></div></li>
                    <li><div class="bar" id="layerFill8"></div></li>
                </ul>
            </div>
            <script src="http://www.google.com/jsapi" type="text/javascript"></script>
            <script type="text/javascript">
                google.load('search', '1', {language: 'en', style: google.loader.themes.V2_DEFAULT});
                google.setOnLoadCallback(function() {
                    var customSearchOptions = {};
                    var orderByOptions = {};
                    orderByOptions['keys'] = [{label: 'Relevance', key: ''}, {label: 'Date', key: 'date'}];
                    customSearchOptions['enableOrderBy'] = true;
                    customSearchOptions['orderByOptions'] = orderByOptions;
                    var imageSearchOptions = {};
                    imageSearchOptions['layout'] = google.search.ImageSearch.LAYOUT_COLUMN;
                    customSearchOptions['enableImageSearch'] = true;
                    customSearchOptions['imageSearchOptions'] = imageSearchOptions;
                    var googleAnalyticsOptions = {};
                    googleAnalyticsOptions['queryParameter'] = 's';
                    googleAnalyticsOptions['categoryParameter'] = '';
                    customSearchOptions['googleAnalyticsOptions'] = googleAnalyticsOptions;
                    var customSearchControl = new google.search.CustomSearchControl(
                            '008295403780974825624:tj11nvaon2k', customSearchOptions);
                    customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
                    var options = new google.search.DrawOptions();
                    options.setAutoComplete(true);
                    options.enableSearchResultsOnly();
                    customSearchControl.draw('cse', options);
                    function parseParamsFromUrl() {
                        var params = {};
                        var parts = window.location.search.substr(1).split('\x26');
                        for (var i = 0; i < parts.length; i++) {
                            var keyValuePair = parts[i].split('=');
                            var key = decodeURIComponent(keyValuePair[0]);
                            params[key] = keyValuePair[1] ?
                                    decodeURIComponent(keyValuePair[1].replace(/\+/g, ' ')) :
                                    keyValuePair[1];
                        }
                        return params;
                    }
                    var urlParams = parseParamsFromUrl();
                    var queryParamName = "s";
                    if (urlParams[queryParamName]) {
                        customSearchControl.execute(urlParams[queryParamName]);
                    }
                }, true);
                jQuery(document).ready(function(){
                   jQuery("#adBlock").css("display", "none"); 
                   jQuery(".gsc-adBlock").css("display", "none"); 
                   
                });
            </script>
            <div style='clear: both;'></div>
        </div>
    </div>
</div>