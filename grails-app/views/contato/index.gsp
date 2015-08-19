
<%@ page import="funcionarios.Contato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contato.label', default: 'Contato')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contato" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="contato.funcionario.label" default="Funcionario" /></th>
					
						<g:sortableColumn property="tipo" title="${message(code: 'contato.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'contato.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contatoInstanceList}" status="i" var="contatoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contatoInstance.id}">${fieldValue(bean: contatoInstance, field: "funcionario")}</g:link></td>
					
						<td>${fieldValue(bean: contatoInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: contatoInstance, field: "valor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contatoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
