<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="well" style="text-align: center">
    <c:choose>
        <c:when test="${userPrincipal!=null}">
            Benvenuto <strong>${userPrincipal.nome}</strong>!
        </c:when>
        <c:when test="${userPrincipal==null}">
            <strong>Utente non registrato</strong>
        </c:when>
    </c:choose>
</div>

<div class="well">
    <ul class="nav nav-pills nav-stacked" id="sidebar">
        <li id="home">
            <a href="${pageContext.request.contextPath}/">
                <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp;<strong>Home</strong>
            </a>
        </li>

        <sec:authorize access="hasRole('ROLE_PAZ')">
            <li id="listaesami">  
                <a href="${pageContext.request.contextPath}/esami/imieiesami/show?id=${userPrincipal.id}">
                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                    &nbsp;<strong>I miei esami</strong>
                </a>
            </li>
        </sec:authorize>
            
        <li id="listatipologie">  
            <a href="${pageContext.request.contextPath}/esami/tipologie/show">
                <i class="fa fa-file-archive-o" aria-hidden="true"></i>
                &nbsp;<strong>Tipologie esami</strong>
            </a>
        </li>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li id="nuovatipologia">  
                <a href="${pageContext.request.contextPath}/esami/appuntamenti/show">
                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                    &nbsp;<strong>Prenotazioni</strong>
                </a>
            </li>

            <li id="medici">  
                <a href="${pageContext.request.contextPath}/medici/show">
                    <i class="fa fa-user-md" aria-hidden="true"></i>
                    &nbsp;<strong>Personale medico</strong>
                </a>
            </li>

            <li id="pazienti">
                <a href="${pageContext.request.contextPath}/pazienti/show">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    &nbsp;<strong>Pazienti</strong>
                </a>
            </li>
        </sec:authorize>
    </ul>
</div>