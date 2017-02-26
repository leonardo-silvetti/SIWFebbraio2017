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
                    <th>Email</th>
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
                        <td>${paziente.email}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/pazienti/delete?id=${paziente.id}" class="confirmation">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
    </div>
</div>

<!-- Modal inserimento-->
<div id="pazienteModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Inserisci dati paziente</h4>
            </div>
            <div class="modal-body">
                <form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/pazienti/save" commandName="pazienteBean">
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-user fa-lg"></i></div>
                                <form:input path="nome" id="nome" type="text" class="form-control" placeholder="Nome" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-user-o fa-lg"></i></div>
                                <form:input path="cognome" id="cognome" type="text" class="form-control" placeholder="Cognome" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-map-marker fa-lg"></i></div>
                                <form:input path="indirizzo" id="indirizzo" type="text" class="form-control" placeholder="Indirizzo" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-address-card fa-lg"></i></div>
                                <form:input path="codiceFiscale" id="codiceFiscale" type="text" class="form-control" placeholder="Codice Fiscale" required="true"/>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-envelope fa-lg"></i></div>
                                <form:input type ="email" path="email" class="form-control" id="email" placeholder="your@email.com"
                                            data-error="Email non valida, controlla la @ e il dominio!" pattern="[^@\s]+@[^@\s]+\.[^@\s]+"/>
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

<script>
    $(document).ready(function () {
        
        $('.confirmation').on('click', function () {
            return confirm('ATTENZIONE!\n'+
                'Eliminando il paziente verranno eliminati anche tutti gli esami a lui associati.\n'+
                'Sei sicuro?');
        });
        $('#pazientiTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"orderable": false, "targets": [2, 3, 4, 5]}
            ]
        });
    });
</script>
