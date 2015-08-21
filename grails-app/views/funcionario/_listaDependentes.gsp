<table id="tblDependentes">
		<colgroup>
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
		</colgroup>
	<thead>
		<tr>
			<th>Nome</th>
			<th>Data de Nascimento</th>
			<th>Identidade</th>
			<th>Cpf</th>
			<th>Ações</th>
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
						<g:remoteLink controller="dependente" action="editar" id="${dependente.id }" 
								update="dependenteCreation" >Editar</g:remoteLink>
						<g:remoteLink controller="dependente" action="excluir" id="${dependente.id }" 
								update="dvMensagemDependente" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarListaDependentes()" method="DELETE" >Excluir</g:remoteLink>
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
