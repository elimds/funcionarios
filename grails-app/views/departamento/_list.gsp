<table id="tblDepartamentos">
		<colgroup>
			<col width="30%">
			<col width="13%">
			<col width="12%">
			<col width="30%">
			<col width="15%">
		</colgroup>
	<thead>
		<tr>
			<th>Nome</th>
			<th>Sigla</th>
			<th>Ramal</th>
			<th>Chefe</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${departamentos?.size() >0 }">
			<g:each var="departamento" in="${departamentos}">
			<tr>
				<td>${departamento?.nome}</td>
				<td>${departamento?.sigla}</td>
				<td>${departamento?.ramal}</td>
				<td>${departamento?.chefe}</td>
				<td>
					<nav>
						<g:remoteLink controller="departamento" action="editar" id="${departamento.id }" 
								update="departamentoCreation" >Editar</g:remoteLink>
						<g:remoteLink controller="departamento" action="excluir" id="${departamento.id }" 
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
