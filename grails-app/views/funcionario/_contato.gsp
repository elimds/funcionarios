<%@ page import="funcionarios.Funcionario" %>
<g:formRemote name="contatoForm" url="[controller: 'funcionario', action: 'adicionarContato']" 
		update="dvMensagem" onSuccess="carregarListaContatos()" method="POST" >

	<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
	<g:hiddenField id="contatoId" name="id" value="${contatoInstance?.id }"/>

	<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'tipo', 'error')} required">
		<label for="tipo">
			<g:message code="contato.tipo.label" default="Tipo" />
			<span class="required-indicator">*</span>
		</label>
		<g:select name="tipo" from="${funcionarios.TipoContatoEnum?.values()}" optionValue="id" keys="${funcionarios.TipoContatoEnum?.values()*.name()}" required="" value="${contatoInstance?.tipo?.name()}" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'valor', 'error')} required">
		<label for="valor">
			<g:message code="contato.valor.label" default="Valor" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="valor" required="" value="${contatoInstance?.valor}"/>
	
	</div>
	<fieldset class="buttons">
		<input type="submit" class="save" value="Adicionar" name="btnSalvar" value="Salvar" />
	</fieldset>

</g:formRemote>
<script type="text/javascript">
	function carregarListaContatos(){
		<g:remoteFunction controller="funcionario" action="listaContatos" id="${funcionarioInstance?.id}" update="contatoList" />
		cancelar();
	}
</script>	
