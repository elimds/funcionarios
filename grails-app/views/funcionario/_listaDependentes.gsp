<table id="tblDependentes">
		<colgroup>
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
		</colgroup>
	<thead>
		<tr>
			<th>Nome</th>
			<th>Data de Nascimento</th>
			<th>Identidade</th>
			<th>Cpf</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${funcionarioInstance?.dependentes?.size() >0 }">
			<g:each var="dependente" in="${funcionarioInstance?.dependentes}">
			<tr>
				<td>${dependente?.nome}</td>
				<td>${dependente?.dataNascimento}</td>
				<td>${dependente?.identidade}</td>
				<td>${dependente?.cpf}</td>
				<td>
					<nav>
						<g:remoteLink controller="funcionario" action="editarDependente" id="${dependente.id }" 
								update="dependenteCreate">Editar</g:remoteLink>
						<g:remoteLink controller="funcionario" action="excluirDependente" id="${dependente.id }" 
								update="dvMensagemDependente" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarListaDependentes()" method="DELETE">Excluir</g:remoteLink>
					</nav>
				</td>
			</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr><td colspan="4"><p>Nenhum registro na tabela</p></td></tr>
		</g:else>
	</tbody>
</table>
