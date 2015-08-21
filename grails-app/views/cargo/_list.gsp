<div class="top-bar">
	<h3><i class="icon-list"></i> Cargos</h3>
</div>
<div class="well no-padding">
	<table id="tblCargos" class="data-table">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Classe</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
			<g:each var="cargo" in="${cargos}">
				<tr>
					<td>${cargo?.nome}</td>
					<td>${cargo?.classe}</td>
					<td>
						<nav>
							<g:remoteLink controller="cargo" action="editar" id="${cargo?.id }" 
									update="cargoCreation" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>&nbsp;&nbsp;
							<g:remoteLink controller="cargo" action="excluir" id="${cargo?.id }" 
									update="dvMensagem" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
									onSuccess="carregarLista()" method="DELETE" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
						</nav>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>