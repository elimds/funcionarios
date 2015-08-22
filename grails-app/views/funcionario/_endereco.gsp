<%@ page import="funcionarios.Funcionario" %>
<g:formRemote name="enderecoForm" id="enderecoForm" url="[controller: 'funcionario', action: 'adicionarEndereco']" update="dvMensagemEndereco" onSuccess="carregarListaEnderecos()" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Endereço</h3>
	</div>
	<div class="well no-padding">
		<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
		<g:hiddenField id="enderecoId" name="id" value="${enderecoInstance?.id }"/>
		<div class="control-group span5 sem-margin-left ${hasErrors(bean: enderecoInstance, field: 'rua', 'error')} required">
			<label class="control-label" for="rua">Rua:</label>
			<div class="controls">
				<g:textField name="rua" required="" value="${enderecoInstance?.rua}" class="span12" />
			</div>
		</div>
		<div class="control-group span3 ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} required">
			<label class="control-label" for="numero">Número:</label>
			<div class="controls">
				<g:field name="numero" type="number" value="${enderecoInstance?.numero}" required="" class="span12" />
			</div>
		</div>
		<div class="control-group span4 ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} required">
			<label class="control-label" for="complemento">Complemento:</label>
			<div class="controls">
				<g:textField name="complemento" value="${enderecoInstance?.complemento}" class="span12" />
			</div>
		</div>
		<div class="control-group span6 sem-margin-left ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} required">
			<label class="control-label" for="bairro">Bairro:</label>
			<div class="controls">
				<g:textField name="bairro" required="" value="${enderecoInstance?.bairro}" class="span12" />
			</div>
		</div>
		<div class="control-group span6 ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} required">
			<label class="control-label" for="estado">Estado:</label>
			<div class="controls">
				<g:select id="estado" name="estado.id" from="${funcionarios.Estado.list()}" noSelection="${['null':'Escolha um Estado...']}" 
						optionKey="id" required="" value="${enderecoInstance?.estado?.id}" 
						class="many-to-one"
						onchange="${ remoteFunction(controller: 'funcionario', action: 'optionsCidade', update:'cidade', params:'\'estado=\' + this.value' ) }" class="span12" />
			</div>
		</div>
		<div class="control-group span6 sem-margin-left ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
			<label class="control-label" for="cidade">Cidade:</label>
			<div class="controls">
				<select id="cidade" name="cidade.id" required="" class="many-to-one span12">
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
		</div>
		<div class="control-group span6 ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} required">
			<label class="control-label" for="cep">CEP:</label>
			<div class="controls">
				<g:textField name="cep" value="${enderecoInstance?.cep}" class="span12" />
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" class="btn btn-primary" value="${enderecoInstance?.id ? 'Atualizar' : 'Adicionar' }" name="btnSalvar" value="Salvar" />
		</div>
	</div>
</g:formRemote>
<script type="text/javascript">
	function carregarListaEnderecos(){
		<g:remoteFunction controller="funcionario" action="listaEnderecos" id="${funcionarioInstance?.id}" update="enderecoList" />
		cancelar();
	}
	function cancelar(){
		$('#enderecoForm').find('input:not(:submit, #funcionario)').each(function () {
		  	$(this).val("");
	  	});
	  	$('#enderecoForm .save').val("Adicionar");
	  	$('#estado').val("null");
		$('#cidade').html('<option>Escolha um Estado...</option>');
	}
</script>	
