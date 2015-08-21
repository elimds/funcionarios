<div class="top-bar">
	<h3><i class="icon-list"></i> Departamentos</h3>
</div>
<div class="well no-padding">
	<table id="tblTitulacoes" class="data-table">
		<thead>
			<tr>
				<th>Descrição</th>
				<th>Grau</th>
				<th>Carga Horária</th>
				<th>Instituição</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
			<g:each var="titulacao" in="${titulacoes}">
			<tr>
				<td>${titulacao?.descricao}</td>
				<td>${titulacao?.grau?.name()	}</td>
				<td>${titulacao?.cargaHoraria}</td>
				<td>${titulacao?.instituicao}</td>
				<td>
					<nav>
						<g:remoteLink controller="titulacao" action="editar" id="${titulacao?.id }" 
								update="titulacaoCreation" ><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>&nbsp;&nbsp;
						<g:remoteLink controller="titulacao" action="excluir" id="${titulacao?.id }" 
								update="dvMensagem" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarLista()" method="DELETE" ><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
					</nav>
				</td>
			</tr>
			</g:each>
		</tbody>
	</table>
</div>
