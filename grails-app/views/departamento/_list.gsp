<div class="top-bar">
	<h3><i class="icon-list"></i> Departamentos</h3>
</div>
<div class="well no-padding">
	<table id="tblDepartamentos" class="data-table">
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
			<g:each var="departamento" in="${departamentos}">
			<tr>
				<td>${departamento?.nome}</td>
				<td>${departamento?.sigla}</td>
				<td>${departamento?.ramal}</td>
				<td>${departamento?.chefe}</td>
				<td>
					<nav>
						<g:remoteLink controller="departamento" action="editar" id="${departamento.id }" 
								update="departamentoCreation" ><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>&nbsp;&nbsp;
						<g:remoteLink controller="departamento" action="excluir" id="${departamento.id }" 
								update="dvMensagem" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarLista()" method="DELETE" ><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
					</nav>
				</td>
			</tr>
			</g:each>
		</tbody>
	</table>
</div>
