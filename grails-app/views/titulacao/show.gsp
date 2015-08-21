
<%@ page import="funcionarios.Titulacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'titulacao.label', default: 'Titulacao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-titulacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-titulacao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list titulacao">
			
				<g:if test="${titulacaoInstance?.cargaHoraria}">
				<li class="fieldcontain">
					<span id="cargaHoraria-label" class="property-label"><g:message code="titulacao.cargaHoraria.label" default="Carga Horaria" /></span>
					
						<span class="property-value" aria-labelledby="cargaHoraria-label"><g:fieldValue bean="${titulacaoInstance}" field="cargaHoraria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${titulacaoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="titulacao.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${titulacaoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${titulacaoInstance?.funcionarios}">
				<li class="fieldcontain">
					<span id="funcionarios-label" class="property-label"><g:message code="titulacao.funcionarios.label" default="Funcionarios" /></span>
					
						<g:each in="${titulacaoInstance.funcionarios}" var="f">
						<span class="property-value" aria-labelledby="funcionarios-label"><g:link controller="funcionarioTitulacao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${titulacaoInstance?.grau}">
				<li class="fieldcontain">
					<span id="grau-label" class="property-label"><g:message code="titulacao.grau.label" default="Grau" /></span>
					
						<span class="property-value" aria-labelledby="grau-label"><g:fieldValue bean="${titulacaoInstance}" field="grau"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${titulacaoInstance?.instituicao}">
				<li class="fieldcontain">
					<span id="instituicao-label" class="property-label"><g:message code="titulacao.instituicao.label" default="Instituicao" /></span>
					
						<span class="property-value" aria-labelledby="instituicao-label"><g:fieldValue bean="${titulacaoInstance}" field="instituicao"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:titulacaoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${titulacaoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
