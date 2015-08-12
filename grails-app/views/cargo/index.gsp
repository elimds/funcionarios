<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<title>Cadastro de Cargo</title>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'cargo.label', default: 'Cargo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:javascript library="jquery"></g:javascript>
</head>
<body>
	<main id="cargoPage">
		<div id="dvMensagem" style="text-align:center;"></div>
		<section id="cargoCreation" class="not">
		</section>
		<nav class="bottom">
			<g:remoteLink controller="cargo" action="novo" update="cargoCreation">Novo Cargo</g:remoteLink>
		</nav>
		
		<section id="cargoList">
			<g:render template="list" model="${[cargos: cargos] }"></g:render>
		</section>
	</main>
<script type="text/javascript">
	function cancelar(){
		jQuery("#cargoCreation").html("");
	}
	function carregarLista(){
		<g:remoteFunction controller="cargo" action="lista" update="cargoList" />
		cancelar();
	}
</script>	
	
</body>
</html>
