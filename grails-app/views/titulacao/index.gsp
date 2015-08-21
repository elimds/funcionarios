
<%@ page import="funcionarios.Titulacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'titulacao.label', default: 'Titulacao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-titulacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-titulacao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cargaHoraria" title="${message(code: 'titulacao.cargaHoraria.label', default: 'Carga Horaria')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'titulacao.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="grau" title="${message(code: 'titulacao.grau.label', default: 'Grau')}" />
					
						<g:sortableColumn property="instituicao" title="${message(code: 'titulacao.instituicao.label', default: 'Instituicao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${titulacaoInstanceList}" status="i" var="titulacaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${titulacaoInstance.id}">${fieldValue(bean: titulacaoInstance, field: "cargaHoraria")}</g:link></td>
					
						<td>${fieldValue(bean: titulacaoInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: titulacaoInstance, field: "grau")}</td>
					
						<td>${fieldValue(bean: titulacaoInstance, field: "instituicao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${titulacaoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
<html lang="en">
<head>
<meta charset="utf-8">
	<title>Cadastro de Titulação</title>
	<meta name="layout" content="avocado">
	<g:set var="entityName" value="${message(code: 'titulacao.label', default: 'Titulação')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:javascript library="jquery"></g:javascript>
</head>
<body>
	<main id="titulacaoPage">
		<div class="row-fluid">
			<div class="span12">
				<div id="dvMensagem"></div>
				<section id="titulacaoCreation" class="not"></section>
				<nav class="bottom">
					<div class="link-add">
						<g:remoteLink controller="titulacao" action="novo" update="titulacaoCreation"><i class="icon-plus"></i> Nova Titulação</g:remoteLink>
					</div>
				</nav>
				
				<section id="titulacaoList">
					<g:render template="list" model="${[titulacoes: titulacoes] }"></g:render>
				</section>
			</div>
		</div>
	</main>
<script type="text/javascript">
	function cancelar(){
		jQuery("#titulacaoCreation").html("");
	}
	function carregarLista(){
		<g:remoteFunction controller="titulacao" action="lista" update="titulacaoList" />
		cancelar();
	}
</script>	
	
</body>
</html>
