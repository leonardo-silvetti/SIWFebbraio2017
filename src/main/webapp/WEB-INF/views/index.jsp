<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="margin-top: 0px" class="page-header">
    <h1 style="margin-top: 0px">
        Benvenuto!<br>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <small>Sei autenticato come Amministratore</small>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_PAZ')">
            <small>Sei autenticato come Paziente</small>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <small>Stai navigando come utente ospite</small>
        </sec:authorize>
    </h1>
</div>
<sec:authorize access="isAnonymous() or hasRole('ROLE_PAZ') or hasRole('ROLE_ADMIN')">
    <p>
        Puoi consultare la lista degli esami disponibili cliccando sulla voce del menu<br>
        <strong>"Tipologia Esame"</strong><br>
        Arrivato alla lista degli esami è possibile vedere i dettagli di ogni esame cliccando "+".
    </p>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <p>
        Usando i tasti posti in cima alla tabella sarà possibile aggiungere nuovi indicatori<br>
        per i risultati, nuovi prerequisiti e nuove tipologie.<br>
    </p>
    <p>
        Cliccando sulla voce <strong>"Prenotazioni"</strong> potrai consultare la lista degli esami prenotati.<br>
        E' possibile aggiungere nuove prenotazioni grazie al tasto posto in alto a destra sulla tabella.<br>
        Il tasto (<span class="glyphicon glyphicon-open-file"></span>) posto in corrispondenza di ogni prenotazione
        permette di aggiungere i risultati corrispondenti.
    </p>
    <p>
        Le voci di menu <strong>"Personale medico"</strong> e <strong>"Pazienti"</strong> permettono di consultare,<br>
        inserire ed eliminare, attraverso appositi pulsanti, medici e pazienti.
    </p>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_PAZ')">
    <p>
        Puoi vedere gli esami che hai prenotato e i risultati cliccando su <strong>"I miei esami"</strong>
    </p>
</sec:authorize>
