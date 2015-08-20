<%@ page import="funcionarios.Funcionario" %>
<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="funcionario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${funcionarioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="funcionario.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${funcionarios.SexoEnum?.values()}" keys="${funcionarios.SexoEnum?.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.sexo?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento">
		<g:message code="funcionario.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${funcionarioInstance?.dataNascimento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'matricula', 'error')} required">
	<label for="matricula">
		<g:message code="funcionario.matricula.label" default="Matricula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="matricula" type="number" value="${funcionarioInstance.matricula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'cargo', 'error')} required">
	<label for="cargo">
		<g:message code="funcionario.cargo.label" default="Cargo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cargo" name="cargo.id" from="${funcionarios.Cargo.list()}" optionKey="id" optionValue="nome" required="" value="${funcionarioInstance?.cargo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="funcionario.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${funcionarios.Departamento.list()}" optionKey="id" optionValue="nome" required="" value="${funcionarioInstance?.departamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'escolaridade', 'error')} required">
	<label for="escolaridade">
		<g:message code="funcionario.escolaridade.label" default="Escolaridade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="escolaridade" from="${funcionarios.EscolaridadeEnum?.values()}" keys="${funcionarios.EscolaridadeEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.escolaridade?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'estadoCivil', 'error')} required">
	<label for="estadoCivil">
		<g:message code="funcionario.estadoCivil.label" default="Estado Civil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estadoCivil" from="${funcionarios.EstadoCivilEnum?.values()}" keys="${funcionarios.EstadoCivilEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.estadoCivil?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'funcaoGratificada', 'error')} required">
	<label for="funcaoGratificada">
		<g:message code="funcionario.funcaoGratificada.label" default="Funcao Gratificada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="funcaoGratificada" from="${funcionarios.FuncaoEnum?.values()}" keys="${funcionarios.FuncaoEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.funcaoGratificada?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'jornadaTrabalho', 'error')} required">
	<label for="jornadaTrabalho">
		<g:message code="funcionario.jornadaTrabalho.label" default="Jornada de Trabalho" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="jornadaTrabalho" from="${funcionarios.JornadaEnum?.values()}" optionValue="id" keys="${funcionarios.JornadaEnum.values()*.name()}" required="" value="${funcionarioInstance?.jornadaTrabalho?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'regimeJuridico', 'error')} required">
	<label for="regimeJuridico">
		<g:message code="funcionario.regimeJuridico.label" default="Regime Juridico" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="regimeJuridico" from="${funcionarios.RegimeJuridicoEnum?.values()}" keys="${funcionarios.RegimeJuridicoEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.regimeJuridico?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'situacao', 'error')} required">
	<label for="situacao">
		<g:message code="funcionario.situacao.label" default="Situacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="situacao" from="${funcionarios.SituacaoEnum?.values()}" keys="${funcionarios.SituacaoEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.situacao?.name()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'lattes', 'error')} required">
	<label for="lattes">
		<g:message code="funcionario.lattes.label" default="Lattes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lattes" type="url" value="${funcionarioInstance.lattes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'lotacao', 'error')} required">
	<label for="lotacao">
		<g:message code="funcionario.lotacao.label" default="Lotacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lotacao" name="lotacao.id" from="${funcionarios.Departamento.list()}" optionKey="id" optionValue="nome" required="" value="${funcionarioInstance?.lotacao?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'naturalidade', 'error')} required">
	<label for="naturalidade">
		<g:message code="funcionario.naturalidade.label" default="Naturalidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="naturalidade" required="" value="${funcionarioInstance?.naturalidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'banco', 'error')} required">
	<label for="banco">
		<g:message code="funcionario.banco.label" default="Banco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="banco" type="number" value="${funcionarioInstance.banco}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'nomeBanco', 'error')} required">
	<label for="nomeBanco">
		<g:message code="funcionario.nomeBanco.label" default="Nome Banco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeBanco" required="" value="${funcionarioInstance?.nomeBanco}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'contaBancaria', 'error')} required">
	<label for="contaBancaria">
		<g:message code="funcionario.contaBancaria.label" default="Conta Bancaria" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contaBancaria" required="" value="${funcionarioInstance?.contaBancaria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'pis', 'error')} required">
	<label for="pis">
		<g:message code="funcionario.pis.label" default="Pis" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pis" required="" value="${funcionarioInstance?.pis}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'identidade', 'error')} required">
	<label for="identidade">
		<g:message code="funcionario.identidade.label" default="Identidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identidade" required="" value="${funcionarioInstance?.identidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="funcionario.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${funcionarioInstance?.cpf}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'tituloEleitor', 'error')} required">
	<label for="tituloEleitor">
		<g:message code="funcionario.tituloEleitor.label" default="Titulo Eleitor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tituloEleitor" required="" value="${funcionarioInstance?.tituloEleitor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'contatos', 'error')} ">
	<label for="contatos">
		<g:message code="funcionario.contatos.label" default="Contatos" />
	</label>
	<ul class="one-to-many">
		<g:each in="${funcionarioInstance?.contatos?}" var="c">
		    <li><g:link controller="contato" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
		<g:link controller="contato" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contato.label', default: 'Contato')])}</g:link>
		</li>
	</ul>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'enderecos', 'error')} ">
	<label for="enderecos">
		<g:message code="funcionario.enderecos.label" default="Enderecos" />
	</label>
	<ul class="one-to-many">
		<g:each in="${funcionarioInstance?.enderecos?}" var="e">
		    <li><g:link controller="endereco" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
		<g:link controller="endereco" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
		</li>
	</ul>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'dependentes', 'error')} ">
	<label for="dependentes">
		<g:message code="funcionario.dependentes.label" default="Dependentes" />
	</label>
	<ul class="one-to-many">
		<g:each in="${funcionarioInstance?.dependentes?}" var="d">
		    <li><g:link controller="dependente" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
		<g:link controller="dependente" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dependente.label', default: 'Dependente')])}</g:link>
		</li>
	</ul>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'historicosFuncional', 'error')} ">
	<label for="historicosFuncional">
		<g:message code="funcionario.historicosFuncional.label" default="Historicos Funcional" />
	</label>
	<ul class="one-to-many">
	<g:each in="${funcionarioInstance?.historicosFuncional?}" var="h">
	    <li><g:link controller="historicoFuncional" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
	</g:each>
	<li class="add">
	<g:link controller="historicoFuncional" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'historicoFuncional.label', default: 'HistoricoFuncional')])}</g:link>
	</li>
	</ul>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'titulacoes', 'error')} ">
	<label for="titulacoes">
		<g:message code="funcionario.titulacoes.label" default="Titulacoes" />
	</label>
	<ul class="one-to-many">
	<g:each in="${funcionarioInstance?.titulacoes?}" var="t">
	    <li><g:link controller="funcionarioTitulacao" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
	</g:each>
	<li class="add">
	<g:link controller="funcionarioTitulacao" action="create" params="['funcionario.id': funcionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'funcionarioTitulacao.label', default: 'FuncionarioTitulacao')])}</g:link>
	</li>
	</ul>
</div>
