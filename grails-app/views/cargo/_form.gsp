<g:formRemote name="cargoForm" url="[controller: 'cargo', action: 'salvar']" update="dvMensagem" onSuccess="carregarLista(); displayMensagem();" method="POST" class="form-horizontal">
	<div class="top-bar">
		<h3><i class="icon-plus"></i> Incluir Cargo</h3>
	</div>
	<div class="well no-padding">
		<input type="hidden" name="id" value="${cargo.id }" />
		<div class="control-group span6 sem-margin-left">
			<label class="control-label">Nome:</label>
			<div class="controls">
				<input type="text" required="required" name="nome" maxlength="200" value="${cargo.nome }" placeholder="Nome" class="span12" />
			</div>
		</div>
		<div class="control-group span6">
			<label class="control-label">Classe:</label>
			<div class="controls">
				<input type="text" required="required" name="classe" maxlength="20" value="${cargo.classe }" placeholder="Classe" class="span12" /> 
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="form-actions">
			<input type="submit" name="btnSalvar" value="Salvar" class="btn btn-primary" />
			<a href="#" onclick="cancelar();" class="btn btn-danger">Cancelar</a>
		</div>
	</div>
</g:formRemote>
