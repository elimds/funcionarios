
<g:formRemote name="cargoForm" url="[controller: 'cargo', action: 'salvar']" 
		update="dvMensagem" onSuccess="carregarLista()" method="POST" >
	<input type="hidden" name="id" value="${cargo.id }" />
	<div>
		<label>Nome</label><br />
		<input type="text" required="required" name="nome" maxlength="200" value="${cargo.nome }"
				placeholder="Nome" />
	</div>
	<div>
		<label>Classe</label><br />
		<input type="text" required="required" name="classe" maxlength="20" value="${cargo.classe }" 
				placeholder="Classe" /> 
	</div>
	<nav>
		<input type="submit" name="btnSalvar" value="Salvar" /> &nbsp; 
		<a href="#" onclick="cancelar();">Cancelar</a>
	</nav>
</g:formRemote>
