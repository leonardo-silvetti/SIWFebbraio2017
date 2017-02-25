<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div style="margin-top: 0px" class="page-header">
    <h1 style="margin-top: 0px">Inserisci dati esame</h1>
</div>
<form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/esami/appuntamenti/save" commandName="esameBean">          
    <div class="form-group">   
        <label for="paziente">Scegli il paziente:</label>
        <form:select id="selectPaziente" path="paziente.id" class="form-control" required="true">
            <form:options items="${listaPazienti}" itemLabel="descrizionePaziente" itemValue="id"></form:options>
        </form:select>
    </div>
    <div class="form-group">
        <label for="medico">Scegli il medico:</label>
        <form:select id="selectMedico" path="medico.id" class="form-control" required="true">
            <form:options items="${listaMedici}" itemLabel="descrizioneMedico" itemValue="id"></form:options>
        </form:select>
    </div>
    <div class="form-group">
        <label for="tipologia">Scegli la tipologia di esame:</label>
        <form:select id="selectTipologia" path="tipologiaEsame.id" class="form-control" required="true">
            <form:options items="${listaTipologie}" itemLabel="descrizioneTipologia" itemValue="id"></form:options>
        </form:select>
    </div>
    <div class="form-group has-feedback">
        <label for="date">Data esame:</label>
        <div id="datetimepicker" class="input-group date">
            <form:input path="dataSvolgimento" class="form-control" placeholder="Inserisci data" required="true"/>
            <div class="input-group-addon">
                <span class="glyphicon glyphicon-th"></span>
            </div>
        </div>
        <div class="help-block with-errors"></div>
    </div>
    <button type="submit" class="btn btn-success">Salva</button>  
</form:form>

<script>
    $('#datetimepicker').datetimepicker();
    $('select').select2();
</script>

