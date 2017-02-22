<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.js"></script>
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"></link>
        <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet"></link>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/data-tables/datatables.min.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/data-tables/datatables.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/select2/dist/css/select2.css" rel="stylesheet"/>
        <script src="${pageContext.request.contextPath}/resources/select2/dist/js/select2.js"></script>
    </head>
    <body style="padding-top: 70px">
        <tiles:insertAttribute name="navbar"/>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <tiles:insertAttribute name="menu"/>
                </div>
                <div class="col-md-9">
                    <tiles:insertAttribute name="body"/>
                </div>
            </div>
        </div>
    </body>
</html>
