<%@ page import="funcionarios.Dependente" %>

<g:formRemote name="dependenteForm" url="[controller: 'funcionario', action: 'adicionarDependente']" 
		update="dvMensagemDependente" onSuccess="carregarListaDependentes()" method="POST" >

	<g:hiddenField id="funcionario" name="funcionario.id" value="${funcionarioInstance?.id}" />
	<g:hiddenField id="dependenteId" name="id" value="${dependenteInstance?.id }"/>

	<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'nome', 'error')} required">
		<label for="nome">
			<g:message code="dependente.nome.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="nome" required="" value="${dependenteInstance?.nome}"/>

	</div>

	<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'dataNascimento', 'error')} required">
		<label for="dataNascimento">
			<g:message code="dependente.dataNascimento.label" default="Data Nascimento" />
			<span class="required-indicator">*</span>
		</label>
		<g:datePicker name="dataNascimento" precision="day"  value="${dependenteInstance?.dataNascimento}"  />

	</div>

	<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'identidade', 'error')} ">
		<label for="identidade">
			<g:message code="dependente.identidade.label" default="Identidade" />
			
		</label>
		<g:textField name="identidade" value="${dependenteInstance?.identidade}"/>

	</div>

	<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'cpf', 'error')} required">
		<label for="cpf">
			<g:message code="dependente.cpf.label" default="Cpf" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="cpf" required="" value="${dependenteInstance?.cpf}"/>

	</div>
	<fieldset class="buttons">
		<input type="submit" class="save" value="Adicionar" name="btnSalvar" value="Salvar" />
		<a href="#"  onclick="cancelar();">Cancelar</a>
	</fieldset>

</g:formRemote>
<script type="text/javascript">
	function carregarListaDependentes(){
		<g:remoteFunction controller="funcionario" action="listaDependentes" id="${funcionarioInstance?.id}" update="dependenteList" />
		cancelar();
	}
</script>	