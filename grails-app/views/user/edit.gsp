<%@ page import="funcionarios.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagem" class="alert" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${userInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${userInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<div class="top-bar">
						<h3><i class="icon-pencil"></i> Editar Usuário</h3>
					</div>
		
					<g:form url="[resource:userInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${userInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
