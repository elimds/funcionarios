<div class="top-bar">
	<h3><i class="icon-list"></i> Titulações</h3>
</div>
<div class="well no-padding">
	<table id="tblTitulacao" class="data-table">
		<thead>
			<tr>
				<th>Descricao</th>
				<th>Grau</th>
				<th>Carga Horária</th>
				<th>Instituição</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each var="titulacao" in="${funcionarioInstance?.titulacoes}">
				<tr>
					<td>${titulacao?.descricao}</td>
					<td>${titulacao?.grau}</td>
					<td>${titulacao?.cargaHoraria}</td>
					<td>${titulacao?.instituicao}</td>
					<td>
						<nav>
							<g:remoteLink controller="funcionario" action="editarTitulacao" id="${titulacao?.id }" 
									update="titulacaoCreate" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>&nbsp;&nbsp;
							<g:remoteLink controller="funcionario" action="excluirTitulacao" id="${titulacao.id }" 
									update="dvMensagemTitulacao" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
									onSuccess="carregarListaTitulacoes()" method="DELETE" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
						</nav>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
