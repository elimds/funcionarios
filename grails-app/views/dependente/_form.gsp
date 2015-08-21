<%@ page import="funcionarios.Dependente" %>


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

<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento">
		<g:message code="dependente.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${dependenteInstance?.dataNascimento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'funcionario', 'error')} required">
	<label for="funcionario">
		<g:message code="dependente.funcionario.label" default="Funcionario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="funcionario" name="funcionario.id" from="${funcionarios.Funcionario.list()}" optionKey="id" required="" value="${dependenteInstance?.funcionario?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dependenteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="dependente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${dependenteInstance?.nome}"/>

</div>

