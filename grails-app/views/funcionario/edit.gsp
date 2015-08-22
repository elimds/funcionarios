<%@ page import="funcionarios.Funcionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-funcionario" class="content scaffold-edit" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagemEditFunc" class="alert" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${funcionarioInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${funcionarioInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<div class="top-bar">
						<h3><i class="icon-pencil"></i> Editar Funcionário</h3>
					</div>
					<g:form url="[resource:funcionarioInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${funcionarioInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
