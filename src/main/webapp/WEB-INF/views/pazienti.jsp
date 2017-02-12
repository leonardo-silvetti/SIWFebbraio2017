<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title pull-left">Pazienti</div>
        <div class="panel-title pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i>
            <a align="right" href="${pageContext.request.contextPath}/pazienti/nuovoPaziente">
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
                            <a href="${pageContext.request.contextPath}/interviewManager/deleteInterview?id=${interview.id}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/interviewManager/updateInterview?id=${interview.id}">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
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
