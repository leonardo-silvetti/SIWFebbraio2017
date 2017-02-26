<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
            <sec:authorize access="hasRole('ROLE_ADMIN')">
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
            </sec:authorize>
        </div>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <div class="panel-title pull-right">
                <i class="fa fa-plus" aria-hidden="true"></i>
                <a align="right" href="#" data-toggle="modal" data-target="#tipologiaModal">
                    Aggiungi nuova tipologia
                </a>
            </div>
        </sec:authorize>
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="tipologieTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th>Dettagli</th>
                    <th>Nome</th>
                    <th>Codice</th>
                    <th>Descrizione:</th>
                    <th>Costo</th>
                    <th>Indicatori:</th>
                    <th>Prerequisiti:</th>
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
                            <a class="confirmation" href="${pageContext.request.contextPath}/esami/tipologie/delete?id=${tipologia.id}">
                                <span class="glyphicon glyphicon-remove"></span>
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
                <form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/esami/tipologie/save" commandName="tipologiaBean">
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-file-text fa-lg"></i></div>
                                <form:input path="nome" id="nome" type="text" class="form-control" placeholder="Nome" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-bars fa-lg"></i></div>
                                <form:input path="codice" id="codice" type="text" class="form-control" placeholder="Codice" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-list fa-lg"></i></div>
                                <form:input path="descrizione" id="descrizione" type="text" class="form-control" placeholder="Descrizione" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-eur fa-lg"></i></div>
                                <form:input path="costo" id="costo" type="text" class="form-control" placeholder="Costo" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
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
                <form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/esami/indicatori/save" commandName="indicatoreBean">
                    <div class="form-group has-feedback">      
                        <label for="nome">Inserisci il nome del nuovo indicatore:</label>
                        <form:input path="nome" class="form-control" id="nome" required="true"/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="selectTipologia">Scegli a quale tipologia associare questo indicatore:</label>
                        <form:select id="selectTipologia" path="tipologiaEsame.id" class="form-control" style="width: 75%" required="true">
                            <form:options items="${listaTipologie}" itemLabel="nome" itemValue="id"></form:options>
                        </form:select>
                        <div class="help-block with-errors"></div>
                    </div>
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
                <form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/esami/prerequisiti/save" commandName="prerequisitoBean">
                    <div class="form-group has-feedback">      
                        <label>Inserisci nome e valore del nuovo prerequisito:</label>
                        <form:input path="nome" class="form-control" id="nome" placeholder="Nome" required="true"/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <form:input path="valore" class="form-control" id="valore" placeholder="Valore" required="true"/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <label for="selectTipologia">Scegli a quale tipologia associare questo prerequisito:</label>
                        <form:select id="selectTipologia" path="tipologiaEsame.id" class="form-control" style="width: 75%" required="true">
                            <form:options items="${listaTipologie}" itemLabel="nome" itemValue="id"></form:options>
                        </form:select>
                    </div>
                    <button type="submit" class="btn btn-success">Salva</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.confirmation').on('click', function () {
            return confirm('ATTENZIONE!\n'+
                'Eliminando questa tipologia verranno eliminati anche tutti gli esami associati.\n'+
                'Sei sicuro?');
        });
        $('#tipologieTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"className": 'none', "targets": [3, 5, 6]},
                {"orderable": false, "targets": [0, 2, 3, 4, 5, 6, 7]}
            ]
        });
        $('select').select2();
    });
</script>
