<%@ page import="funcionarios.Funcionario" %>
<g:formRemote name="contatoForm" url="[controller: 'funcionario', action: 'adicionarContato']" update="dvMensagem" onSuccess="carregarListaContatos()" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Contato</h3>
	</div>
	<div class="well no-padding">
		<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
		<g:hiddenField id="contatoId" name="id" value="${contatoInstance?.id }"/>
		<div class="control-group span6 sem-margin-left ${hasErrors(bean: contatoInstance, field: 'tipo', 'error')} required">
			<label class="control-label" for="tipo">Tipo:</label>
			<div class="controls">
				<g:select name="tipo" from="${funcionarios.TipoContatoEnum?.values()}" optionValue="id" keys="${funcionarios.TipoContatoEnum?.values()*.name()}" required="" value="${contatoInstance?.tipo?.name()}" class="span12" />
			</div>
		</div>
		<div class="control-group span6 ${hasErrors(bean: contatoInstance, field: 'valor', 'error')} required">
			<label class="control-label" for="valor">Valor:</label>
			<div class="controls">
				<g:textField name="valor" required="" value="${contatoInstance?.valor}" class="span12" />
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" class="btn btn-primary" name="btnSalvar" value="Salvar" />
		</div>
	</div>
</g:formRemote>
<script type="text/javascript">
	function carregarListaContatos(){
		<g:remoteFunction controller="funcionario" action="listaContatos" id="${funcionarioInstance?.id}" update="contatoList" />
		cancelar();
	}
</script>	
