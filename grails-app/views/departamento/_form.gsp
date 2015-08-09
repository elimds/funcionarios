
<g:formRemote name="departamentoForm" url="[controller: 'departamento', action: 'salvar']" 
		update="dvMensagem" onSuccess="carregarLista()" method="POST" >
	<input type="hidden" name="id" value="${departamento.id }" />
	<div>
		<label>Nome</label><br />
		<input type="text" required="required" name="nome" maxlength="200" value="${departamento.nome }"
				placeholder="Nome do departamento" />
	</div>
	<div>
		<label>Sigla do Departamento</label><br /> 
		<input type="text" required="required" name="sigla" maxlength="20" value="${departamento.sigla }" 
				placeholder="Sigla do departamento" />
	</div>
	<div>
		<label>Ramal</label><br />
		<input type="text" required="required" name="ramal" maxlength="20" value="${departamento.ramal }" 
				placeholder="Ramal" /> 
	</div>
	<div>
		<label>E-mail</label><br />
		<input type="email" required="required" name="email" maxlength="20" value="${departamento.email }" 
				placeholder="E-mail do departamento" /> 
	</div>
	<div>
		<label>Chefe</label><br />
		<input type="text" required="required" name="chefe" maxlength="50" value="${departamento.chefe }" 
				placeholder="Chefe do departamento" /> 
	</div>
	<nav>
		<input type="submit" name="btnSalvar" value="Salvar" /> &nbsp; 
		<a href="#" onclick="cancelar();">Cancelar</a>
	</nav>
</g:formRemote>
