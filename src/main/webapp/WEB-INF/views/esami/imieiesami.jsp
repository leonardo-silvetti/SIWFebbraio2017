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
        <div class="panel-title pull-left">I miei esami - 
            <strong>${userPrincipal.nome}&ensp;${userPrincipal.cognome}</strong>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="esamiTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th>Risultati</th>
                    <th>Medico</th>
                    <th>Tipologia Esame</th>
                    <th>Data e Orario</th>
                    <th>Prenotato il</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="esame" items="${listaEsamiPaziente}">
                    <tr>
                        <td></td>
                        <td>${esame.medico.nome}&ensp;${esame.medico.cognome}</td>
                        <td>${esame.tipologiaEsame.nome}</td>
                        <td><fmt:formatDate type="both" value="${esame.dataSvolgimento}"/></td>
                        <td><fmt:formatDate type="date" value="${esame.dataPrenotazione}"/></td>
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
        $('#esamiTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"className": 'none', "targets": [5]},
                {"orderable": false, "targets": [0, 3, 5]}
            ]
        });
    }); 
</script>
