<navbar class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bar-to-collapse" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img src="${pageContext.request.contextPath}/resources/images/hospital-logo.png" style="max-width: 150px">  
        </div>
        <div class="collapse navbar-collapse" id="bar-to-collapse">
            <ul class="nav navbar-nav navbar-right">
                <%--<li>
                    <sec:authorize access="isAuthenticated()">
                        <a><jsp:include page="logoutFragment.jsp" /></a>
                    </sec:authorize>
                </li>--%>
            </ul>
        </div>
    </div>
</navbar>