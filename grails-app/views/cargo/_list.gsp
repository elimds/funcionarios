<table id="tblCargos">
		<colgroup>
			<col width="30%">
			<col width="20%">
			<col width="20%">
		</colgroup>
	<thead>
		<tr>
			<th>Nome</th>
			<th>Classe</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${cargos?.size() >0 }">
			<g:each var="cargo" in="${cargos}">
			<tr>
				<td>${cargo?.nome}</td>
				<td>${cargo?.classe}</td>
				<td>
					<nav>
						<g:remoteLink controller="cargo" action="editar" id="${cargo?.id }" 
								update="cargoCreation" >Editar</g:remoteLink>
						<g:remoteLink controller="cargo" action="excluir" id="${cargo?.id }" 
								update="dvMensagem" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarLista()" method="DELETE" >Excluir</g:remoteLink>
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
