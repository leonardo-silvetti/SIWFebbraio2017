<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title pull-left">Personale medico</div>
        <div class="panel-title pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i>
            <a align="right" href="#" data-toggle="modal" data-target="#medicoModal">
                Inserisci personale medico
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="mediciTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Specializzazione</th>
                    <th class="all"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="medico" items="${listaMedici}">
                    <tr> 
                        <td>${medico.nome}</td>
                        <td>${medico.cognome}</td>
                        <td>${medico.specializzazione}</td>
                        <td>
                            <a class="confirmation" href="${pageContext.request.contextPath}/medici/delete?id=${medico.id}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
    </div>
</div>

<!-- Modal -->
<div id="medicoModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Inserisci dati personale medico</h4>
            </div>
            <div class="modal-body">
                <form:form data-toggle="validator" method="POST" action="${pageContext.request.contextPath}/medici/save" commandName="medicoBean">
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
                            <div class="input-group-addon"><i class="fa fa-stethoscope fa-lg"></i></div>
                            <form:input path="specializzazione" id="specializzazione" type="text" class="form-control" placeholder="Specializzazione" required="true"/>
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
                'Eliminando il medico verranno eliminati anche tutti gli esami a lui associati.\n'+
                'Sei sicuro?');
        });
        $('#mediciTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"orderable": false, "targets": [0, 3]}
            ]
        });
    });
</script>
