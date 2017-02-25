<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                    <th>Paziente</th>
                    <th>Medico</th>
                    <th>Tipologia Esame</th>
                    <th>Data e Orario</th>
                    <th>Prenotato il</th>
                    <th class="all"></th>
                    <th class="all"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="esame" items="${listaEsami}">
                    <tr> 
                        <td>${esame.paziente.nome}&ensp;${esame.paziente.cognome}</td>
                        <td>${esame.medico.nome}&ensp;${esame.medico.cognome}</td>
                        <td>${esame.tipologiaEsame.nome}</td>
                        <td><fmt:formatDate type="both" value="${esame.dataSvolgimento}"/></td>
                        <td><fmt:formatDate type="date" value="${esame.dataPrenotazione}"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/esami/risultati/new?id=${esame.id}">
                                <span class="glyphicon glyphicon-open-file"></span>
                            </a>
                        </td>
                    </tr> 
                </c:forEach>                 
            </tbody>
        </table>
    </div>
</div>

<a href="${pageContext.request.contextPath}/esami/appuntamenti/new">Nuovo esame</a>

<script>
   $(document).ready(function () {
        $('#esamiTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                {"orderable": false, "targets": [2, 3, 4, 5, 6]}
            ]
        });
    }); 
</script>

