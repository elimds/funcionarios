<%@ page import="funcionarios.Funcionario" %>
<div class="well no-padding">

	<div class="control-group span6 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'nome', 'error')} required">
		<label class="control-label" for="nome">Nome Completo:</label>
		<div class="controls">
			<g:textField name="nome" required="" value="${funcionarioInstance?.nome}" class="span12" />
		</div>
	</div>

	<div class="control-group span6 ${hasErrors(bean: funcionarioInstance, field: 'sexo', 'error')} required">
		<label class="control-label" for="sexo">Sexo:</label>
		<div class="controls">
			<g:select name="sexo" from="${funcionarios.SexoEnum?.values()}" keys="${funcionarios.SexoEnum?.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.sexo?.name()}" class="span12" />
		</div>
	</div>

	<div class="control-group span12 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'dataNascimento', 'error')} required">
		<label class="control-label" for="dataNascimento">Data de Nascimento:</label>
		<div class="controls">
			<g:datePicker name="dataNascimento" precision="day"  value="${funcionarioInstance?.dataNascimento}" />
		</div>
	</div>

	<div class="control-group span4 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'matricula', 'error')} required">
		<label class="control-label" for="matricula">Matrícula:</label>
		<div class="controls">
			<g:field name="matricula" type="number" value="${funcionarioInstance.matricula}" required="" class="span12" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'cargo', 'error')} required">
		<label class="control-label" for="cargo">Cargo:</label>
		<div class="controls">
			<g:select id="cargo" name="cargo.id" from="${funcionarios.Cargo.list()}" optionKey="id" optionValue="nome" required="" value="${funcionarioInstance?.cargo?.id}" class="many-to-one"/>
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'departamento', 'error')} required">
		<label class="control-label" for="departamento">Departamento:</label>
		<div class="controls">
			<g:select id="departamento" name="departamento.id" from="${funcionarios.Departamento.list()}" optionKey="id" optionValue="nome" required="" value="${funcionarioInstance?.departamento?.id}" class="many-to-one"/>
		</div>
	</div>

	<div class="control-group span4 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'escolaridade', 'error')} required">
		<label class="control-label" for="escolaridade">Escolaridade:</label>
		<div class="controls">
			<g:select name="escolaridade" from="${funcionarios.EscolaridadeEnum?.values()}" keys="${funcionarios.EscolaridadeEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.escolaridade?.name()}" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'estadoCivil', 'error')} required">
		<label class="control-label" for="estadoCivil">Estado Civil:</label>
		<div class="controls">
			<g:select name="estadoCivil" from="${funcionarios.EstadoCivilEnum?.values()}" keys="${funcionarios.EstadoCivilEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.estadoCivil?.name()}" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'funcaoGratificada', 'error')} required">
		<label class="control-label" for="funcaoGratificada">Função Gratificada:</label>
		<div class="controls">
			<g:select name="funcaoGratificada" from="${funcionarios.FuncaoEnum?.values()}" keys="${funcionarios.FuncaoEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.funcaoGratificada?.name()}" />
		</div>
	</div>

	<div class="control-group span4 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'jornadaTrabalho', 'error')} required">
		<label class="control-label" for="jornadaTrabalho">Jornada de Trabalho:</label>
		<div class="controls">
			<g:select name="jornadaTrabalho" from="${funcionarios.JornadaEnum?.values()}" optionValue="id" keys="${funcionarios.JornadaEnum.values()*.name()}" required="" value="${funcionarioInstance?.jornadaTrabalho?.name()}" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'regimeJuridico', 'error')} required">
		<label class="control-label" for="regimeJuridico">Regime Jurídico:</label>
		<div class="controls">
			<g:select name="regimeJuridico" from="${funcionarios.RegimeJuridicoEnum?.values()}" keys="${funcionarios.RegimeJuridicoEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.regimeJuridico?.name()}" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'situacao', 'error')} required">
		<label class="control-label" for="situacao">Situação:</label>
		<div class="controls">
			<g:select name="situacao" from="${funcionarios.SituacaoEnum?.values()}" keys="${funcionarios.SituacaoEnum.values()*.name()}" optionValue="id" required="" value="${funcionarioInstance?.situacao?.name()}" />
		</div>
	</div>

	<div class="control-group span4 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'lattes', 'error')} required">
		<label class="control-label" for="lattes">Lattes:</label>
		<div class="controls">
			<g:field name="lattes" type="url" value="${funcionarioInstance.lattes}" required="" class="span12" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'lotacao', 'error')} required">
		<label class="control-label" for="lotacao">Lotação:</label>
		<div class="controls">
			<g:select id="lotacao" name="lotacao.id" from="${funcionarios.Departamento.list()}" optionKey="id" optionValue="nome" required="" value="${funcionarioInstance?.lotacao?.id}" class="many-to-one"/>
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'naturalidade', 'error')} required">
		<label class="control-label" for="naturalidade">Naturalidade:</label>
		<div class="controls">
			<g:textField name="naturalidade" required="" value="${funcionarioInstance?.naturalidade}" class="span12" />
		</div>
	</div>

	<div class="clearfix"></div>

	<div class="control-group span4 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'banco', 'error')} required">
		<label class="control-label" for="banco">Banco:</label>
		<div class="controls">
			<g:field name="banco" type="number" value="${funcionarioInstance.banco}" required="" class="span12" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'nomeBanco', 'error')} required">
		<label class="control-label" for="nomeBanco">Nome do Banco:</label>
		<div class="controls">
			<g:textField name="nomeBanco" required="" value="${funcionarioInstance?.nomeBanco}" class="span12" />
		</div>
	</div>

	<div class="control-group span4 ${hasErrors(bean: funcionarioInstance, field: 'contaBancaria', 'error')} required">
		<label class="control-label" for="contaBancaria">Conta Bancária:</label>
		<div class="controls">
			<g:textField name="contaBancaria" required="" value="${funcionarioInstance?.contaBancaria}" class="span12" />
		</div>
	</div>

	<div class="control-group span3 sem-margin-left ${hasErrors(bean: funcionarioInstance, field: 'pis', 'error')} required">
		<label class="control-label" for="pis">PIS:</label>
		<div class="controls">
			<g:textField name="pis" required="" value="${funcionarioInstance?.pis}" class="span12" />
		</div>
	</div>

	<div class="control-group span3 ${hasErrors(bean: funcionarioInstance, field: 'identidade', 'error')} required">
		<label class="control-label" for="identidade">Identidade:</label>
		<div class="controls">
			<g:textField name="identidade" required="" value="${funcionarioInstance?.identidade}" class="span12" />
		</div>
	</div>

	<div class="control-group span3 ${hasErrors(bean: funcionarioInstance, field: 'cpf', 'error')} required">
		<label class="control-label" for="cpf">CPF:</label>
		<div class="controls">
			<g:textField name="cpf" required="" value="${funcionarioInstance?.cpf}" class="span12" />
		</div>
	</div>

	<div class="control-group span3 ${hasErrors(bean: funcionarioInstance, field: 'tituloEleitor', 'error')} required">
		<label class="control-label" for="tituloEleitor">Título de Eleitor:</label>
		<div class="controls">
			<g:textField name="tituloEleitor" required="" value="${funcionarioInstance?.tituloEleitor}" class="span12" />
		</div>
	</div>

	%{-- Se quem cadastra é o usuario admin, exibe drop down, senão usa hidden com id do usuario da sessão --}%
	<g:if test="${session?.user?.login == "admin" }">
		<div class="control-group span12 sem-margin-left ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
			<label class="control-label" for="login">Usuário:</label>
			<div class="controls">
				<g:select id="usuario" name="usuario.id" from="${funcionarios.User.list()}" optionKey="id" optionValue="login" required="" value="${funcionarioInstance?.usuario?.id}" class="many-to-one" noSelection="['':'- Selecione -']"/>
			</div>
		</div>	
	</g:if>
	<g:else>
		<g:hiddenField name="usuario.id" value="${session.user.id}" />
	</g:else>


	<div class="clearfix"></div>

	<div class="form-actions">
		<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</div>
</div>
