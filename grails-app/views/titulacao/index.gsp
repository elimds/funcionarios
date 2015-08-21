<!DOCTYPE html>
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
