<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title pull-left">Pazienti</div>
        <div class="panel-title pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i>
            <a align="right" href="#" data-toggle="modal" data-target="#pazienteModal">
                Inserisci paziente
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="pazientiTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Indirizzo</th>
                    <th>Codice Fiscale</th>
                    <th class="all"></th>
                    <th class="all"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="paziente" items="${listaPazienti}">
                    <tr> 
                        <td>${paziente.nome}</td>
                        <td>${paziente.cognome}</td>
                        <td>${paziente.indirizzo}</td>
                        <td>${paziente.codiceFiscale}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/pazienti/delete?id=${paziente.id}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/pazienti/update?id=${paziente.id}">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
    </div>
</div>

<!-- Modal -->
<div id="pazienteModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Inserisci dati paziente</h4>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="${pageContext.request.contextPath}/pazienti/save" commandName="pazienteBean">
                    <div class="form-group-lg">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-user fa-lg"></i></div>
                                <form:input path="nome" id="nome" type="text" class="form-control" placeholder="Nome"/>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-user-o fa-lg"></i></div>
                                <form:input path="cognome" id="cognome" type="text" class="form-control" placeholder="Cognome"/>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-map-marker fa-lg"></i></div>
                                <form:input path="indirizzo" id="indirizzo" type="text" class="form-control" placeholder="Indirizzo"/>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-address-card fa-lg"></i></div>
                                <form:input path="codiceFiscale" id="codiceFiscale" type="text" class="form-control" placeholder="Codice Fiscale"/>
                        </div>
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

        $('#pazientiTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                //{"className": 'none', "targets": [1, 5, 6, 7]},
                {"orderable": false, "targets": [0, 2, 3, 4, 5]}
            ]
        });
    });
</script>
