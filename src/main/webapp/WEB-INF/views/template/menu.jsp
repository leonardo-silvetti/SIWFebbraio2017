<div class="well">
    <ul class="nav nav-pills nav-stacked" id="sidebar">
        <li id="home">
            <a href="${pageContext.request.contextPath}/">
                <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp;<strong>Home</strong>
            </a>
        </li>
        
        <li style="color:#006bb3">
            <i class="fa fa-file-text" aria-hidden="true"></i>
            &nbsp;<strong>Esami</strong>
        </li>
        <li id="listaesami">  
            <a href="${pageContext.request.contextPath}/esami/tipologie/show">
                &nbsp;Consulta tipologie esami
            </a>
        </li>
        
        <li id="nuovatipologia">  
            <a href="${pageContext.request.contextPath}/">
                &nbsp;Aggiungi tipologia esame
            </a>
        </li>
        
        <li id="nuovoesame">  
            <a href="${pageContext.request.contextPath}/">
                &nbsp;Aggiungi nuovo esame
            </a>
        </li>
        
        <li id="nuovirisultati">  
            <a href="${pageContext.request.contextPath}/">
                &nbsp;Inserisci risultati esame
            </a>
        </li>
        
        <li id="risultati">  
            <a href="${pageContext.request.contextPath}/">
                &nbsp;Consulta risultati esame
            </a>
        </li>
        
        <li id="medici">  
            <a href="${pageContext.request.contextPath}/medici/show">
                <i class="fa fa-user-md" aria-hidden="true"></i>
                &nbsp;<strong>Personale medico</strong>
            </a>
        </li>
        
        <li id="pazienti">
            <a href="${pageContext.request.contextPath}/pazienti/show">
                <i class="fa fa-user" aria-hidden="true"></i>
                &nbsp;<strong>Pazienti</strong>
            </a>
        </li>
    </ul>
</div>