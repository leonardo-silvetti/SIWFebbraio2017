<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"></link>
        <script src="${pageContext.request.contextPath}/resources/js/validator.js"></script>
    </head>
    <body>
        <div class="container">
            <tiles:insertAttribute name="body"/>
        </div>
    </body>
</html>
