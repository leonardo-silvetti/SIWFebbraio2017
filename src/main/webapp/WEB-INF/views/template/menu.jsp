<div class="well">
    <ul class="nav nav-pills nav-stacked" id="sidebar">
        <li id="home">
            <a href="${pageContext.request.contextPath}/">
                <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp;<strong>Home</strong>
            </a>
        </li>
        <li id="listaesami">  
            <a href="${pageContext.request.contextPath}/esami/tipologie/show">
                <i class="fa fa-file-archive-o" aria-hidden="true"></i>
                &nbsp;<strong>Consulta tipologie esami</strong>
            </a>
        </li>
        
        <li id="nuovatipologia">  
            <a href="${pageContext.request.contextPath}/esami/appuntamenti/show">
                <i class="fa fa-list-alt" aria-hidden="true"></i>
                &nbsp;<strong>Consulta Prenotazioni</strong>
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