<%@ page import="funcionarios.Dependente" %>

<g:formRemote id="dependenteForm" name="dependenteForm" url="[controller: 'funcionario', action: 'adicionarDependente']" update="dvMensagemDependente" onSuccess="carregarListaDependentes()" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Dependente</h3>
	</div>
	<div class="well no-padding">
		<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
		<g:hiddenField id="dependenteId" name="id" value="${dependenteInstance?.id }"/>
		<div class="control-group span6 sem-margin-left ${hasErrors(bean: dependenteInstance, field: 'nome', 'error')} required">
			<label class="control-label" for="nome">Nome:</label>
			<div class="controls">
				<g:textField name="nome" required="" value="${dependenteInstance?.nome}" class="span12" />
			</div>
		</div>
		<div class="control-group span3 ${hasErrors(bean: dependenteInstance, field: 'identidade', 'error')} ">
			<label class="control-label" for="identidade">Identidade:</label>
			<div class="controls">
				<g:textField name="identidade" value="${dependenteInstance?.identidade}" class="span12" />
			</div>
		</div>
		<div class="control-group span3 ${hasErrors(bean: dependenteInstance, field: 'cpf', 'error')} required">
			<label class="control-label" for="cpf">CPF:</label>
			<div class="controls">
				<g:textField name="cpf" required="" value="${dependenteInstance?.cpf}" class="span12" />
			</div>
		</div>
		<div class="control-group span12 sem-margin-left ${hasErrors(bean: dependenteInstance, field: 'dataNascimento', 'error')} required">
			<label class="control-label" for="dataNascimento">Data de Nascimento:</label>
			<div class="controls">
				<g:datePicker name="dataNascimento" precision="day"  value="${dependenteInstance?.dataNascimento}"  />
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" class="btn btn-primary" value="${ dependenteInstance?.id ? "Atualizar" : "Adicionar" }" name="btnSalvar" value="Salvar" />
		</div>
	</div>
</g:formRemote>
<script type="text/javascript">
	function carregarListaDependentes(){
		<g:remoteFunction controller="funcionario" action="listaDependentes" id="${funcionarioInstance?.id}" update="dependenteList" />
		limparFormDependente();
	}
	function limparFormDependente(){
		$('#dependenteForm').find('input:not(:submit, #funcionario)').each(function(){
		  	$(this).val("");
	  	});
	  	$('#dependenteForm .save').val("Adicionar");
	}
	
</script>	