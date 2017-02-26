<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="/logout" var="logoutUrl" />

<navbar class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bar-to-collapse" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img src="${pageContext.request.contextPath}/resources/images/hospital-logo.png" style="max-width: 150px">  
        </div>
        <div class="collapse navbar-collapse" id="bar-to-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:authorize access="isAnonymous()">
                        <a href="${pageContext.request.contextPath}/login.html">
                            <button class="btn btn-success">login</button>
                        </a>
                    </sec:authorize>
                </li>
                <li>
                    <sec:authorize access="isAuthenticated()">
                        <a>
                            <form action="${logoutUrl}" method="POST">
                                <input class="btn btn-info" type="submit" value="logout" />
                                <input type="hidden"                        
                                       name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                            </form>
                        </a>
                    </sec:authorize>
                </li>
            </ul>
        </div>
    </div>
</navbar>