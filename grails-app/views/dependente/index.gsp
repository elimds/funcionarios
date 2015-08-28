
<%@ page import="funcionarios.Dependente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dependente.label', default: 'Dependente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dependente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dependente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="identidade" title="${message(code: 'dependente.identidade.label', default: 'Identidade')}" />
					
						<g:sortableColumn property="cpf" title="${message(code: 'dependente.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="dataNascimento" title="${message(code: 'dependente.dataNascimento.label', default: 'Data Nascimento')}" />
					
						<th><g:message code="dependente.funcionario.label" default="Funcionario" /></th>
					
						<g:sortableColumn property="nome" title="${message(code: 'dependente.nome.label', default: 'Nome')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dependenteInstanceList}" status="i" var="dependenteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dependenteInstance.id}">${fieldValue(bean: dependenteInstance, field: "identidade")}</g:link></td>
					
						<td>${fieldValue(bean: dependenteInstance, field: "cpf")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${dependenteInstance.dataNascimento}" /></td>
					
						<td>${fieldValue(bean: dependenteInstance, field: "funcionario")}</td>
					
						<td>${fieldValue(bean: dependenteInstance, field: "nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dependenteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
