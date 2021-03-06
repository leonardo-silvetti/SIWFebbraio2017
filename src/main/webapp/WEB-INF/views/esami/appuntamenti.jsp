<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
        <div class="panel-title pull-left">Appuntamenti</div>
        <div class="panel-title pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i>
            <a align="right" href="${pageContext.request.contextPath}/esami/appuntamenti/new" >
                Inserisci nuovo esame
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="esamiTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th>Risultati</th>
                    <th>Paziente</th>
                    <th>Medico</th>
                    <th>Tipologia Esame</th>
                    <th>Data e Orario</th>
                    <th>Prenotato il</th>
                    <th class="all"></th>
                    <th class="all"></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="esame" items="${listaEsami}">
                    <tr> 
                        <td></td>
                        <td>${esame.paziente.nome}&ensp;${esame.paziente.cognome}</td>
                        <td>${esame.medico.nome}&ensp;${esame.medico.cognome}</td>
                        <td>${esame.tipologiaEsame.nome}</td>
                        <td><fmt:formatDate type="both" value="${esame.dataSvolgimento}"/></td>
                        <td><fmt:formatDate type="date" value="${esame.dataPrenotazione}"/></td>
                        <td>
                            <a class="confirmation" href="${pageContext.request.contextPath}/esami/appuntamenti/delete?id=${esame.id}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/esami/risultati/new?id=${esame.id}">
                                <span class="glyphicon glyphicon-open-file"></span>
                            </a>
                        </td>
                        <td>
                            <c:forEach var="risultato" items="${esame.risultati}">
                                <br><div class="chip">${risultato.indicatoreEsame.nome}</div>
                                &ensp;${risultato.risultato}
                            </c:forEach>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
    </div>
</div>

<script>
   $(document).ready(function () {
       $('.confirmation').on('click', function () {
            return confirm('ATTENZIONE!\n'+
                'Vuoi davvero eliminare questo esame e i risultati corrispondenti?');
        });
        $('#esamiTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"className": 'none', "targets": [8]},
                {"orderable": false, "targets": [0, 4, 6, 7, 8]}
            ]
        });
    }); 
</script>

