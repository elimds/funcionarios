<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-user" class="content scaffold-create" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div class="alert" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${userInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${userInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<div class="top-bar">
						<h3><i class="icon-plus"></i> Incluir Usuário</h3>
					</div>
					
					<g:form url="[resource:userInstance, action:'save']" class="form-horizontal">
						<g:render template="form"/>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
