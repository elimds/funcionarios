<%@ page import="funcionarios.Titulacao" %>



<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'cargaHoraria', 'error')} required">
	<label for="cargaHoraria">
		<g:message code="titulacao.cargaHoraria.label" default="Carga Horaria" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cargaHoraria" type="number" value="${titulacaoInstance.cargaHoraria}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="titulacao.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${titulacaoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: titulacaoInstance, field: 'funcionarios', 'error')} ">
	<label for="funcionarios">
		<g:message code="titulacao.funcionarios.label" default="Funcionarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${titulacaoInstance?.funcionarios?}" var="f">
    <li><g:link controller="funcionarioTitulacao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="funcionarioTitulacao" action="create" params="['titulacao.id': titulacaoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'funcionarioTitulacao.label', default: 'FuncionarioTitulacao')])}</g:link>
</li>
</ul>


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

