<g:formRemote name="departamentoForm" url="[controller: 'departamento', action: 'salvar']" update="dvMensagem" onSuccess="carregarLista(); displayMensagem();" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Departamento</h3>
	</div>
	<div class="well no-padding">
		<input type="hidden" name="id" value="${departamento.id }" />
		<div class="control-group span6 sem-margin-left">
			<label class="control-label">Nome:</label>
			<div class="controls">
				<input type="text" required="required" name="nome" maxlength="200" value="${departamento.nome }" placeholder="Nome do departamento" class="span12" />
			</div>
		</div>
		<div class="control-group span3">
			<label class="control-label">Sigla do Depart.:</label>
			<div class="controls">
				<input type="text" required="required" name="sigla" maxlength="20" value="${departamento.sigla }" placeholder="Sigla do departamento" class="span12" />
			</div>
		</div>
		<div class="control-group span3">
			<label class="control-label">Ramal:</label>
			<div class="controls">
				<input type="text" required="required" name="ramal" maxlength="20" value="${departamento.ramal }" placeholder="Ramal" class="span12" /> 
			</div>
		</div>
		<div class="control-group span6 sem-margin-left">
			<label class="control-label">E-mail:</label>
			<div class="controls">
				<input type="email" required="required" name="email" maxlength="20" value="${departamento.email }" placeholder="E-mail do departamento" class="span12" />
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">Chefe:</label>
			<div class="controls">
				<input type="text" required="required" name="chefe" maxlength="50" value="${departamento.chefe }" placeholder="Chefe do departamento" class="span12" /> 
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" name="btnSalvar" value="Salvar" class="btn btn-primary" />
			<a href="#" onclick="cancelar();" class="btn btn-danger">Cancelar</a>
		</div>
	</div>
</g:formRemote>
