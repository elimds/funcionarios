<%@ page import="funcionarios.Titulacao" %>
<g:formRemote id="titulacaoForm" name="titulacaoForm" url="[controller: 'funcionario', action: 'adicionarTitulacao']" update="dvMensagemTitulacao" onSuccess="carregarListaTitulacoes();" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Titulação</h3>
	</div>
	<div class="well no-padding">
		<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
		<g:hiddenField id="titulacaoId" name="id" value="${titulacaoInstance?.id }"/>
		<div class="control-group span6 sem-margin-left ${hasErrors(bean: titulacaoInstance, field: 'cargaHoraria', 'error')} required">
			<label class="control-label" for="cargaHoraria">Carga Horária:</label>
			<div class="controls">
				<g:field name="cargaHoraria" type="number" value="${titulacaoInstance?.cargaHoraria}" required="" class="span12" />
			</div>
		</div>
		<div class="control-group span6 ${hasErrors(bean: titulacaoInstance, field: 'descricao', 'error')} required">
			<label class="control-label" for="descricao">Descrição:</label>
			<div class="controls">
				<g:textField name="descricao" required="" value="${titulacaoInstance?.descricao}" class="span12" />
			</div>
		</div>
		<div class="control-group span6 sem-margin-left ${hasErrors(bean: titulacaoInstance, field: 'grau', 'error')} required">
			<label class="control-label" for="grau">Grau:</label>
			<div class="controls">
				<g:select name="grau" from="${funcionarios.GrauEnum?.values()}" 
						keys="${funcionarios.GrauEnum.values()*.name()}" required="" 
						value="${titulacaoInstance?.grau?.name()}"
						noSelection="${['null':'Escolha uma opção...']}" class="span12" />
			</div>
		</div>
		<div class="control-group span6 ${hasErrors(bean: titulacaoInstance, field: 'instituicao', 'error')} required">
			<label class="control-label" for="instituicao">Instituição:</label>
			<div class="controls">
				<g:textField name="instituicao" required="" value="${titulacaoInstance?.instituicao}" class="span12" />
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" class="btn btn-primary" value="${titulacaoInstance?.id ? "Atualizar" : "Adicionar" }" name="btnSalvar" value="Salvar" />
		</div>
	</div>
</g:formRemote>
<script type="text/javascript">
	function carregarListaTitulacoes(){
		<g:remoteFunction controller="funcionario" action="listaTitulacoes" id="${funcionarioInstance?.id}" update="titulacaoList" />
		limparFormTitulacao();
	}
	function limparFormTitulacao(){
		$('#titulacaoForm').find('input:not(:submit, #funcionario)').each(function(){
		  	$(this).val("");
	  	});
	  	$('#titulacaoForm .save').val("Adicionar");
	  	$('#grau').val("null");
	}
</script>

