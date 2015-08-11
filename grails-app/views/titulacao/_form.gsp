
<g:formRemote name="titulacaoForm" url="[controller: 'titulacao', action: 'salvar']" 
		update="dvMensagem" onSuccess="carregarLista()" method="POST" >
	<input type="hidden" name="id" value="${titulacao.id }" />
	<div>
		<label>Descricao</label><br />
		<input type="text" required="required" name="descricao" maxlength="200" value="${titulacao.descricao }"
				placeholder="Descrição" />
	</div>
	<div>
		<label>Grau</label><br /> 
		<g:select name="grau" 
		    from="${funcionarios.GrauEnum?.values()}"
		    keys="${funcionarios.GrauEnum.values()*.name()}" required="" 
		    value="${titulacao?.grau?.name()}"/>
	</div>
	<div>
		<label>Carga Horária</label><br />
		<input type="text" required="required" name="cargaHoraria" maxlength="20" value="${titulacao.cargaHoraria }" 
				placeholder="Carga Horária" /> 
	</div>
	<div>
		<label>Instituição</label><br />
		<input type="text" required="required" name="instituicao" maxlength="100" value="${titulacao.instituicao }" 
				placeholder="Instituição" /> 
	</div>
	<nav>
		<input type="submit" name="btnSalvar" value="Salvar" /> &nbsp; 
		<a href="#" onclick="cancelar();">Cancelar</a>
	</nav>
</g:formRemote>
