<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<title>Cadastro de Departamentos</title>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:javascript library="jquery"></g:javascript>
</head>
<body>
	<main id="departamentoPage">
		<div id="dvMensagem" style="text-align:center;"></div>
		<section id="departamentoCreation" class="not">
		</section>
		<nav class="bottom">
			<g:remoteLink controller="departamento" action="novo" update="departamentoCreation">Novo Departamento</g:remoteLink>
		</nav>
		
		<section id="departamentoList">
			<g:render template="list" model="${[departamentos: departamentos] }"></g:render>
		</section>
	</main>
<script type="text/javascript">
	function cancelar(){
		jQuery("#departamentoCreation").html("");
	}
	function carregarLista(){
		<g:remoteFunction controller="departamento" action="lista" update="departamentoList" />
		cancelar();
	}
</script>	
	
</body>
</html>
