<g:formRemote name="titulacaoForm" url="[controller: 'titulacao', action: 'salvar']" update="dvMensagem" onSuccess="carregarLista(); displayMensagem();" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Titulação</h3>
	</div>
	<div class="well no-padding">
		<input type="hidden" name="id" value="${titulacao.id }" />
		<div class="control-group span6 sem-margin-left">
			<label class="control-label">Descrição:</label>
			<div class="controls">
				<input type="text" required="required" name="descricao" maxlength="200" value="${titulacao.descricao }" placeholder="Descrição" class="span12" />
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">Grau:</label>
			<div class="controls">
				<g:select name="grau" 
				    from="${funcionarios.GrauEnum?.values()}"
				    keys="${funcionarios.GrauEnum.values()*.name()}" required="" 
				    value="${titulacao?.grau?.name()}" class="span12" />
			</div>
		</div>
		<div class="control-group span6 sem-margin-left">
			<label class="control-label">Carga Horária:</label>
			<div class="controls">
				<input type="text" required="required" name="cargaHoraria" maxlength="20" value="${titulacao.cargaHoraria }" placeholder="Carga Horária" class="span12" />
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">Instituição:</label>
			<div class="controls">
				<input type="text" required="required" name="instituicao" maxlength="100" value="${titulacao.instituicao }" placeholder="Instituição" class="span12" /> 
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" name="btnSalvar" value="Salvar" class="btn btn-primary" />
			<a href="#" onclick="cancelar();" class="btn btn-danger">Cancelar</a>
		</div>
	</div>
</g:formRemote>
