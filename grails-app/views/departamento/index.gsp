<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<title>Cadastro de Departamentos</title>
	<meta name="layout" content="avocado">
	<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:javascript library="jquery"></g:javascript>
</head>
<body>
	<main id="departamentoPage">
		<div class="row-fluid">
			<div class="span12">
				<div id="dvMensagem" class="alert"></div>
				<section id="departamentoCreation" class="not"></section>
				<nav class="bottom">
					<g:if test="${session?.user?.login == "admin"}">
						<div class="link-add">
							<g:remoteLink controller="departamento" action="novo" update="departamentoCreation"><i class="icon-plus"></i> Novo Departamento</g:remoteLink>
						</div>
					</g:if>
				</nav>
				
				<section id="departamentoList">
					<g:render template="list" model="${[departamentos: departamentos] }"></g:render>
				</section>
			</div>
		</div>
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
