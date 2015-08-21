<table id="tblTitulacao">
		<colgroup>
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
		</colgroup>
	<thead>
		<tr>
			<th>Descricao</th>
			<th>Grau</th>
			<th>Carga Horária</th>
			<th>Instituição</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${funcionarioInstance?.titulacoes?.size() >0 }">
			<g:each var="titulacao" in="${funcionarioInstance?.titulacoes}">
			<tr>
				<td>${titulacao?.descricao}</td>
				<td>${titulacao?.grau}</td>
				<td>${titulacao?.cargaHoraria}</td>
				<td>${titulacao?.instituicao}</td>
				<td>
					<nav>
						<g:remoteLink controller="titulacao" action="editar" id="${titulacao.id }" 
								update="titulacaoCreation" >Editar</g:remoteLink>
						<g:remoteLink controller="titulacao" action="excluir" id="${titulacao.id }" 
								update="dvMensagemTitulacao" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarListaTitulcacao()" method="DELETE" >Excluir</g:remoteLink>
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