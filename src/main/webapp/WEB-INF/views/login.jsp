<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/login" var="loginUrl"/>
<div class="row" style="padding-top: 70px">
    <div class="col-md-4 col-md-push-4">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Log-in</h3>
            </div>
            <div class="panel-body">
                <form action="${loginUrl}" method="post" data-toggle="validator">
                    <c:if test="${param.error != null}">        
                        <div class="alert alert-danger">
                            <strong>Errore:</strong> Username o password non validi!
                        </div>
                    </c:if>

                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success">
                            <strong>Success:</strong> You have been logged out.
                        </div>
                    </c:if>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </div>
                            <input type="email" class="form-control" id="username" name="username" placeholder="your@email.com" required>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </div>
                            <input type="password" class="form-control" id="password" name="password" placeholder="password" required>
                        </div>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-default">Accedi</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-push-7">
                <a href="${pageContext.request.contextPath}/">Continua come ospite...</a>
            </div>
        </div>
    </div>
</div>
