<div class="top-bar">
	<h3><i class="icon-list"></i> Contatos</h3>
</div>
<div class="well no-padding">
	<table id="tblDepartamentos" class="data-table">
		<thead>
			<tr>
				<th>Tipo</th>
				<th>Contato</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each var="contato" in="${funcionarioInstance?.contatos}">
				<tr>
					<td>${contato?.tipo?.id}</td>
					<td>${contato?.valor}</td>
					<td>
						<nav>
							<g:remoteLink controller="funcionario" action="editarContato" id="${contato.id }" 
									update="contatoCreate" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>&nbsp;&nbsp;
							<g:remoteLink controller="funcionario" action="excluirContato" id="${contato.id }" 
									update="dvMensagem" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
									onSuccess="carregarListaContatos()" method="DELETE" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
						</nav>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
