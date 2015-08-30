
<%@ page import="funcionarios.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-user" class="content scaffold-show" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagem" class="message alert" role="status" style="display: block;">${flash.message}</div>
					</g:if>
					<div class="top-bar">
						<h3><i class="icon-user"></i> Usuário</h3>
					</div>
					<div class="well no-padding">
						<div class="control-group span12 sem-margin-left">
							<label class="control-label">Usuário: </label>
							<div class="controls"><g:fieldValue bean="${userInstance}" field="login"/></div>
						</div>
						<div class="control-group span12 sem-margin-left">
							<label class="control-label">Nome: </label>
							<div class="controls"><g:fieldValue bean="${userInstance}" field="name"/></div>
						</div>
						<div class="control-group span12 sem-margin-left">
						<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
							<div class="form-actions">
								<g:if test="${session?.user?.login == "admin" || userInstance?.id == session?.user?.id }">
									<g:link class="btn btn-primary" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>&nbsp;&nbsp;
								</g:if>
								<g:if test="${session?.user?.login == "admin" && userInstance?.login != "admin" }">
									<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</g:if>
							</div>
						</g:form>
						</div>
				</div>
			</div>
		</div>
	</body>
</html>
