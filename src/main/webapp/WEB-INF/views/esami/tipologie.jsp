<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title pull-left">Tipologie Esami</div>
        <!--<div class="panel-title pull-right">
            <i class="fa fa-plus" aria-hidden="true"></i>
            <a align="right" href="#" data-toggle="modal" data-target="#pazienteModal">
                Inserisci paziente
            </a>
        </div>-->
        <div class="clearfix"></div>
    </div>
    <div class="panel-body">
        <table id="tipologieTable" class="table table-striped" width="100%">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Codice</th>
                    <th>Descrizione</th>
                    <th>Costo</th>
                    <th class="all"></th>
                    <th class="all"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tipologia" items="${listaTipologie}">
                    <tr> 
                        <td>${tipologia.nome}</td>
                        <td>${tipologia.codice}</td>
                        <td>${tipologia.descrizione}</td>
                        <td>${tipologia.costo}</td>
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
<script>
    /*$(document).ready(function () {

        $('#tipologieTable').dataTable({
            "order": [],
            "responsive": true,
            "scrollX": true,
            "columnDefs": [
                //{"className": 'none', "targets": [1, 5, 6, 7]},
                {"orderable": false, "targets": [0, 3, 4]}
            ]
        });
    });*/
</script>
