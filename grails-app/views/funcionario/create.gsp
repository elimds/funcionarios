<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-funcionario" class="content scaffold-create" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagem" class="message alert" role="status" style="display: block;">${flash.message}</div>
					</g:if>
					<div class="top-bar">
						<h3><i class="icon-plus"></i> Incluir Funcionários</h3>
					</div>
					<g:hasErrors bean="${funcionarioInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${funcionarioInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:funcionarioInstance, action:'save']" class="form-horizontal">
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
