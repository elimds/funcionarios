<%@ page import="funcionarios.Funcionario" %>
<g:formRemote name="enderecoForm" id="enderecoForm" url="[controller: 'funcionario', action: 'adicionarEndereco']" 
		update="dvMensagemEndereco" onSuccess="carregarListaEnderecos()" method="POST" >

	<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
	<g:hiddenField id="enderecoId" name="id" value="${enderecoInstance?.id }"/>
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'rua', 'error')} required">
		<label for="rua">
			<g:message code="endereco.rua.label" default="Rua" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="rua" required="" value="${enderecoInstance?.rua}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} required">
		<label for="numero">
			<g:message code="endereco.numero.label" default="Número" />
			<span class="required-indicator">*</span>
		</label>
		<g:field name="numero" type="number" value="${enderecoInstance?.numero}" required=""/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} required">
		<label for="complemento">
			<g:message code="endereco.complemento.label" default="Complemento" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="complemento" required="" value="${enderecoInstance?.complemento}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} required">
		<label for="bairro">
			<g:message code="endereco.bairro.label" default="Bairro" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="bairro" required="" value="${enderecoInstance?.bairro}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} required">
		<label for="estado">
			<g:message code="endereco.estado.label" default="Estado" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="estado" name="estado.id" from="${funcionarios.Estado.list()}" noSelection="${['null':'Escolha um Estado...']}" 
				optionKey="id" required="" value="${enderecoInstance?.estado?.id}" 
				class="many-to-one"
				onchange="${ remoteFunction(controller: 'funcionario', action: 'optionsCidade', update:'cidade', params:'\'estado=\' + this.value' ) }" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
		<label for="cidade">
			<g:message code="endereco.cidade.label" default="Cidade" />
			<span class="required-indicator">*</span>
		</label>
		<select id="cidade" name="cidade.id" required="" class="many-to-one">
			<g:if test="${enderecoInstance?.estado?.id }">
				<g:render template="optionsCidade" model="${[cidadeList:  cidadeList]}" />
				<script type="text/javascript">
					jQuery("#cidade").val(${enderecoInstance?.cidade?.id});
				</script>
			</g:if>
			<g:else>
				<option>Escolha um Estado...</option>
			</g:else>
		</select>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} required">
		<label for="cep">
			<g:message code="endereco.cep.label" default="Cep" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="cep" required="" value="${enderecoInstance?.cep}"/>
	</div>
	<fieldset class="buttons">
		<input type="submit" class="save" value="${enderecoInstance?.id ? 'Atualizar' : 'Adicionar' }" name="btnSalvar" value="Salvar" />
	</fieldset>
</g:formRemote>
<script type="text/javascript">
	function carregarListaEnderecos(){
		<g:remoteFunction controller="funcionario" action="listaEnderecos" id="${funcionarioInstance?.id}" update="enderecoList" />
		cancelar();
	}
	function cancelar(){
		//$('#enderecoForm').each (function(){
		//  this.reset();
		//});
		$('#enderecoForm').find('input:not(:submit, #funcionario)').each(function () {
		  	$(this).val("");
	  	});
	  	$('#enderecoForm .save').val("Adicionar");
	  	$('#estado').val("null");
		$('#cidade').html('<option>Escolha um Estado...</option>');
	}
</script>	
