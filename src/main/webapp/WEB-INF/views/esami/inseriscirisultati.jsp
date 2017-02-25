<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div style="margin-top: 0px" class="page-header">
    <h1 style="margin-top: 0px">
        Inserisci risultati esame<br>
        <small>
            ${esame.paziente.nome}&ensp;${esame.paziente.cognome}
            &ensp;-&ensp;
            ${esame.tipologiaEsame.nome}
        </small>
    </h1>
</div>
<div class="row">
    <div class="col-md-4 col-sm-6 col-xs-6">
        <c:forEach var="indicatore" items="${esame.tipologiaEsame.indicatori}">
            <div class="form-group">
                <input style="font-weight: bold" class="form-control" type="text" value="${indicatore.nome}" readonly>
            </div>
        </c:forEach>
    </div>
    <div class="col-md-4 col-sm-6 col-xs-6">
    <form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/esami/risultati/save" modelAttribute="risultatiBean">
        <c:forEach items="${risultatiBean.risultati}" varStatus="r">
            <div class="form-group has-feedback">   
                <form:input class="form-control" path="risultati[${r.index}].risultato" type="text" required="true"/>
                <form:input type="hidden" path="risultati[${r.index}].indicatoreEsame.id"/>
                <form:input type="hidden" path="risultati[${r.index}].esame.id"/>
                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            </div>  
        </c:forEach>
        <button class="pull-right btn btn-success" type="submit">Salva</button>
    </form:form>
    </div>
</div>

