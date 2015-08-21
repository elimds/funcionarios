<table id="tblEnderecos">
		<colgroup>
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
		</colgroup>
	<thead>
		<tr>
			<th>Rua</th>
			<th>Complemento</th>
			<th>Bairro</th>
			<th>Cidade</th>
			<th>Estado</th>
			<th>CEP</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${funcionarioInstance?.enderecos?.size() >0 }">
			<g:each var="endereco" in="${funcionarioInstance?.enderecos}">
			<tr>
				<td>${endereco?.rua} ${endereco?.numero?.toString() }</td>
				<td>${endereco?.complemento }</td>
				<td>${endereco?.bairro }</td>
				<td>${endereco?.cidade?.nome }</td>
				<td>${endereco?.estado?.sigla }</td>
				<td>${endereco?.cep }</td>
				<td>
					<nav>
						<g:remoteLink controller="funcionario" action="editarEndereco" id="${endereco?.id }" 
								update="enderecoCreate">Editar</g:remoteLink>
						<g:remoteLink controller="funcionario" action="excluirEndereco" id="${endereco.id }" 
								update="dvMensagemEndereco" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarListaEnderecos()" method="DELETE" >Excluir</g:remoteLink>
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
