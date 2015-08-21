	<%@ page import="funcionarios.Titulacao" %>

	<g:formRemote name="titulacaoForm" url="[controller: 'funcionario', action: 'adicionarTitulacao']" 
	update="dvMensagemTitulacao" onSuccess="carregarListaTitulacoes()" method="POST" >

	<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
	<g:hiddenField id="titulacaoId" name="id" value="${titulacaoInstance?.id }"/>

	<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'cargaHoraria', 'error')} required">
		<label for="cargaHoraria">
			<g:message code="titulacao.cargaHoraria.label" default="Carga Horaria" />
			<span class="required-indicator">*</span>
		</label>
		<g:field name="cargaHoraria" type="number" value="${titulacaoInstance?.cargaHoraria}" required=""/>

	</div>

	<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'descricao', 'error')} required">
		<label for="descricao">
			<g:message code="titulacao.descricao.label" default="Descricao" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="descricao" required="" value="${titulacaoInstance?.descricao}"/>

	</div>

	<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'grau', 'error')} required">
		<label for="grau">
			<g:message code="titulacao.grau.label" default="Grau" />
			<span class="required-indicator">*</span>
		</label>
		<g:select name="grau" from="${funcionarios.GrauEnum?.values()}" keys="${funcionarios.GrauEnum.values()*.name()}" required="" value="${titulacaoInstance?.grau?.name()}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'instituicao', 'error')} required">
		<label for="instituicao">
			<g:message code="titulacao.instituicao.label" default="Instituicao" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="instituicao" required="" value="${titulacaoInstance?.instituicao}"/>

	</div>

	<fieldset class="buttons">
		<input type="submit" class="save" value="Adicionar" name="btnSalvar" value="Salvar" />
		<a href="#"  onclick="cancelar();">Cancelar</a>
	</fieldset>

	</g:formRemote>
	<script type="text/javascript">
		function carregarListaTitulacoes(){
			<g:remoteFunction controller="funcionario" action="listaTitulacoes" id="${funcionarioInstance?.id}" update="titulacaoList" />
			//cancelar();
		}
	</script>	

