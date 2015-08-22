<div class="top-bar">
	<h3><i class="icon-list"></i> Titulações</h3>
</div>
<div class="well no-padding">
	<table id="tblEnderecos" class="data-table">
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
									update="enderecoCreate" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>
							<g:remoteLink controller="funcionario" action="excluirEndereco" id="${endereco.id }" 
									update="dvMensagemEndereco" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
									onSuccess="carregarListaEnderecos()" method="DELETE" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
						</nav>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
