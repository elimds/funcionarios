<%@ page import="funcionarios.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'cidades', 'error')} ">
	<label for="cidades">
		<g:message code="estado.cidades.label" default="Cidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estadoInstance?.cidades?}" var="c">
    <li><g:link controller="cidade" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cidade" action="create" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cidade.label', default: 'Cidade')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'enderecos', 'error')} ">
	<label for="enderecos">
		<g:message code="estado.enderecos.label" default="Enderecos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estadoInstance?.enderecos?}" var="e">
    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="endereco" action="create" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="estado.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${estadoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="estado.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sigla" required="" value="${estadoInstance?.sigla}"/>

</div>

