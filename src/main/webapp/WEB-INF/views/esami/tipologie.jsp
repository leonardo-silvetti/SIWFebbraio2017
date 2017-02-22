<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
    .chip {
        display: inline-block;
        padding: 0 25px;
        margin-bottom: 5px;
        height: 25px;
        font-size: 14px;
        line-height: 25px;
        border-radius: 25px;
        background-color: #f1f1f1;
    }
</style>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title pull-left">Tipologie Esami
            &ensp;
            <i class="fa fa-plus-circle" aria-hidden="true"></i>
            <a align="right" href="#" data-toggle="modal" data-target="#indicatoreModal">
                Aggiungi indicatore
            </a>
            &ensp;
            <i class="fa fa-plus-circle" aria-hidden="true"></i>
            <a align="right" href="#" data-toggle="modal" data-target="#prerequisitoModal">
                Aggiungi prerequisito
            </a>
        </div>
        <div class="panel-title pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i>
            <a align="right" href="#" data-toggle="modal" data-target="#tipologiaModal">
                Aggiungi nuova tipologia
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="tipologieTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th></th>
                    <th>Nome</th>
                    <th>Codice</th>
                    <th>Descrizione</th>
                    <th>Costo</th>
                    <th>Indicatori:</th>
                    <th>Prerequisiti:</th>
                    <th class="all"></th>
                    <th class="all"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tipologia" items="${listaTipologie}">
                    <tr> 
                        <td></td>
                        <td>${tipologia.nome}</td>
                        <td>${tipologia.codice}</td>
                        <td>${tipologia.descrizione}</td>
                        <td>${tipologia.costo}</td>
                        <td>
                            <c:forEach var="indicatore" items="${tipologia.indicatori}">
                                <div class="chip">${indicatore.nome}</div>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="prerequisito" items="${tipologia.prerequisiti}">
                                <br><div class="chip">${prerequisito.nome}</div>
                                &ensp;${prerequisito.valore}
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/esami/tipologie/delete?id=${tipologia.id}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/esami/tipologie/update?id=${tipologia.id}">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
    </div>
</div>

<!-- Modal nuova tipologia-->
<div id="tipologiaModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Inserisci dati nuova tipologia</h4>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="${pageContext.request.contextPath}/esami/tipologie/save" commandName="tipologiaBean">
                    <div class="form-group-lg">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-file-text fa-lg"></i></div>
                                <form:input path="nome" id="nome" type="text" class="form-control" placeholder="Nome"/>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-bars fa-lg"></i></div>
                                <form:input path="codice" id="codice" type="text" class="form-control" placeholder="Codice"/>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-list fa-lg"></i></div>
                                <form:input path="descrizione" id="descrizione" type="text" class="form-control" placeholder="Descrizione"/>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-eur fa-lg"></i></div>
                                <form:input path="costo" id="costo" type="text" class="form-control" placeholder="Costo"/>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success">Salva</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<!--Modal indicatore-->
<div id="indicatoreModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Nuovo indicatore per i risultati</h4>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="${pageContext.request.contextPath}/esami/indicatori/save" commandName="indicatoreBean">
                    <div class="form-group">      
                        <label for="nome">Inserisci il nome del nuovo indicatore:</label>
                        <form:input path="nome" class="form-control" id="nome"/>
                        <br> 
                        <label for="selectTipologia">Scegli a quale tipologia associare questo indicatore:</label>
                        <br>
                        <form:select id="selectTipologia" path="tipologiaEsame.id" class="form-control" style="width: 75%" required="true">
                            <form:options items="${listaTipologie}" itemLabel="nome" itemValue="id"></form:options>
                        </form:select>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success">Salva</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<!--Modal prerequisito-->
<div id="prerequisitoModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Nuovo prerequisito per l'esame</h4>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="${pageContext.request.contextPath}/esami/prerequisiti/save" commandName="prerequisitoBean">
                    <div class="form-group">      
                        <label>Inserisci nome e valore del nuovo prerequisito:</label>
                        <form:input path="nome" class="form-control" id="nome" placeholder="Nome"/>
                        <br>
                        <form:input path="valore" class="form-control" id="valore" placeholder="Valore"/>
                        <br><br>
                        <label for="selectTipologia">Scegli a quale tipologia associare questo prerequisito:</label>
                        <br>
                        <form:select id="selectTipologia" path="tipologiaEsame.id" class="form-control" style="width: 75%" required="true">
                            <form:options items="${listaTipologie}" itemLabel="nome" itemValue="id"></form:options>
                        </form:select>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success">Salva</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#tipologieTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"className": 'none', "targets": [3, 5, 6]},
                {"orderable": false, "targets": [0, 2, 3, 4, 5, 6, 7, 8]}
            ]
        });
        $('select').select2();
    });
</script>
